!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  lpcfg_dcad.res
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  20-Mar-00           JJE          Created
!  28-Mar-00 I-03-28+  JJE   $$1    Group Submission
!  09-Aug-00           MYA          Set MaxLen of RunDir
!  23-Aug-00 J-01-15   TWH   $$2    Group Submission
!  12-Apr-02 J-03-23   ALG   $$3    SPR 942366: Change layout label
!  09-Jun-03 K-01-08   TWH   $$4    Add instructions layout
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout lpcfg_dcad
    (Components
        (SubLayout                      lpcfg_dcad2)
        (Label                          Label2)
        (Label                          Label3)
        (Label                          Label4)
        (Label                          Label1)
        (SubLayout                      lpcfg_dcad3)
    )

    (Resources
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1) (Cols 1 0 1)
                Label2
                (Grid (Rows 1 1 1 1) (Cols 0)
                    Label1
                    lpcfg_dcad3
                    lpcfg_dcad2
                    Label4
                )
                Label3
            )
        )
    )
)

(Layout lpcfg_dcad2
    (Components
        (Label                          ProeCmdLab)
        (Label                          RunDirLab)
        (OptionMenu                     ProeCmd)
        (InputPanel                     RunDir)
        (PushButton                     RunDirBrowse)
    )

    (Resources
        (ProeCmdLab.Label               "Pro/ENGINEER startup command")
        (ProeCmdLab.AttachRight         True)
        (ProeCmdLab.Alignment           1)
        (RunDirLab.Label                "Directory to run in")
        (RunDirLab.AttachRight          True)
        (RunDirLab.Alignment            1)
        (RunDir.MaxLen                  260)
        (RunDirBrowse.Bitmap            "UI dir open image")
        (RunDirBrowse.AttachLeft        True)
        (RunDirBrowse.AttachRight       True)
        (RunDirBrowse.LeftOffset        0)
        (.Label                         "Pro/ENGINEER Distributed Services Settings")
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
            (Grid (Rows 0 0) (Cols 0 0 0)
                ProeCmdLab
                ProeCmd
                (Pos 2 1)
                RunDirLab
                RunDir
                RunDirBrowse
            )
        )
    )
)

(Layout lpcfg_dcad3
    (Components
        (TextArea                       TextArea)
    )

    (Resources
        (TextArea.Rows                  3)
        (TextArea.Columns               25)
        (TextArea.MaxLen                200)
        (TextArea.Editable              False)
        (TextArea.Decorated             False)
        (TextArea.Wrap                  True)
        (TextArea.BottomOffset          5)
        (TextArea.ScrollBarPosition     6)
        (TextArea.CaretVisible          False)
        (TextArea.ScrollBarsWhenNeeded  True)
        (.Label                         "Instructions")
        (.Decorated                     True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                TextArea
            )
        )
    )
)
