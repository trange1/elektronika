!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
!
!  scr_appmgr.res
!
!  The appmgr screen
!
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  08-Mar-99           MYA          Created
!  18-Mar-99           TWH          Add Tracking for remaining sliders
!  18-Mar-99           TWH          Add Tracking for remaining sliders
!  26-Apr-99           JJE          Improve layout
!  11-May-99 I-03-09   JJE   $$1    Group Submission
!  18-Oct-99           MYA          Change MinInteger of HeightVal to 20
!  01-Nov-99           MYA          Change LengthVal, MaxLengthVal min and max
!  03-Nov-99 I-03-20   JJE   $$2    Group Submission
!  30-Dec-99           JJE          Chg sel policy on tree
!  02-Jan-00           TWH          Drop Buttons/Window tabs and titlebar ckbox
!  04-Jan-00 I-03-25+  JJE   $$3    Group Submission
!  29-Nov-00           TWH          Fix config.apm output
!  30-Nov-00 J-01-22   JJE   $$4    Group Submission
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout scr_appmgr
    (Components
        (Tab                            Tab1
                                        MenuLayout
                                        PositionLayout)
        (Label                          Label8)
        (Label                          Label18)
        (Label                          Label19)
        (Label                          Label20)
    )

    (Resources
        (Tab1.Decorated                 True)
        (.Label                         "PTC Application Manager Preferences")
        (.Layout
            (Grid (Rows 1) (Cols 1 0 1)
                Label8
                (Grid (Rows 1 0 1) (Cols 0)
                    Label18
                    Tab1
                    Label20
                )
                Label19
            )
        )
    )
)

(Layout MenuLayout
    (Components
        (Tree                           CmdTree)
        (PushButton                     CmdTreeAdd)
        (PushButton                     CmdTreeEdit)
        (PushButton                     CmdTreeDelete)
        (TextArea                       TextArea3)
    )

    (Resources
        (CmdTree.SelectionPolicy        2)
        (CmdTree.Rows                   14)
        (CmdTree.Columns                20)
        (CmdTreeAdd.Label               "Add")
        (CmdTreeAdd.AttachLeft          True)
        (CmdTreeAdd.AttachRight         True)
        (CmdTreeEdit.Label              "Edit")
        (CmdTreeEdit.AttachLeft         True)
        (CmdTreeEdit.AttachRight        True)
        (CmdTreeDelete.Label            "Delete")
        (CmdTreeDelete.AttachLeft       True)
        (CmdTreeDelete.AttachRight      True)
        (TextArea3.Rows                 3)
        (TextArea3.Value                "Create and edit startup commands that appear in the Application Manager's Start menu")
        (TextArea3.Decorated            False)
        (TextArea3.Wrap                 True)
        (TextArea3.BackgroundColor      20)
        (TextArea3.ScrollBarPosition    6)
        (TextArea3.ScrollBarsWhenNeeded True)
        (.Label                         "Menu")
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1) (Cols 1)
                TextArea3
                (Grid (Rows 1) (Cols 1 0)
                    CmdTree
                    (Grid (Rows 0 0 0 1) (Cols 0)
                        CmdTreeAdd
                        CmdTreeEdit
                        CmdTreeDelete
                    )
                )
            )
        )
    )
)

(Layout PositionLayout
    (Components
        (CheckButton                    AutoHide)
        (OptionMenu                     PositionType)
        (Label                          DummyLabel8)
        (Label                          DummyLabel9)
        (Label                          DummyLabel10)
        (Label                          DummyLabel11)
        (TextArea                       TextArea1)
    )

    (Resources
        (AutoHide.Label                 "Auto Hide")
        (AutoHide.AttachLeft            True)
        (PositionType.Columns           12)
        (PositionType.AttachRight       False)
        (PositionType.Names             "horizontal_top"
                                        "horizontal_bottom"
                                        "vertical_left"
                                        "vertical_right")
        (PositionType.Labels            "Horizontal Top"
                                        "Horizontal Bottom"
                                        "Vertical Left"
                                        "Vertical Right")
        (TextArea1.Rows                 3)
        (TextArea1.Value                "Specify PTC Application Manager start location and window attributes")
        (TextArea1.Decorated            False)
        (TextArea1.Wrap                 True)
        (TextArea1.BackgroundColor      20)
        (TextArea1.ScrollBarPosition    6)
        (TextArea1.ScrollBarsWhenNeeded True)
        (.Label                         "Position")
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1 1) (Cols 1)
                DummyLabel8
                (Grid (Rows 1) (Cols 1 1 1)
                    DummyLabel9
                    (Grid (Rows 1 1 1 1) (Cols 1)
                        TextArea1
                        PositionType
                        AutoHide
                    )
                    DummyLabel11
                )
                DummyLabel10
            )
        )
    )
)
