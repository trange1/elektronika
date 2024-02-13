!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  msi_langs.res
! 
!  PTC.Setup dialog to allow users select langs for msi installs 
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  03-Apr-00           MAZ          Created.
!  10-Apr-00 I-03-28+  JJE   $$1    Group Submission
!  27-Apr-00 I-03-28+  MAZ   $$2    Change Title.Label
!  06_Sep-00           MAZ          Add a check box for ext reg
!  18-Sep-00 J-01-18   TWH   $$3    Group Submission
!  19-Jan-01 J-01-26+  TWH   $$4    Commentout lang buttons awaiting NT fix
!  09-Feb-01 J-01-27   MAZ   $$5    Use setup bitmap (SPR 819661) 
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Dialog msi_langs
    (Components
        (SubLayout                      Layout1)
    )

    (Resources
        (.Bitmap                        "setup")
        (.Label                         "")
        (.DefaultButton                 "OkBtn")
        (.Layout
            (Grid (Rows 1) (Cols 1)
                Layout1
            )
        )
    )
)

(Layout Layout1
    (Components
        (SubLayout                      Layout2)
        (SubLayout                      Layout3)
        (PushButton                     OkBtn)
    )

    (Resources
        (OkBtn.Label                    "     OK     ")
        (OkBtn.TopOffset                10)
        (OkBtn.BottomOffset             15)
        (.Layout
            (Grid (Rows 1 1 1) (Cols 1)
                Layout2
                Layout3
                OkBtn
            )
        )
    )
)

(Layout Layout2
    (Components
        (CheckButton                    lang_usascii)
!        (CheckButton                    lang_french)
!        (CheckButton                    lang_german)
!        (CheckButton                    lang_italian)
!        (CheckButton                    lang_spanish)
!        (CheckButton                    lang_japanese)
!        (CheckButton                    lang_korean)
!        (CheckButton                    lang_chinese_cn)
!        (CheckButton                    lang_chinese_tw)
    )

    (Resources
        (lang_usascii.Label             "English")
        (lang_usascii.AttachLeft        True)
!        (lang_french.Label              "French")
!        (lang_french.AttachLeft         True)
!        (lang_german.Label              "German")
!        (lang_german.AttachLeft         True)
!        (lang_italian.Label             "Italian")
!        (lang_italian.AttachLeft        True)
!        (lang_spanish.Label             "Spanish")
!        (lang_spanish.AttachLeft        True)
!        (lang_japanese.Label            "Japanese")
!        (lang_japanese.AttachLeft       True)
!        (lang_korean.Label              "Korean")
!        (lang_korean.AttachLeft         True)
!        (lang_chinese_cn.Label          "Chinese_cn")
!        (lang_chinese_cn.AttachLeft     True)
!        (lang_chinese_tw.Label          "Chinese_tw")
!        (lang_chinese_tw.AttachLeft     True)
        (.Label                         "Select Languages to be Installed")
        (.Decorated                     True)
        (.TopOffset                     10)
        (.BottomOffset                  10)
        (.LeftOffset                    10)
        (.RightOffset                   10)
        (.Layout
!            (Grid (Rows 1 1 1) (Cols 1 1 1)
            (Grid (Rows 1) (Cols 1)
                lang_usascii
!                lang_french
!                lang_german
!                lang_italian
!                lang_spanish
!                lang_japanese
!                lang_korean
!                lang_chinese_cn
!                lang_chinese_tw
            )
        )
    )
)

(Layout Layout3
    (Components
        (CheckButton                    postcfg)
        (CheckButton                    typereg)
    )

    (Resources
        (postcfg.Label                  "Use PTC.Setup for Post Configuration?")
        (postcfg.AttachLeft             True)
        (typereg.Label                  "Register PTC file types and extensions?
Please view <CD_PATH>\ptc_inst\extensions.csv
for a list of file types to be registered.")
        (typereg.AttachLeft             True)
        (.Label                         "Installation Options")
        (.Decorated                     True)
        (.TopOffset                     10)
        (.BottomOffset                  10)
        (.LeftOffset                    10)
        (.RightOffset                   10)
        (.Layout
            (Grid (Rows 1 1) (Cols 1)
                postcfg
                typereg
            )
        )
    )
)
