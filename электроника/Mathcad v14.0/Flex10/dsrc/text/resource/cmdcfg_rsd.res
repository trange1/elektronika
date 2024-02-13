!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  cmdcfg_rsd.res
! 
!  Command configuration, rsd
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  24-Oct-00 J-01-20+  JJE   $$1    Created
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout cmdcfg_rsd
    (Components
        (SubLayout                      rsd_1)
        (SubLayout                      rsd_2)
    )

    (Resources
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1) (Cols 1)
                rsd_1 
                rsd_2
            )
        )
    )
)

(Layout rsd_1
    (Components
        (InputPanel                     IlinkDir)
        (PushButton                     IlinkDirMod)
        (Label                          IlinkDirLab)
    )
    (Resources
        (IlinkDir.MaxLen                256)
        (IlinkDirMod.Bitmap             "UI dir open image")
        (IlinkDirMod.AttachLeft         True)
        (IlinkDirLab.Label              "Pro/INTRALINK")
        (IlinkDirLab.AttachRight        True)
        (IlinkDirLab.Alignment          1)
        (.Label                         "Locate Other Installation Directories (Optional)")
        (.Decorated                     True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1) (Cols 0 1 0)
                IlinkDirLab
                IlinkDir
                IlinkDirMod
            )
        )
    )
)

(Layout rsd_2
    (Components
        (Label                          LabelInvisible2)
    )
    (Resources
        (LabelInvisible2.Visible         False)
        (.Label                         "Optional Inputs")
        (.Decorated                     False)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                LabelInvisible2
            )
        )
    )
)
