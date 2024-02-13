!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  lpcfg_mechi.res
! 
!  Lpcfg, linkpath
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  30-Apr-99           JJE          Use image instead of Browse
!  10-May-99           JJE          A little rearranging
!  11-May-99 I-03-09   JJE   $$1    Group Submission
!  10-Jan-00           MYA          Expand maxlen of ProeDir
!  12-Jan-00 I-03-26+  JJE   $$2    Group Submission
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout lpcfg_mechi
    (Components
        (SubLayout                      MechiSubLayout)
        (Label                          Label2)
        (Label                          Label4)
        (Label                          Label5)
        (TextArea                       TextArea)
        (Label                          Label3)
    )

    (Resources
        (TextArea.Rows                  3)
        (TextArea.Columns               25)
        (TextArea.MaxLen                200)
        (TextArea.Editable              False)
        (TextArea.Decorated             False)
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
            (Grid (Rows 1) (Cols 1 0 1)
                Label2
                (Grid (Rows 1 0 0 1) (Cols 0)
                    Label3
                    TextArea
                    MechiSubLayout
                    Label5
                )
                Label4
            )
        )
    )
)

(Layout MechiSubLayout
    (Components
        (InputPanel                     ProeDir)
        (Label                          Label1)
        (PushButton                     ProeDirBrowse)
        (OptionMenu                     ProeCmd)
        (Label                          Label7)
    )

    (Resources
        (ProeDir.MaxLen                 255)
        (Label1.Label                   "Pro/ENGINEER installation directory")
        (Label1.AttachLeft              True)
        (Label1.AttachRight             True)
        (Label1.Alignment               1)
        (ProeDirBrowse.Bitmap           "UI dir open image")
        (ProeDirBrowse.AttachLeft       True)
        (ProeDirBrowse.AttachRight      True)
        (ProeDirBrowse.LeftOffset       0)
        (ProeCmd.Editable               True)
        (Label7.Label                   "Select Pro/ENGINEER Command")
        (Label7.AttachLeft              True)
        (Label7.AttachRight             True)
        (Label7.Alignment               1)
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
            (Grid (Rows 1 1) (Cols 1 0 0)
                Label1
                ProeDir
                ProeDirBrowse
                Label7
                ProeCmd
            )
        )
    )
)
