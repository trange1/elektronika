!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
!
!  featwiz.res
!
!  Feature Wizard Dialog
!
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  16-Apr-99           TWH          Created.
!  11-May-99 I-03-09   JJE   $$1    Group Submission
!  21-Dec-99           TWH          Don't truncate label on CancelButton
!  22-Dec-99 I-03-24+  JJE   $$2    Group Submission
!  08-Feb-00           JJE          Add setup bitmap
!  09-Feb-00 I-03-26+  JJE   $$3    Group Submission
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Dialog featwiz
    (Components
        (Tab                            TopTab
                                        ScreensLayout)
    )

    (Resources
        (.Bitmap                        "setup")
        (.Label                         "Feature Wizard")
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.DefaultButton                 "NextButton")
        (.Layout
            (Grid (Rows 1) (Cols 1)
                TopTab
            )
        )
    )
)

(Layout ScreensLayout
    (Components
        (Tab                            ScreenTab
                                        HostidList
                                        LineType
                                        OneInput
                                        OptionList
                                        OneChoice)
        (SubLayout                      BtnLayout)
        (Label                          StepLabel)
        (SubLayout                      DALayout)
    )

    (Resources
        (StepLabel.Label                "License Wizard - Step 1")
        (StepLabel.AttachLeft           True)
        (StepLabel.AttachRight          True)
        (StepLabel.TruncateLabel        False)
        (.Layout
            (Grid (Rows 1 1 1 1) (Cols 1)
                StepLabel
                ScreenTab
                DALayout
                BtnLayout
            )
        )
    )
)

(Layout HostidList
    (Components
        (List                           HostList)
        (Label                          Label9)
        (SubLayout                      Layout12)
        (Label                          HostActionLabel)
    )

    (Resources
        (HostList.Columns               8)
        (HostList.VisibleRows           8)
        (HostList.TabStops              5)
        (HostList.MinRows               8)
        (HostList.BottomOffset          5)
        (HostList.LeftOffset            20)
        (HostList.RightOffset           1)
        (HostList.ScrollBarPosition     6)
        (HostActionLabel.Label          "Action Label")
        (HostActionLabel.AttachLeft     True)
        (HostActionLabel.AttachRight    True)
        (HostActionLabel.AttachBottom   True)
        (HostActionLabel.TopOffset      5)
        (HostActionLabel.BottomOffset   2)
        (.Layout
            (Grid (Rows 1 1) (Cols 1)
                HostActionLabel
                (Grid (Rows 1) (Cols 1 1 1)
                    Label9
                    HostList
                    Layout12
                )
            )
        )
    )
)

(Layout Layout12
    (Components
        (PushButton                     HostListAdd)
        (PushButton                     HostListEdit)
        (PushButton                     HostListDelete)
    )

    (Resources
        (HostListAdd.Label              "Add")
        (HostListAdd.AttachLeft         True)
        (HostListAdd.AttachRight        True)
        (HostListAdd.AttachTop          True)
        (HostListAdd.BottomOffset       4)
        (HostListAdd.LeftOffset         1)
        (HostListEdit.Label             "Edit")
        (HostListEdit.AttachLeft        True)
        (HostListEdit.AttachRight       True)
        (HostListEdit.AttachTop         True)
        (HostListEdit.BottomOffset      4)
        (HostListDelete.Label           "Delete")
        (HostListDelete.AttachLeft      True)
        (HostListDelete.AttachRight     True)
        (HostListDelete.AttachTop       True)
        (.AttachLeft                    True)
        (.AttachTop                     True)
        (.LeftOffset                    1)
        (.Layout
            (Grid (Rows 1 1 1) (Cols 1)
                HostListAdd
                HostListEdit
                HostListDelete
            )
        )
    )
)

(Layout LineType
    (Components
        (List                           LineTypeList)
        (Label                          SelectActionLabel)
    )

    (Resources
        (LineTypeList.Columns           12)
        (LineTypeList.VisibleRows       3)
        (LineTypeList.ColumnLabel       "16")
        (LineTypeList.AttachLeft        False)
        (LineTypeList.AttachRight       False)
        (LineTypeList.AttachTop         False)
        (LineTypeList.Names             "0"
                                        "1"
                                        "2")
        (LineTypeList.Labels            "SERVER"
                                        "DAEMON"
                                        "INCREMENT")
        (LineTypeList.MinRows           3)
        (LineTypeList.TopOffset         5)
        (LineTypeList.LeftOffset        5)
        (LineTypeList.RightOffset       5)
        (SelectActionLabel.AttachLeft   True)
        (SelectActionLabel.AttachRight  True)
        (SelectActionLabel.AttachBottom True)
        (SelectActionLabel.BottomOffset 2)
        (.Layout
            (Grid (Rows 1 1) (Cols 1)
                SelectActionLabel
                LineTypeList
            )
        )
    )
)

(Layout OneInput
    (Components
        (InputPanel                     FeatureLine)
        (Label                          ActionLabel)
        (Label                          Label4)
        (Label                          Label5)
        (Label                          Label6)
        (Label                          Label7)
    )

    (Resources
        (FeatureLine.InputType          0)
        (FeatureLine.MaxLen             100)
        (ActionLabel.Label              " ------- Action line ---------")
        (ActionLabel.AttachLeft         True)
        (ActionLabel.AttachRight        True)
        (ActionLabel.AttachBottom       True)
        (ActionLabel.BottomOffset       2)
        (ActionLabel.TruncateLabel      False)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1 1 1) (Cols 1 1 1)
                (Pos 1 2)
                Label5
                (Pos 2 1)
                Label4
                ActionLabel
                Label6
                (Pos 3 2)
                FeatureLine
                (Pos 4 2)
                Label7
            )
        )
    )
)

(Layout OptionList
    (Components
        (Label                          Label8)
        (Label                          OptionActionLabel)
        (Label                          Label3)
        (SubLayout                      Layout1)
        (Label                          Label10)
    )

    (Resources
        (OptionActionLabel.Label        "Select Options")
        (OptionActionLabel.AttachLeft   True)
        (OptionActionLabel.AttachRight  True)
        (OptionActionLabel.AttachBottom True)
        (OptionActionLabel.TopOffset    5)
        (OptionActionLabel.BottomOffset 2)
        (.Layout
            (Grid (Rows 1 1 1) (Cols 1 1 1)
                (Pos 1 2)
                Label3
                (Pos 2 2)
                OptionActionLabel
                (Pos 3 1)
                Label8
                Layout1
                Label10
            )
        )
    )
)

(Layout Layout1
    (Components
        (SubLayout                      Layout4)
        (SubLayout                      Layout5)
        (SubLayout                      Layout6)
    )

    (Resources
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.Layout
            (Grid (Rows 1) (Cols 1 1 1)
                Layout5
                Layout4
                Layout6
            )
        )
    )
)

(Layout Layout4
    (Components
        (List                           OptList)
        (Label                          Label19)
        (Label                          Label20)
    )

    (Resources
        (OptList.Columns                14)
        (OptList.VisibleRows            7)
        (OptList.TabStops               4)
        (OptList.LeftOffset             20)
        (OptList.ScrollBarPosition      6)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.Layout
            (Grid (Rows 1) (Cols 1 1 1)
                Label20
                Label19
                OptList
            )
        )
    )
)

(Layout Layout5
    (Components
        (Label                          Label17)
        (Label                          Label18)
    )

    (Resources
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.Layout
            (Grid (Rows 1) (Cols 1 1)
                Label17
                Label18
            )
        )
    )
)

(Layout Layout6
    (Components
        (PushButton                     OptListMod)
    )

    (Resources
        (OptListMod.Label               "Modify")
        (OptListMod.AttachLeft          True)
        (OptListMod.LeftOffset          5)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                OptListMod
            )
        )
    )
)

(Layout OneChoice
    (Components
        (RadioGroup                     ChoiceGroup)
        (Label                          ChoiceLabel)
        (Label                          Label11)
        (Label                          Label12)
        (Label                          Label1)
        (Label                          Label2)
    )

    (Resources
        (ChoiceGroup.Orientation        True)
        (ChoiceGroup.AttachLeft         False)
        (ChoiceGroup.AttachRight        False)
        (ChoiceGroup.Names              "1"
                                        "2")
        (ChoiceGroup.Labels             "Yes"
                                        "No")
        (ChoiceGroup.Alignment          2)
        (ChoiceGroup.TopOffset          5)
        (ChoiceGroup.BottomOffset       20)
        (ChoiceLabel.Label              "Action line")
        (ChoiceLabel.AttachLeft         True)
        (ChoiceLabel.AttachRight        True)
        (ChoiceLabel.AttachBottom       True)
        (ChoiceLabel.BottomOffset       1)
        (ChoiceLabel.TruncateLabel      False)
        (.Layout
            (Grid (Rows 1 1 1) (Cols 1)
                (Grid (Rows 1) (Cols 1 1 1)
                    (Pos 1 2)
                    Label12
                )
                ChoiceLabel
                (Grid (Rows 1 1) (Cols 1 1 1)
                    Label1
                    ChoiceGroup
                    Label2
                    (Pos 2 2)
                    Label11
                )
            )
        )
    )
)

(Layout BtnLayout
    (Components
        (PushButton                     BackButton)
        (PushButton                     NextButton)
        (PushButton                     HelpButton)
        (PushButton                     CancelButton)
    )

    (Resources
        (BackButton.Bitmap              "cl_wizard_back")
        (BackButton.Label               "Back")
        (BackButton.AttachRight         True)
        (BackButton.RightOffset         1)
        (NextButton.Bitmap              "cl_wizard_next")
        (NextButton.Label               "Next")
        (NextButton.AttachLeft          True)
        (NextButton.LeftOffset          1)
        (NextButton.ButtonAlignment     651)
        (HelpButton.Label               "Help")
        (HelpButton.AttachLeft          True)
        (CancelButton.Label             "Cancel")
        (CancelButton.AttachRight       True)
        (CancelButton.TruncateLabel     False)
        (.Decorated                     False)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachBottom                  True)
        (.Alignment                     2)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1) (Cols 1 1 1 1)
                HelpButton
                BackButton
                NextButton
                CancelButton
            )
        )
    )
)

(Layout DALayout
    (Components
        (DrawingArea                    ShaggyDA)
    )

    (Resources
        (ShaggyDA.Decorated             False)
        (ShaggyDA.AttachLeft            True)
        (ShaggyDA.AttachRight           True)
        (ShaggyDA.AttachTop             True)
        (ShaggyDA.AttachBottom          True)
        (ShaggyDA.DrawingWidth          450)
        (ShaggyDA.BackgroundColor       24)
        (.Label                         "Sample License Line:")
        (.Decorated                     True)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                ShaggyDA
            )
        )
    )
)
