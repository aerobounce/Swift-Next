#!/usr/bin/env bash
set -Ceu -o pipefail
# This script finds attributes used in Swift
# including private ones, based on keywords found in:
#
# - lib/Parse/ParseDecl.cpp
# - include/swift/AST/Attr.def
#

# Optional function to find @attributes declared in files.
ATTRIBUTES() {
    sort <(pcregrep \
        --buffer-size 99999 \
        --exclude-dir "\b(benchmark|tools|utils|test[s]?|validation-test)\b" \
        --include "\.(swift|def)" \
        --recursive \
        -o1 "$(PREFIX)(@\b\w+\b)$(POSTFIX)" \
        ~/Desktop/swift-swift-5.6-RELEASE \
        /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib/swift |
        awk -F ':' '{ print($2) }') |
        uniq
}

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

cd ~/Desktop/swift-swift-5.6-RELEASE

{
    pcregrep -o1 '"(_\w+)' "lib/Parse/ParseDecl.cpp"
    pcregrep -o1 "^\w+ATTR\((\w+)" "include/swift/AST/Attr.def"
} | sort | uniq |
    xargs -P 4 -I {} -n 1 sh -c "OCCURENCE '{}' '$PWD'"
