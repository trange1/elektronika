!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  ps_lic_sel.res
! 
!  License selection dialog
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  16-Feb-99 I-03-02   JJE   $$1    Group submission
!  30-Apr-99           JJE          Use images, scrap help text
!  11-May-99 I-03-09   JJE   $$2    Group Submission
!  07-Feb-00           JJE          Fix button label
!  08-Feb-00           JJE          Add setup bitmap
!  09-Feb-00 I-03-26+  JJE   $$3    Group Submission
!  04-Jan-01 J-01-25   TWH   $$4    Add DebugLayout
!  19-Jan-01 J-01-26+  TWH   $$5    Commentout DebugLayout awaiting NT fix
!  06-Jan-03 J-03-40   ALG   $$6    Add AlwaysAbove, DefaultButton
!  29-Apr-03 K-01-06   TWH   $$7    Rewrite
!  19-May-03 K-01-07   TWH          Layout changes Jason
!  19-May-03 K-01-07   TWH   $$8    chg symbol image bif names
!  02-Jun-03 K-01-07+  TWH   $$9    Fix always above
!  03-Nov-03 K-01-17   TWH   $$10   Set MaxLen values
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Dialog ps_lic_sel
    (Components
        (SubLayout                      CmdInfoLayout)
        (SubLayout                      Layout3)
        (SubLayout                      Layout4)
        (StdButton                      StdOK)
        (StdButton                      StdCancel)
        (Label                          Label1)
        (SubLayout                      Layout6)
        (Label                          Label15)
        (Label                          Label17)
    )

    (Resources
        (StdOK.Label                    "&OK")
        (StdCancel.Label                "&Cancel")
        (Label1.Label                   "Legend: <ltr> License to Run;  <ext> Startup Extensions;  <flt> Floating options")
        (Label1.AttachLeft              True)
        (Label1.AttachRight             True)
        (Label1.Alignment               0)
        (Label1.SymbolNames             "ltr"
                                        "ext"
                                        "flt")
        (Label1.SymbolImages            "ps_run_licenses"
                                        "ps_extension"
                                        "ps_floating_license")
        (.Bitmap                        "setup")
        (.Label                         "Select Licenses")
        (.Focus                         "CmdDesc1")
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.DefaultButton                 "StdOK")
        (.AlwaysAbove                   "ptcsetup")
        (.Layout
            (Grid (Rows 0 1 0) (Cols 1)
                CmdInfoLayout
                (Grid (Rows 1) (Cols 1 0 1)
                    Layout3
                    (Grid (Rows 1 0 1) (Cols 0)
                        Label17
                        Layout6
                        Label15
                    )
                    Layout4
                )
                Label1
            )
        )
    )
)

(Layout CmdInfoLayout
    (Components
        (RadioGroup                     CmdInfoGrp)
        (Label                          CmdInfoGrpLab)
        (SubLayout                      CmdInfo1)
    )

    (Resources
        (CmdInfoGrp.AttachRight         False)
        (CmdInfoGrp.Names               "1"
                                        "2")
        (CmdInfoGrp.Labels              "No ConfigID"
                                        "ConfigID")
        (CmdInfoGrp.Alignment           1)
        (CmdInfoGrpLab.Label            "License Scheme:")
        (CmdInfoGrpLab.AttachRight      True)
        (CmdInfoGrpLab.Alignment        1)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1) (Cols 1)
                (Grid (Rows 1) (Cols 1 1)
                    CmdInfoGrpLab
                    CmdInfoGrp
                )
                CmdInfo1
            )
        )
    )
)

(Layout CmdInfo1
    (Components
        (Label                          CmdName1Lab)
        (Label                          CmdDesc1Lab)
        (Label                          CmdType1Lab)
        (InputPanel                     CmdName1)
        (OptionMenu                     CmdType1)
        (InputPanel                     CmdDesc1)
    )

    (Resources
        (CmdName1Lab.Label              "Configuration Name:")
        (CmdName1Lab.AttachRight        True)
        (CmdName1Lab.Alignment          0)
        (CmdDesc1Lab.Label              "Configuration Description:")
        (CmdDesc1Lab.AttachLeft         True)
        (CmdDesc1Lab.AttachRight        True)
        (CmdDesc1Lab.Alignment          1)
        (CmdDesc1Lab.RightOffset        2)
        (CmdType1Lab.Label              "ConfigurationType:")
        (CmdType1Lab.AttachRight        True)
        (CmdType1Lab.Alignment          1)
        (CmdName1.MaxLen                64)
        (CmdType1.Columns               10)
        (CmdDesc1.MaxLen                256)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1) (Cols 1 1)
                CmdName1Lab
                (Grid (Rows 1) (Cols 1 1 1)
                    CmdName1
                    CmdType1Lab
                    CmdType1
                )
                CmdDesc1Lab
                CmdDesc1
            )
        )
    )
)

(Layout Layout3
    (Components
        (OptionMenu                     OptionMenu2)
        (List                           List3)
    )

    (Resources
        (OptionMenu2.TopOffset          5)
        (OptionMenu2.BottomOffset       5)
        (OptionMenu2.LeftOffset         3)
        (OptionMenu2.RightOffset        3)
        (List3.SelectionPolicy          4)
        (List3.TabStops                 3)
        (List3.ColumnLabel              "Type")
        (List3.ListType                 True)
        (List3.SymbolNames              "ltr"
                                        "ext"
                                        "flt")
        (List3.SymbolImages             "ps_run_licenses"
                                        "ps_extension"
                                        "ps_floating_license")
        (.Label                         "Available Licenses")
        (.Decorated                     True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.Layout
            (Grid (Rows 0 1) (Cols 1)
                OptionMenu2
                List3
            )
        )
    )
)

(Layout Layout4
    (Components
        (List                           List1)
        (PushButton                     ShuffleDown)
        (PushButton                     ShuffleUp)
        (List                           List2)
        (Label                          Label16)
        (Label                          Label3)
    )

    (Resources
        (List1.SelectionPolicy          4)
        (List1.TabStops                 2)
        (List1.SymbolNames              "ltr"
                                        "ext"
                                        "flt")
        (List1.SymbolImages             "ps_run_licenses"
                                        "ps_extension"
                                        "ps_floating_license")
        (ShuffleDown.Bitmap             "ps_wizard_down")
        (ShuffleDown.ButtonStyle        2)
        (ShuffleDown.AttachLeft         True)
        (ShuffleDown.AttachRight        True)
        (ShuffleDown.AttachTop          True)
        (ShuffleDown.KeyboardInput      True)
        (ShuffleUp.Bitmap               "ps_wizard_up")
        (ShuffleUp.ButtonStyle          2)
        (ShuffleUp.AttachLeft           True)
        (ShuffleUp.AttachRight          True)
        (ShuffleUp.AttachBottom         True)
        (ShuffleUp.KeyboardInput        True)
        (List2.SelectionPolicy          4)
        (List2.Mapped                   True)
        (List2.TabStops                 2)
        (List2.SymbolNames              "ltr"
                                        "ext"
                                        "flt")
        (List2.SymbolImages             "ps_run_licenses"
                                        "ps_extension"
                                        "ps_floating_license")
        (Label16.Label                  "Startup extensions && floating licenses")
        (Label16.Mapped                 True)
        (Label16.AttachLeft             True)
        (Label16.AttachRight            True)
        (Label16.AttachBottom           True)
        (Label16.Alignment              0)
        (Label16.BottomOffset           0)
        (Label3.Label                   "Licenses to Run")
        (Label3.Mapped                  True)
        (Label3.AttachLeft              True)
        (Label3.AttachRight             True)
        (Label3.AttachBottom            True)
        (Label3.Alignment               0)
        (Label3.BottomOffset            0)
        (.Label                         "Selected Licenses")
        (.Decorated                     True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 0 1 0 1) (Cols 1 0)
                Label3
                (Pos 2 1)
                List1
                (Grid (Rows 1 0 0 1) (Cols 0)
                    (Pos 2 1)
                    ShuffleUp
                    ShuffleDown
                )
                Label16
                (Pos 4 1)
                List2
            )
        )
    )
)

(Layout Layout6
    (Components
        (PushButton                     MoveToIn)
        (PushButton                     MoveToOut)
    )

    (Resources
        (MoveToIn.Bitmap                "ps_wizard_back")
        (MoveToIn.ButtonStyle           2)
        (MoveToIn.Alignment             2)
        (MoveToIn.KeyboardInput         True)
        (MoveToOut.Bitmap               "ps_wizard_next")
        (MoveToOut.ButtonStyle          2)
        (MoveToOut.Alignment            2)
        (MoveToOut.KeyboardInput        True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1) (Cols 1)
                MoveToOut
                MoveToIn
            )
        )
    )
)

(Layout DebugLayout
    (Components
        (Menu                           DebugPopup)
    )

    (Resources
        (.Visible                       False)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                DebugPopup
            )
        )
    )
)

(MenuPane DebugPopup
    (Components
        (PushButton                     LogicDump)
        (PushButton                     LogicCompare)
        (PushButton                     UI_Info)
    )

    (Resources
        (LogicDump.AcceleratorCode      1245184)
        (LogicCompare.AcceleratorCode   1310720)
        (UI_Info.AcceleratorCode        1376256)
    )
)
