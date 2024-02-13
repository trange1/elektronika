!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  cmdcfg_3dpaint.res
! 
!  Command configuration, 3DPAINT
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  20-Oct-99           OTT   $$1    Created
!  12-Nov-99           OTT          Maxlen set to 512
!  16-Nov-99 I-03-21   JJE   $$2    Group Submission
! 
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
!# External resource file for CmdType proe.
!# Follow the following structure:
!# Other Product directories should have:
!#   InputPanel - <Tag>Dir
!#   Label      - <Tag>DirLab
!#   PushButton - <Tag>DirMod
!# Other Commands should have:
!#   OptionMenu - <CmdType.GetTag>Cmd
!#   Editable   - True
!#

(Layout cmdcfg_3dpaint
    (Components
        (SubLayout                      3dpaint_1)
    )

    (Resources
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                3dpaint_1
            )
        )
    )
)

(Layout 3dpaint_1
    (Components
        (InputPanel                     AppMgrDir)
        (PushButton                     AppMgrDirMod)
        (Label                          AppMgrDirLab)
        (InputPanel                     CDRSGraphLibDir)
        (PushButton                     CDRSGraphLibDirMod)
        (Label                          CDRSGraphLibDirLab)
    )

    (Resources
        (AppMgrDir.MaxLen               512)
        (AppMgrDirMod.Bitmap            "UI dir open image")
        (AppMgrDirMod.AttachLeft        True)
        (AppMgrDirLab.Label             "PTC Application Manager")
        (AppMgrDirLab.Alignment         1)
        (CDRSGraphLibDir.MaxLen         512)
        (CDRSGraphLibDirMod.Bitmap      "UI dir open image")
        (CDRSGraphLibDirMod.AttachLeft  True)
        (CDRSGraphLibDirLab.Label       "PTC Graphic Library")
        (CDRSGraphLibDirLab.AttachRight True)
        (CDRSGraphLibDirLab.Alignment   0)
        (.Label                         "Locate Other Installation Directories (Optional)")
        (.Decorated                     True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1) (Cols 1 1 1)
                AppMgrDirLab
                AppMgrDir
                AppMgrDirMod
                CDRSGraphLibDirLab
                CDRSGraphLibDir
                CDRSGraphLibDirMod
            )
        )
    )
)
