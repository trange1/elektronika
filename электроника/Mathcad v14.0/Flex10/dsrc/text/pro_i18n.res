! This is 'pro_i18n.res' file.
! It is used for Internationalization of
! Pro family of products such as Pro/Engineer.
!
! This file will only ever be found in the $PRO_DIRECTORY/text directory.
!
! The commented lines are already hardcoded into the application;
! add new lines without a comment prefix (!) to extend the list of
! recognized "language locale" pairs.
!--------------------------------------------------------------------------
! Change History
! 26-Aug-02 J-03-32 ECW       $$1 Remove Hitachi, NEC, IBM, Alpha sections. Update Linux, Solaris.
! 26-Nov-02 J-03-39 ECW       $$2 Add @euro and iso885915 locales.
! 20-Jun-03 K-01-09 TGH       $$3 Removed zh_TW.EUC (SPR 1024516)
! 10-May-04 K-03-01 TWH       $$4 Add win32 system regional locale settings
! 12-May-04 K-03-01 PMORK     $$5 Added Eastern European locales
! 26-May-05 K-03-24 JSP       $$6 Added en_US.UTF-8 for Linux
! 13-Jul-05 K-03-28 AUC/PMORK $$7 Added french, german, italian, spanish locales for Linux
!                                 Cleaned up formating. Added EE languages to Windows
!                                 specific section.
! 26-Jul-05 K-03-29 JSP	      $$8 Remove en_US.UTF-8 for Linux
! 07-Sep-05 K-03-31 PMORK     $$9 Reference to an internal function removed from a comment


[LOCALE]

! Do NOT un-comment this sub-section.
! {DEFAULT}
!    USASCII usascii
!    USASCII C
!    JAPANESE japanese
!    FRENCH french
!    GERMAN german
!    RUSSIAN russian
!    RUSSIAN ru
!    ITALIAN italian
!    SPANISH spanish
!    GENERIC_LANG usascii
!    KOREAN korean
!    CHINESE_TW chinese_tw
!    CHINESE_CN chinese_cn
!    GENERIC_LANG_SB usascii
!    HEBREW hebrew
!    GREEK greek
!    TURKISH turkish
!    CZECH czech
!    POLISH polish
!    HUNGARIAN hungarian
!    SLOVENIAN slovenian
!    PORTUGUESE portuguese
!    SLOVAK slovak

  {WINDOWS}
!    CHINESE_TW	cht
!    CHINESE_TW	chinese-traditional
!    CHINESE_CN	chs
!    CHINESE_CN	chinese-simplified
!    HEBREW	hebrew

! Windows specific section
!
! Starting from K-03-01, Pro/ENGINEER on Windows queries the current 
! user locale and attempts to map it to a valid Pro/ENGINEER language. 
! The mapping is based on the language entries listed below.
! 
! This language auto-detect mechanism is disabled if either the LANG 
! or PRO_LANG variable is defined.
! 
! Entry values of this list are based on: http://msdn.microsoft.com/
!              library/default.asp?url=/library/en-us/intl/nls_238z.asp
!
    CHINESE_TW 0x0404
    CHINESE_CN 0x0804
    CHINESE_CN 0x0c04
    CHINESE_CN 0x1004
    CHINESE_CN 0x1404
    FRENCH 0x040c
    FRENCH 0x080c
    FRENCH 0x0c0c
    FRENCH 0x100c
    FRENCH 0x140c
    FRENCH 0x180c
    GERMAN 0x0407
    GERMAN 0x0807
    GERMAN 0x0c07
    GERMAN 0x1007
    GERMAN 0x1407
    HEBREW 0x040d
    ITALIAN 0x0410
    ITALIAN 0x0810
    JAPANESE 0x0411
    KOREAN 0x0412
    KOREAN 0x0812
    RUSSIAN 0x0419
    SPANISH 0x040a
    SPANISH 0x080a
    SPANISH 0x0c0a
    SPANISH 0x100a
    SPANISH 0x140a
    SPANISH 0x180a
    SPANISH 0x1c0a
    SPANISH 0x200a
    SPANISH 0x240a
    SPANISH 0x280a
    SPANISH 0x2c0a
    SPANISH 0x300a
    SPANISH 0x340a
    SPANISH 0x380a
    SPANISH 0x3c0a
    SPANISH 0x400a
    SPANISH 0x440a
    SPANISH 0x480a
    SPANISH 0x4c0a
    SPANISH 0x500a
    GREEK 0x0408
    TURKISH 0x041f
    CZECH 0x0405
    POLISH 0x0415
    HUNGARIAN 0x040e
    SLOVENIAN 0x0424
    PORTUGUESE 0x0416
    PORTUGUESE 0x0816
    SLOVAK 0x041b

  {SOLARIS}
     ENGLISH	en
!    ENGLISH	en_AU
     ENGLISH	en_AU.ISO8859-1
     ENGLISH	en_CA.ISO8859-1
!    ENGLISH	en_CA
!    ENGLISH	en_UK
!    ENGLISH	en_US
     ENGLISH	en_US.ISO8859-1
     ENGLISH	en_US.ISO8859-15
     ENGLISH	en_US.ISO8859-15@euro
!    ENGLISH	en_IE
     ENGLISH	en_IE.ISO8859-1
     ENGLISH	en_IE.ISO8859-15
     ENGLISH	en_IE.ISO8859-15@euro
!    ENGLISH	en_NZ
     ENGLISH	en_NZ.ISO8859-1
!    ENGLISH	en_GB
     ENGLISH	en_GB.ISO8859-1
     ENGLISH	en_GB.ISO8859-15
     ENGLISH	en_GB.ISO8859-15@euro
!    JAPANESE	ja
     JAPANESE	ja_JP
     JAPANESE	ja_JP.eucJP
     JAPANESE	japan
     JAPANESE	japanese
!    FRENCH     fr
     FRENCH     fr_FR
     FRENCH     fr_FR.ISO8859-1
     FRENCH     fr_FR.ISO8859-15
     FRENCH     fr_FR.ISO8859-15@euro
!    FRENCH     fr_BE
     FRENCH     fr_BE.ISO8859-1
     FRENCH     fr_BE.ISO8859-15
     FRENCH     fr_BE.ISO8859-15@euro
!    FRENCH     fr_CA
     FRENCH     fr_CA.ISO8859-1
!    FRENCH     fr_CH
     FRENCH     fr_CH.ISO8859-1
!    GERMAN     de
     GERMAN     de_DE
     GERMAN     de_DE.ISO8859-15@euro
     GERMAN     de_AT
     GERMAN 	de_DE.ISO8859-1
     GERMAN 	de_DE.ISO8859-15
     GERMAN 	de_AT.ISO8859-15@euro
     GERMAN 	de_AT.ISO8859-15
     GERMAN 	de_AT.ISO8859-1
     GERMAN 	de_CH.ISO8859-1
!    GERMAN 	de_CH
!    ITALIAN	it
     ITALIAN	it_IT
     ITALIAN    it_IT.ISO8859-15
     ITALIAN    it_IT.ISO8859-15@euro
     ITALIAN	it_CH
!    SPANISH	es
!    SPANISH	es_AR
!    SPANISH	es_BO
!    SPANISH	es_CL
!    SPANISH	es_CO
!    SPANISH	es_CR
!    SPANISH	es_EC
!    SPANISH	es_GT
!    SPANISH	es_MX
!    SPANISH	es_NI
!    SPANISH	es_PA
!    SPANISH	es_PE
!    SPANISH	es_PY
!    SPANISH	es_SV
!    SPANISH	es_UY
!    SPANISH	es_VE
     SPANISH    es_ES.ISO8859-15
     SPANISH    es_ES.ISO8859-15@euro
!    KOREAN 	ko
!    KOREAN 	korean
     KOREAN 	ko_KR.EUC
     CHINESE_TW	zh_TW
     CHINESE_TW	tchinese
!    CHINESE_TW	zh_TW.BIG5	// Solaris 2.6
!    CHINESE_TW	zh_TW.big5	// Solaris 2.5.1
!    CHINESE_TW	big5		// Solaris 2.5.1
!    CHINESE_CN	zh
!    CHINESE_CN	zh_CN.EUC
!    CHINESE_CN	chinese
!    HEBREW 	he
     HEBREW 	he_IL
     HEBREW 	he_IL.ISO8859-8
!    GREEK      el
!    GREEK      el_GR
!    GREEK      el_GR.ISO8859-7
!    GREEK      el_GR.ISO8859-7@euro
!    TURKISH    tr
!    TURKISH    tr_TR
!    TURKISH    tr_TR.ISO8859-9
!    CZECH      cz
!    CZECH      cs_CZ
!    CZECH      cs_CZ.ISO8859-2
!    POLISH     pl
!    POLISH     pl_PL
!    POLISH     pl_PL.ISO8859-2
!    HUNGARIAN  hu
!    HUNGARIAN  hu_HU
!    HUNGARIAN  hu_HU.ISO8859-2
!    SLOVENIAN  sl
!    SLOVENIAN  sl_SI
!    SLOVENIAN  sl_SI.ISO8859-2
!    PORTUGUESE pt
!    PORTUGUESE pt.ISO8859-15
!    PORTUGUESE pt_PT
!    PORTUGUESE pt_PT.ISO8859-1
!    PORTUGUESE pt_PT.ISO8859-15
!    PORTUGUESE pt_PT.ISO8859-15@euro
!    SLOVAK     sk
!    SLOVAK     sk_SK
!    SLOVAK     sk_SK.ISO8859-2

  {HP}
!    ENGLISH	C.iso88591
!    ENGLISH	english
!    ENGLISH	english.iso88591
!    ENGLISH	en_GB.iso88591
!    ENGLISH	en_US.iso88591
!    JAPANESE	japanese.euc
!    JAPANESE	ja_JP.eucJP
!    FRENCH 	c-french
!    FRENCH 	c-french.iso88591
!    FRENCH 	french
!    FRENCH 	french.iso88591
!    FRENCH 	fr_CA.iso88591
!    FRENCH 	fr_FR.iso88591
     FRENCH 	fr_FR.iso885915@euro
!    GERMAN     german
!    GERMAN 	german.iso88591
     GERMAN 	de_DE.iso885915@euro
!    GERMAN 	de_DE.iso88591
!    ITALIAN	italian
!    ITALIAN	italian.iso88591
!    ITALIAN	it_IT.iso88591
     ITALIAN	it_IT.iso885915@euro
!    SPANISH	spanish
!    SPANISH	spanish.iso88591
!    SPANISH	es_ES.iso88591
     SPANISH	es_ES.iso885915@euro
!    KOREAN 	ko_KR.eucKR
!    CHINESE_TW	zh_TW.big5
!    CHINESE_CN	zh_CN.hp15CN
!    HEBREW 	iw_IL.hebrew8
!    HEBREW 	iw_IL.iso88598
!    GREEK      el_GR.greek8
!    GREEK      el_GR.iso88597
!    TURKISH    tr_TR.turkish8
!    TURKISH    tr_TR.iso88599
!    CZECH      cs_CZ.iso88592
!    POLISH     pl_PL.iso88592
!    HUNGARIAN  hu_HU.iso88592
!    SLOVENIAN  sl_SI.iso88592
!    PORTUGUESE pt_PT.iso88591
!    PORTUGUESE pt_PT.iso885915@euro
!    SLOVAK     sk_SK.iso88592

  {SGI}
!    ENGLISH	en
     ENGLISH    en_US.ISO8859-15
     ENGLISH    en_GB.ISO8859-15
     ENGLISH    en_CA.ISO8859-15
     ENGLISH    en_AU.ISO8859-15
!    ENGLISH    en_AU
!    ENGLISH	en_CA
!    ENGLISH	en_US
!    JAPANESE	ja_JP.EUC
!    FRENCH 	fr
!    FRENCH 	fr_BE
     FRENCH     fr_BE.ISO8859-15
     FRENCH     fr_FR.ISO8859-15
!    FRENCH     fr_CA
     FRENCH     fr_CA.ISO8859-15
     FRENCH     fr_CH.ISO8859-15
!    FRENCH 	fr_CH
!    GERMAN 	de
!    GERMAN 	de_AT
!    GERMAN 	de_CH
     GERMAN     de_AT.ISO8859-15
     GERMAN     de_CH.ISO8859-15
     GERMAN     de_DE.ISO8859-15
!    ITALIAN    it
!    ITALIAN	it_CH
     ITALIAN    it_CH.ISO8859-15
     ITALIAN	it_IT.ISO8859-15
!    SPANISH	es
!    SPANISH	es_AR
     SPANISH    es_AR.ISO8859-15
     SPANISH    es_ES.ISO8859-15
!    SPANISH	es_MX
     SPANISH    es_MX.ISO8859-15
!    KOREAN 	ko_KR.euc
!    CHINESE_TW	zh_TW.big5
!    CHINESE_CN	zh_CN.gbk
!    CHINESE_CN	zh_CN.eucgbk
!    CHINESE_CN	zh_CN.ugb
!    HEBREW 	iw
!    GREEK      el
!    TURKISH    tr
!    CZECH      cz
!    POLISH     pl
!    HUNGARIAN  hu
!    SLOVENIAN  sl
!    PORTUGUESE pt
!    PORTUGUESE pt_PT.ISO8859-15
!    SLOVAK     sk

  {LINUX}
     ENGLISH    en_CA
     ENGLISH    en_GB
     ENGLISH    en_GB.iso885915
     ENGLISH    en_NZ
     ENGLISH    en_IE
     ENGLISH    en_IE@euro
     ENGLISH    en_US
     ENGLISH    en_US.iso885915
     SPANISH    es_ES@euro
     SPANISH    es_ES
     SPANISH    spanish
     SPANISH	es_AR
     SPANISH	es_BO
     SPANISH	es_CL
     SPANISH	es_CO
     SPANISH	es_CR
     SPANISH	es_DO
     SPANISH	es_HN
     SPANISH	es_EC
     SPANISH	es_GT
     SPANISH	es_MX
     SPANISH	es_NI
     SPANISH	es_PA
     SPANISH	es_PE
     SPANISH	es_PR
     SPANISH	es_PY
     SPANISH	es_SV
     SPANISH	es_US
     SPANISH	es_UY
     SPANISH	es_VE
     SPANISH    es_ES.ISO8859-15
     SPANISH    es_ES.ISO8859-15@euro
     FRENCH     fr_FR
     FRENCH     fr_FR@euro
     FRENCH     fr_BE
     FRENCH     fr_BE@euro
     FRENCH     fr_CA
     FRENCH     fr_CH
     FRENCH     fr_LU
     FRENCH     fr_LU@euro
     FRENCH     french
     GERMAN     german
     GERMAN     de_AT
     GERMAN     de_AT@euro
     GERMAN     de_DE
     GERMAN     de_DE@euro
     GERMAN     de_BE
     GERMAN     de_BE@euro
     GERMAN     de_CH
     GERMAN     de_LU
     GERMAN     de_LU@euro
     GERMAN     deutsch
     HEBREW     he_IL
     HEBREW     hebrew
     ITALIAN    it_IT
     ITALIAN    it_IT@euro
     ITALIAN    it_CH
     ITALIAN    italian
     JAPANESE   ja_JP
     JAPANESE   ja_JP.eucjp
     JAPANESE   japanese
     JAPANESE   japanese.euc
     KOREAN     ko_KR
     KOREAN     ko_KR.euckr
     KOREAN     korean
     KOREAN     korean.euc
     CHINESE_TW zh_TW
     CHINESE_TW zh_TW.euctw
     CHINESE_CN zh_CN
     CHINESE_CN zh_CN.gbk
!    GREEK      el_GR
!    GREEK      greek
!    TURKISH    tr_TR
!    TURKISH    turkish
!    CZECH      cs_CZ
!    CZECH      czech
!    POLISH     pl_PL
!    POLISH     polish
!    HUNGARIAN  hu_HU
!    HUNGARIAN  hungarian
!    SLOVENIAN  sl_SI
!    SLOVENIAN  slovenian
!    SLOVENIAN  slovene
!    PORTUGUESE pt_PT
!    PORTUGUESE pt_PT@euro
!    PORTUGUESE portuguese
!    SLOVAK     sk_SK
!    SLOVAK     slovak


