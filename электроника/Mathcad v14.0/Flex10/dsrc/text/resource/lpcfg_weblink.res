!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  lpcfg_weblink.res
! 
!  Lpcfg, linkpath
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  25-May-99           TWH          Created
!  17-Aug-99 I-03-12+  JJE   $$1    Group Submission
!  30-Jun-00           JJE          Some minor formatting fixes
!  10-Jul-00 I-03-30+  JJE   $$2    Group Submission
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout lpcfg_weblink
    (Components
        (SubLayout                      WeblinkSubLayout)
        (Label                          Label2)
        (Label                          Label4)
        (Label                          Label5)
        (TextArea                       TextArea)
    )

    (Resources
        (TextArea.Rows                  8)
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
                (Grid (Rows 1 0 1 1) (Cols 0)
                    TextArea
                    WeblinkSubLayout
                    Label5
                )
                Label4
            )
        )
    )
)

(Layout WeblinkSubLayout
    (Components
        (InputPanel                     WeblinkLpt)
        (Label                          Label1)
        (PushButton                     WeblinkBrowse)
    )

    (Resources
        (WeblinkLpt.BottomOffset        5)
        (WeblinkLpt.LeftOffset          5)
        (Label1.Label                   "Full path to the Netscape plugins directory")
        (Label1.AttachLeft              True)
        (Label1.AttachBottom            True)
        (Label1.TopOffset               5)
        (Label1.BottomOffset            2)
        (Label1.LeftOffset              5)
        (WeblinkBrowse.Bitmap           "UI dir open image")
        (WeblinkBrowse.AttachLeft       True)
        (WeblinkBrowse.AttachRight      True)
        (WeblinkBrowse.BottomOffset     5)
        (WeblinkBrowse.LeftOffset       4)
        (WeblinkBrowse.RightOffset      5)
        (.Decorated                     True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.Layout
            (Grid (Rows 1 0) (Cols 1 0)
                Label1
                (Pos 2 1)
                WeblinkLpt
                WeblinkBrowse
            )
        )
    )
)
