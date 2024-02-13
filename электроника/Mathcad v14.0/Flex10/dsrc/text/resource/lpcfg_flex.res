!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  lpcfg_flex.res
! 
!  Lpcfg, linkpath
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  26-Apr-99           JJE          Created
!  30-Apr-99           TWH          Add TextArea, revise layout
!  11-May-99 I-03-09   JJE   $$1    Group Submission
!  21-Dec-00 J-01-25   MAZ   $$2    Set StartOnReboot default to True
!  20-Nov-01 J-01-39   TWH   $$3    Change label
!  16-Jan-03 J-03-41   ALG   $$4    Set LmgrdParams.MaxLen to 128
!  04-Aug-05 K-03-30   TWH   $$5    FLEXlm -> FLEXnet
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout lpcfg_flex
    (Components
        (SubLayout                      FlexOptLayout)
        (Tab                            AltUserTab
                                        UserUnix
                                        UserWin)
        (Label                          Label4)
        (Label                          Label5)
        (Label                          Label7)
        (TextArea                       TextArea)
    )

    (Resources
        (TextArea.Rows                  5)
        (TextArea.Columns               25)
        (TextArea.MaxLen                320)
        (TextArea.Editable              False)
        (TextArea.Decorated             False)
        (TextArea.Wrap                  True)
        (TextArea.ScrollBarPosition     6)
        (TextArea.CaretVisible          False)
        (TextArea.ScrollBarsWhenNeeded  True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1) (Cols 1 0 1)
                Label4
                (Grid (Rows 1 1 1 1) (Cols 0)
                    TextArea
                    FlexOptLayout
                    AltUserTab
                    Label7
                )
                Label5
            )
        )
    )
)

(Layout FlexOptLayout
    (Components
        (InputPanel                     LmgrdParams)
        (Label                          LmgrdParamsLab)
        (CheckButton                    StartOnReboot)
    )

    (Resources
        (LmgrdParams.MaxLen             128)
        (LmgrdParamsLab.Label           "FLEXnet Server Startup Options")
        (LmgrdParamsLab.AttachRight     True)
        (LmgrdParamsLab.Alignment       1)
        (StartOnReboot.Label            "Start license server on reboot")
        (StartOnReboot.Set              True)
        (StartOnReboot.AttachLeft       True)
        (StartOnReboot.AttachRight      True)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1) (Cols 1)
                StartOnReboot
                (Grid (Rows 1) (Cols 1 1)
                    LmgrdParamsLab
                    LmgrdParams
                )
            )
        )
    )
)

(Layout UserUnix
    (Components
        (Label                          AltUserLab)
        (InputPanel                     AltUser)
        (Label                          AltUserDesc)
    )

    (Resources
        (AltUserLab.Label               "Server process owner")
        (AltUserLab.AttachRight         True)
        (AltUserLab.Alignment           1)
        (AltUserDesc.Label              "The FLEXnet server process can be
be run under an alternate user id.  ")
        (.Label                         "Unix Only")
        (.Decorated                     True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1) (Cols 1)
                AltUserDesc
                (Grid (Rows 1) (Cols 1 1)
                    AltUserLab
                    AltUser
                )
            )
        )
    )
)

(Layout UserWin
    (Components
        (Label                          DummyLab)
    )

    (Resources
        (.Layout
            (Grid (Rows 1) (Cols 1)
                DummyLab
            )
        )
    )
)
