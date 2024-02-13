!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  lpcfg_appmgr.res
! 
!  Lpcfg, linkpath
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  07-May-99           MPY          Created
!  11-May-99 I-03-09   JJE   $$1    Group Submission
!  10-Jan-00           MYA          expand maxlen of appmgrlpt
!  12-Jan-00 I-03-26+  JJE   $$2    Group Submission
!  06-Dec-02 J-03-39   JJE   $$3    Rm the textarea
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout lpcfg_appmgr
    (Components
        (SubLayout                      AppmgrSubLayout)
        (Label                          Label2)
        (Label                          Label4)
        (Label                          Label5)
        (Label                          Label3)
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
                (Grid (Rows 1 0 1 1) (Cols 0)
                    Label3
                    AppmgrSubLayout
                    Label5
                )
                Label4
            )
        )
    )
)

(Layout AppmgrSubLayout
    (Components
        (InputPanel                     AppmgrLpt)
        (Label                          Label1)
        (PushButton                     AppmgrBrowse)
    )

    (Resources
        (AppmgrLpt.MaxLen               255)
        (Label1.Label                   "Full path to the Application Manager installation directory")
        (Label1.AttachLeft              True)
        (AppmgrBrowse.Label             "Browse")
        (AppmgrBrowse.AttachLeft        True)
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
            (Grid (Rows 1 1) (Cols 1 1)
                Label1
                (Pos 2 1)
                AppmgrLpt
                AppmgrBrowse
            )
        )
    )
)
