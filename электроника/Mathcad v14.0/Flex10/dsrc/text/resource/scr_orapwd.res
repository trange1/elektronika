!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  scr_orapwd.res
! 
!  The Oracle password screen
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  17-Mar-00 I-03-28+  JJE   $$1    Group Submission
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout scr_orapwd
    (Components
        (SubLayout                      scr_orapwd2)
        (TextArea                       TextArea)
        (Label                          Label1)
        (Label                          Label2)
        (Label                          Label3)
        (Label                          Label4)
    )

    (Resources
        (TextArea.Rows                  3)
        (TextArea.Columns               25)
        (TextArea.MaxLen                300)
        (TextArea.Editable              False)
        (TextArea.Decorated             False)
        (TextArea.Wrap                  True)
        (TextArea.TopOffset             10)
        (TextArea.ScrollBarPosition     6)
        (TextArea.CaretVisible          False)
        (TextArea.ScrollBarsWhenNeeded  True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 0 0 1) (Cols 1 0 1)
                (Pos 1 2)
                Label4
                (Pos 2 2)
                TextArea
                (Pos 3 1)
                Label1
                scr_orapwd2
                Label2
                (Pos 4 2)
                Label3
            )
        )
    )
)

(Layout scr_orapwd2
    (Components
        (InputPanel                     SystemPwd)
        (Label                          Label6)
        (Label                          Label5)
        (InputPanel                     InternalPwd)
    )

    (Resources
        (SystemPwd.Password             True)
        (Label6.Label                   "Data Server Enter password for Oracle Administrative User 'SYSTEM':")
        (Label6.AttachLeft              True)
        (Label6.Alignment               0)
        (Label5.Label                   "Enter Internal Data Server password:")
        (InternalPwd.Password           True)
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
            (Grid (Rows 1 1 1 1) (Cols 1)
                Label6
                SystemPwd
                Label5
                InternalPwd
            )
        )
    )
)
