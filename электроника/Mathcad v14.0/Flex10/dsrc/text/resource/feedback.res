!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  feedback.res
! 
!  Pro/SETUP uses to display feedback (output) for System Calls file
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  10-Mar-00           TWH          Created.
!  17-Mar-00 I-03-28+  JJE   $$1    Group Submission
!  05-Mar-00           JJE          Redo the dialog a bit
!  05-May-00 I-03-28+  JJE   $$2    Group Submission
!  17-Dec-02 J-03-40   TWH   $$3    Drop waitgif
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Dialog feedback
    (Components
        (TextArea                       Title)
        (TextArea                       TextArea)
        (PushButton                     DismissBtn)
        (Label                          WaitLab)
    )

    (Resources
        (Title.Rows                     3)
        (Title.Editable                 False)
        (Title.Decorated                False)
        (Title.Wrap                     True)
        (Title.CaretVisible             False)
        (Title.ScrollBarsWhenNeeded     True)
        (Title.AllowKbdNavigate         0)
        (TextArea.Rows                  12)
        (TextArea.Columns               32)
        (TextArea.MaxLen                32767)
        (TextArea.Editable              False)
        (TextArea.ScrollBarsWhenNeeded  True)
        (DismissBtn.Label               "Hide/Done")
        (DismissBtn.AttachRight         True)
        (WaitLab.Label                  "Please wait...")
        (WaitLab.AttachLeft             True)
        (WaitLab.Alignment              0)
        (.Bitmap                        "setup")
        (.Label                         "")
        (.DialogStyle                   1)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 0 1 0) (Cols 1)
                Title
                TextArea
                (Grid (Rows 0) (Cols 1 1 1 1)
                    WaitLab
                    (Pos 1 4)
                    DismissBtn
                )
            )
        )
    )
)
