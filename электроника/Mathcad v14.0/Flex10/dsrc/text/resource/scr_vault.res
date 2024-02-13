!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  scr_vault.res
! 
!  The vault screen
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  11-May-99 I-03-09   JJE   $$1    Group Submission
!  16-Apr-04 K-01-26+  TWH   $$2    Re-do layout for K-01
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout scr_vault
    (Components
        (SubLayout                      scr_vault2)
        (Label                          Label1)
    )

    (Resources
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 0 1) (Cols 1)
                scr_vault2
                Label1
            )
        )
    )
)

(Layout scr_vault2
    (Components
        (InputPanel                     Hostname)
        (InputPanel                     Port)
        (InputPanel                     Vaultpath)
        (InputPanel                     Password)
        (Label                          FileLab)
        (Label                          Label5)
        (Label                          Label6)
        (Label                          PasswdLab)
        (SubLayout                      scr_vault3)
    )

    (Resources
        (Hostname.TopOffset             10)
        (Vaultpath.MaxLen               260)
        (Password.Password              True)
        (FileLab.Label                  "File Vault path")
        (FileLab.AttachLeft             True)
        (FileLab.AttachRight            True)
        (FileLab.Alignment              0)
        (Label5.Label                   "Port")
        (Label5.AttachLeft              True)
        (Label5.Alignment               0)
        (Label6.Label                   "Hostname")
        (Label6.AttachLeft              True)
        (Label6.Alignment               0)
        (Label6.TopOffset               10)
        (PasswdLab.Label                "SYSPOOL File Server password")
        (PasswdLab.AttachLeft           True)
        (PasswdLab.Alignment            0)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 0) (Cols 1)
                scr_vault3
                (Grid (Rows 0 0 0 0) (Cols 1 1)
                    Label6
                    Hostname
                    Label5
                    Port
                    FileLab
                    Vaultpath
                    PasswdLab
                    Password
                )
            )
        )
    )
)

(Layout scr_vault3
    (Components
        (TextArea                       TextArea)
    )

    (Resources
        (TextArea.Rows                  3)
        (TextArea.Columns               25)
        (TextArea.MaxLen                300)
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
        (.BottomOffset                  10)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                TextArea
            )
        )
    )
)
