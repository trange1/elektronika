!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  cmdcfg_concept.res
! 
!  Command configuration, CONCEPT
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  10-Jul-02 J-03-29   OTT   $$1    Created
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

(Layout cmdcfg_concept
    (Components
        (SubLayout                      concept_1)
    )

    (Resources
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                concept_1
            )
        )
    )
)

(Layout concept_1
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
