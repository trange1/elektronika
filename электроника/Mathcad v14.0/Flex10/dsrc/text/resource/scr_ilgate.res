!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  scr_ilgate.res
! 
!  Windchill Intralink Gateway properties screen
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  23-Mar-99           JJE          Created
!  11-May-99 I-03-09   JJE   $$1    Group Submission
!  08-Sep-99           JJE          Some label changes
!  08-Sep-99 I-03-14   JJE   $$2    Group Submission
!  16-Sep-99           JJE          Set auto-highlight on
!  21-Sep-99 I-03-15   JJE   $$3    Group Submission
!  25-Feb-00           MAZ          Add pubPath fields
!  28-Mar-00 I-03-28+  JJE   $$4    Group Submission
!  04-Apr-00           MAZ          Change pubPath label and maxLen
!  10-Apr-00 I-03-28+  JJE   $$5    Group Submission
!  07-Sep-00           DAR          Add Revision Mapping
!  18-Sep-00 J-01-18   TWH   $$6    Group Submission
!  25-Apr-01 J-01-32+  DAR   $$7    Removed pubPath fields
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout scr_ilgate
    (Components
        (SubLayout                      scr_ilgate2)
        (TextArea                       TextArea)
        (Label                          Label1)
    )

    (Resources
        (TextArea.Rows                  8)
        (TextArea.Columns               25)
        (TextArea.MaxLen                200)
        (TextArea.Editable              False)
        (TextArea.Decorated             False)
        (TextArea.AttachLeft            False)
        (TextArea.AttachRight           False)
        (TextArea.AttachTop             False)
        (TextArea.AttachBottom          False)
        (TextArea.Wrap                  True)
        (TextArea.ScrollBarPosition     6)
        (TextArea.CaretVisible          False)
        (TextArea.ScrollBarsWhenNeeded  True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 0 0 1) (Cols 1)
                TextArea
                scr_ilgate2
                Label1
            )
        )
    )
)

(Layout scr_ilgate2
    (Components
        (InputPanel                     LogfileDir)
        (Label                          LogfileDirLab)
        (Label                          PubAgentLab)
        (InputPanel                     PubAgent)
        (PushButton                     LogfileDirBrowse)
        (Label                          RevMapLab)
        (OptionMenu                     RevMapOption)
    )

    (Resources
        (LogfileDir.MaxLen              256)
        (LogfileDir.AutoHighlight       True)
        (LogfileDirLab.Label            "Log File Directory")
        (LogfileDirLab.AttachRight      True)
        (LogfileDirLab.Alignment        1)
        (PubAgentLab.Label              "Publishing Agent")
        (PubAgentLab.AttachRight        True)
        (PubAgentLab.Alignment          1)
        (PubAgent.AutoHighlight         True)
        (LogfileDirBrowse.Bitmap        "UI dir open image")
        (LogfileDirBrowse.AttachLeft    True)
        (LogfileDirBrowse.AttachRight   True)
        (LogfileDirBrowse.LeftOffset    0)
        (RevMapLab.Label                "Revision Mapping")
        (RevMapLab.AttachRight          True)
        (RevMapOption.VisibleRows       3)
        (RevMapOption.ItemHelpText      "VERSION_ITERATION"
                                        "VERSION"
                                        "NONE")
        (RevMapOption.Names             "ver_i"
                                        "ver"
                                        "none")
        (RevMapOption.Labels            "VERSION_ITERATION"
                                        "VERSION"
                                        "NONE")
        (.Label                         "Gateways Settings")
        (.Decorated                     True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1 1) (Cols 1 1 0)
                PubAgentLab
                PubAgent
                (Pos 2 1)
                LogfileDirLab
                LogfileDir
                LogfileDirBrowse
                RevMapLab
                RevMapOption
            )
        )
    )
)
