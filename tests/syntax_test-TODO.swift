// SYNTAX TEST "Swift.sublime-syntax"

func set(_: Int) -> Int { 0 }
func f2(set: (Int) -> Void) {}

    f2(set: { _ in set(0)})
//  ^^ variable.function.swift
//              ^^ keyword.other.closure-signature-in.swift
//                 ^^^ variable.function.swift

//
// labeled-statement
//
label: for _ in 0...5 {}
label: while true {}
label: repeat {} while true

label: if true { }
label: switch 0 { default: break }
label: do { }
