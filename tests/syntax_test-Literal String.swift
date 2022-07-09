// SYNTAX TEST "Swift.sublime-syntax"

let mixedBase = """
    siebenhundertsiebenundsiebzigtausendsiebenhundertsiebenundsiebzig
    👍👩‍👩‍👧‍👧👨‍👨‍👦‍👦🇺🇸🇨🇦🇲🇽👍🏻👍🏼👍🏽👍🏾👍🏿
    siebenhundertsiebenundsiebzigtausendsiebenhundertsiebenundsiebzig
    👍👩‍👩‍👧‍👧👨‍👨‍👦‍👦🇺🇸🇨🇦🇲🇽👍🏻👍🏼👍🏽👍🏾👍🏿the quick brown fox👍🏿👍🏾👍🏽👍🏼👍🏻🇲🇽🇨🇦🇺🇸👨‍👨‍👦‍👦👩‍👩‍👧‍👧👍
    siebenhundertsiebenundsiebzigtausendsiebenhundertsiebenundsiebzig
    今回のアップデートでSwiftに大幅な改良が施され、安定していてしかも直感的に使うことができるAppleプラットフォーム向けプログラミング言語になりました。
    Worst thing about working on String is that it breaks *everything*. Asserts, debuggers, and *especially* printf-style debugging 😭
    Swift 是面向 Apple 平台的编程语言，功能强大且直观易用，而本次更新对其进行了全面优化。
    siebenhundertsiebenundsiebzigtausendsiebenhundertsiebenundsiebzig
    이번 업데이트에서는 강력하면서도 직관적인 Apple 플랫폼용 프로그래밍 언어인 Swift를 완벽히 개선하였습니다.
    Worst thing about working on String is that it breaks *everything*. Asserts, debuggers, and *especially* printf-style debugging 😭
    в чащах юга жил-был цитрус? да, но фальшивый экземпляр
    siebenhundertsiebenundsiebzigtausendsiebenhundertsiebenundsiebzig
    \u{201c}Hello\u{2010}world\u{2026}\u{201d}
    \u{300c}\u{300e}今日は\u{3001}世界\u{3002}\u{300f}\u{300d}
    Worst thing about working on String is that it breaks *everything*. Asserts, debuggers, and *especially* printf-style debugging 😭

    """

  """ \0 \\ \t \n \r \" \' \u{12345678} \u{abcdefAB} """
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.swift string.quoted.double.block.swift
//^^^ punctuation.definition.string.begin.swift
//   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ invalid.illegal.content-must-begin-on-a-new-line.swift
//                                                   ^^^ punctuation.definition.string.end.swift

  #""" \0 \\ \t \n \r \" \' \u{12345678} \u{abcdefAB} """#
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.swift string.quoted.double.block.swift
//^ punctuation.definition.annotation.begin.swift
// ^^^ punctuation.definition.string.begin.swift
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ invalid.illegal.content-must-begin-on-a-new-line.swift
//                                                    ^^^ punctuation.definition.string.end.swift
//                                                       ^ punctuation.definition.annotation.end.swift

  """ \0 \\ \t \n \r \" \' \u{12345678} \u{abcdefAB} """
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.swift string.quoted.double.block.swift
//^^^ punctuation.definition.string.begin.swift
//   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ invalid.illegal.content-must-begin-on-a-new-line.swift
//                                                   ^^^ punctuation.definition.string.end.swift

  """
  \0 \\ \t \n \r \" \' \u{12345} \u{abfAB} """

  """
   \
  invalid \ newline \
  invalid \ newline \
  """ //            ^ This is invalid as it is on the last line.

  #"""
   \
  Those are all valid slashes \ newline \
  Those are all valid slashes \ newline \
  """#

  " \ invalid \ newline \ "
//^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.swift string.quoted.double.swift
//^ punctuation.definition.string.begin.swift
//  ^ invalid.illegal.invalid-escape-sequence.swift
//            ^ invalid.illegal.invalid-escape-sequence.swift
//                      ^ invalid.illegal.invalid-escape-sequence.swift
//                        ^ punctuation.definition.string.end.swift
