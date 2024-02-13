!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
!
! lpcfg_orapwd.res
!
! Lpcfg, Oracle Password for intralink
!
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  24-Feb-00 I-03-27+  TWH   $$1    Group Submission
!  04-May-00           TWH          Chg Internal label info
!  05-May-00 I-03-28+  JJE   $$2    Group Submission
!  08-Jul-02 J-01-47   MAZ   $$3    Drop a label to fix display of textarea
!  16-Apr-04 K-01-26+  TWH   $$4    Re-do layout for K-01
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout lpcfg_orapwd
    (Components
        (SubLayout                      lpcfg_orapwd2)
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
            (Grid (Rows 0 1) (Cols 1)
                lpcfg_orapwd2
                Label3
            )
        )
    )
)

(Layout lpcfg_orapwd2
    (Components
        (Label                          Label1)
        (InputPanel                     SystemPwd)
        (Label                          InternalLab)
        (InputPanel                     InternalPwd)
        (SubLayout                      lpcfg_orapwd3)
    )

    (Resources
        (Label1.Label                   "Enter password for Oracle Administrative User 'SYSTEM' ")
        (Label1.BottomOffset            0)
        (SystemPwd.Password             True)
        (InternalLab.Label              "Enter Database User password")
        (InternalPwd.Password           True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 0 1 1 1 1) (Cols 1)
                lpcfg_orapwd3
                Label1
                SystemPwd
                InternalLab
                InternalPwd
            )
        )
    )
)

(Layout lpcfg_orapwd3
    (Components
        (TextArea                       TextArea)
    )

    (Resources
        (TextArea.Rows                  3)
        (TextArea.Columns               25)
        (TextArea.MaxLen                512)
        (TextArea.Editable              False)
        (TextArea.Decorated             False)
        (TextArea.Wrap                  True)
        (TextArea.MinRows               5)
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
