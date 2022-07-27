// SYNTAX TEST "Swift.sublime-syntax"

func set(_: Int) -> Int { 0 }
func f2(set: (Int) -> Void) {}

    f2(set: { _ in set(0)})
//                 ^^^ variable.function.swift
