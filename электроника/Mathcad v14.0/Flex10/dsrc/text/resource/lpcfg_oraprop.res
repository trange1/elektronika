!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
!
! lpcfg_oraprop.res
!
! Lpcfg, Oracle DB Props for Data Server
!
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  10-Apr-00           TWH          Created.
!  10-Apr-00 I-03-28+  JJE   $$1    Group Submission
!  04-May-00           TWH          Change UsernameLab value
!  05-May-00 I-03-28+  JJE   $$2    Group Submission
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout lpcfg_oraprop
    (Components
        (SubLayout                      lpcfg_oraprop2)
        (Label                          Label2)
        (Label                          Label4)
        (Label                          Label5)
        (TextArea                       TextArea)
        (Label                          Label3)
    )

    (Resources
        (TextArea.Rows                  3)
        (TextArea.Columns               25)
        (TextArea.MaxLen                512)
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
                    lpcfg_oraprop2
                    Label5
                )
                Label4
            )
        )
    )
)

(Layout lpcfg_oraprop2
    (Components
        (Label                          SIDLab)
        (InputPanel                     OracleSID)
        (Label                          UsernameLab)
        (InputPanel                     Username)
    )

    (Resources
        (SIDLab.Label                   "Oracle SID")
        (SIDLab.AttachLeft              True)
        (SIDLab.AttachBottom            True)
        (SIDLab.BottomOffset            0)
        (OracleSID.MaxLen               6)
        (UsernameLab.Label              "Windchill Database Username")
        (UsernameLab.AttachLeft         True)
        (UsernameLab.AttachBottom       True)
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
                SIDLab
                OracleSID
                UsernameLab
                Username
            )
        )
    )
)
