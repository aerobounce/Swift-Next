// SYNTAX TEST "Swift.sublime-syntax"

let mixedBase = """
    siebenhundertsiebenundsiebzigtausendsiebenhundertsiebenundsiebzig
    ๐๐ฉโ๐ฉโ๐งโ๐ง๐จโ๐จโ๐ฆโ๐ฆ๐บ๐ธ๐จ๐ฆ๐ฒ๐ฝ๐๐ป๐๐ผ๐๐ฝ๐๐พ๐๐ฟ
    siebenhundertsiebenundsiebzigtausendsiebenhundertsiebenundsiebzig
    ๐๐ฉโ๐ฉโ๐งโ๐ง๐จโ๐จโ๐ฆโ๐ฆ๐บ๐ธ๐จ๐ฆ๐ฒ๐ฝ๐๐ป๐๐ผ๐๐ฝ๐๐พ๐๐ฟthe quick brown fox๐๐ฟ๐๐พ๐๐ฝ๐๐ผ๐๐ป๐ฒ๐ฝ๐จ๐ฆ๐บ๐ธ๐จโ๐จโ๐ฆโ๐ฆ๐ฉโ๐ฉโ๐งโ๐ง๐
    siebenhundertsiebenundsiebzigtausendsiebenhundertsiebenundsiebzig
    ไปๅใฎใขใใใใผใใงSwiftใซๅคงๅนใชๆน่ฏใๆฝใใใๅฎๅฎใใฆใใฆใใใ็ดๆ็ใซไฝฟใใใจใใงใใAppleใใฉใใใใฉใผใ ๅใใใญใฐใฉใใณใฐ่จ่ชใซใชใใพใใใ
    Worst thing about working on String is that it breaks *everything*. Asserts, debuggers, and *especially* printf-style debugging ๐ญ
    Swift ๆฏ้ขๅ Apple ๅนณๅฐ็็ผ็จ่ฏญ่จ๏ผๅ่ฝๅผบๅคงไธ็ด่งๆ็จ๏ผ่ๆฌๆฌกๆดๆฐๅฏนๅถ่ฟ่กไบๅจ้ขไผๅใ
    siebenhundertsiebenundsiebzigtausendsiebenhundertsiebenundsiebzig
    ์ด๋ฒ ์๋ฐ์ดํธ์์๋ ๊ฐ๋ ฅํ๋ฉด์๋ ์ง๊ด์ ์ธ Apple ํ๋ซํผ์ฉ ํ๋ก๊ทธ๋๋ฐ ์ธ์ด์ธ Swift๋ฅผ ์๋ฒฝํ ๊ฐ์ ํ์์ต๋๋ค.
    Worst thing about working on String is that it breaks *everything*. Asserts, debuggers, and *especially* printf-style debugging ๐ญ
    ะฒ ัะฐัะฐั ัะณะฐ ะถะธะป-ะฑัะป ัะธัััั? ะดะฐ, ะฝะพ ัะฐะปััะธะฒัะน ัะบะทะตะผะฟะปัั
    siebenhundertsiebenundsiebzigtausendsiebenhundertsiebenundsiebzig
    \u{201c}Hello\u{2010}world\u{2026}\u{201d}
    \u{300c}\u{300e}ไปๆฅใฏ\u{3001}ไธ็\u{3002}\u{300f}\u{300d}
    Worst thing about working on String is that it breaks *everything*. Asserts, debuggers, and *especially* printf-style debugging ๐ญ

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
