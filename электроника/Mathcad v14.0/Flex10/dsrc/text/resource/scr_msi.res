!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  scr_msi.res
! 
!  Lpcfg
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  11-Jan-00           JJE          Created.
!  12-Jan-00 I-03-26+  JJE   $$1    Group Submission
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout scr_msi
    (Components
        (Label                          MsiLabel)
    )

    (Resources
        (MsiLabel.Label                 "Run Windows Installer")
        (MsiLabel.AttachLeft            True)
        (MsiLabel.AttachRight           True)
        (MsiLabel.AttachTop             True)
        (MsiLabel.AttachBottom          True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.Layout
            (Grid (Rows 0) (Cols 1)
                MsiLabel
            )
        )
    )
)
