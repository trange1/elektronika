!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
!
!  flexlm.res
!
!  Flex Dialog 
!
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  16-Apr-99           TWH          Created.
!  11-May-99 I-03-09   JJE   $$1    Group Submission
!  21-Dec-99           TWH          CBReguardless, use "OK"
!  22-Dec-99 I-03-24+  JJE   $$2    Group Submission
!  03-Jan-00           TWH          Widen Tree Layout
!  04-Jan-00 I-03-25+  JJE   $$3    Group Submission
!  07-Feb-00           JJE          Fix button label
!  08-Feb-00           JJE          Add setup bitmap
!  09-Feb-00 I-03-26+  JJE   $$4    Group Submission
!  04-Jan-01 J-01-25   TWH   $$5    modify label "License Options"
!  25-Oct-01 J-01-39   TWH   $$6    Fix resizeability
!  06-Jan-03 J-03-40   ALG   $$7    Add AlwaysAbove, DefaultButton; Fix title
!  22-Jan-03 J-03-41   TWH   $$8    Chg labels again
!  02-Jun-03 K-01-07+  TWH   $$9    Fix AlwaysAbove
!  04-Aug-05 K-03-30   TWH   $$10   FLEXlm -> FLEXnet
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Dialog flexlm
    (Components
        (SubLayout                      Layout1)
        (SubLayout                      Layout2)
        (SubLayout                      Layout3)
        (StdButton                      OkButton)
    )

    (Resources
        (OkButton.Label                 "&OK")
        (.Bitmap                        "setup")
        (.Label                         "FLEXnet License Info")
        (.DefaultButton                 "OkButton")
        (.AlwaysAbove                   "ptcsetup")
        (.Layout
            (Grid (Rows 0 0 1) (Cols 1)
                Layout2
                Layout1
                Layout3
            )
        )
    )
)

(Layout Layout1
    (Components
        (SubToolBar                     ToolBar1)
    )

    (Resources
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                ToolBar1
            )
        )
    )
)

(ToolBar ToolBar1
    (Components
        (CascadeButton                  CascadeButton1
                                        MenuPane1)
        (Label                          Label1)
        (CascadeButton                  CascadeButton2
                                        MenuPane2)
    )

    (Resources
        (CascadeButton1.Label           "Licenses to Run")
        (Label1.Label                   "     ")
        (CascadeButton2.Label           "Extensions and Options")
    )
)

(MenuPane MenuPane1
    (Components
        (RadioGroup                     FeatureGroup)
    )

    (Resources
        (FeatureGroup.Rows              15)
        (FeatureGroup.Columns           2)
        (FeatureGroup.SelectCBRegardless 1)
    )
)

(MenuPane MenuPane2
    (Components
        (RadioGroup                     OptionGroup)
    )

    (Resources
        (OptionGroup.SelectCBRegardless 1)
    )
)

(Layout Layout2
    (Components
        (Label                          LicFileLab)
    )

    (Resources
        (LicFileLab.Label               "Showing License file: 7788@Redrocks")
        (LicFileLab.ForegroundColor     12)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                LicFileLab
            )
        )
    )
)

(Layout Layout3
    (Components
        (Tree                           Tree1)
    )

    (Resources
        (Tree1.Rows                     16)
        (Tree1.Columns                  24)
        (Tree1.TopOffset                5)
        (Tree1.BottomOffset             5)
        (Tree1.LeftOffset               5)
        (Tree1.RightOffset              5)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                Tree1
            )
        )
    )
)

