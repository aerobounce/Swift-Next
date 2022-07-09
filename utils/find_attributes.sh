#!/usr/bin/env bash
set -Ceu -o pipefail

cd ~/Downloads/swift-swift-5.6-RELEASE

OCCURENCE() {
    readonly EXCLUDES=(
        # SIL-specific attributes
        block_storage
        box
        dynamic_self
        error
        out
        in
        inout
        inout_aliasable
        in_guaranteed
        in_constant
        owned
        unowned_inner_pointer
        guaranteed
        autoreleased
        callee_owned
        callee_guaranteed
        objc_metatype
        opened
        pseudogeneric
        yields
        yield_once
        yield_many

        # SIL metatype attributes.
        thin
        thick

        # Generated interface attributes
        _opaqueReturnTypeOf

        # Plain keywords
        actor
        async
        convenience
        distributed
        dynamic
        final
        indirect
        infix
        isolated
        lazy
        mutating
        nonisolated
        nonmutating
        override
        postfix
        prefix
        private
        required
        weak
    )
    PREFIX() { echo '(?:^|^(?!\s*//)[^/]*?[\s\(\)])'; }
    # Do not match test lines for invalid syntax
    POSTFIX() { echo '(?:$|[\s\(\)])(?!.*expected-(?:error|warning).*)'; }

    for exclude in "${EXCLUDES[@]}"; do
        if [[ $exclude == "$1" ]]; then exit; fi
    done

    set -Ceu +o pipefail
    cd "$2"

    with_atmark=$(pcregrep --include "\.swift$" --recursive -o1 "$(PREFIX)(@$1)$(POSTFIX)" . |
        head -1 |
        awk -F ':' '{ print($2, "-", $1) }')

    [[ $with_atmark != "" ]] && echo "$with_atmark" && exit 0

    pcregrep --include "\.swift$" --recursive -o1 "$(PREFIX)($1)$(POSTFIX)" . |
        head -1 |
        awk -F ':' '{ print($2, "-", $1) }'
}
export -f OCCURENCE

{
    pcregrep -o1 '"(_\w+)' "lib/Parse/ParseDecl.cpp"
    pcregrep -o1 "^\w+ATTR\((\w+)" "include/swift/AST/Attr.def"
} | sort | uniq |
    xargs -P 4 -I {} -n 1 sh -c "OCCURENCE '{}' '$(pwd)'"
