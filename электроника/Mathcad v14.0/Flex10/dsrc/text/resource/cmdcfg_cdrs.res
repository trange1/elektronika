!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  20-Oct-99           OTT   $$1    Created
!  12-Nov-99           OTT          Maxlen to 512 and Division
!  16-Nov-99 I-03-21   JJE   $$2    Group Submission
!  17-Nov-99           JJE          Add browse buttons for cmds
!  23-Nov-99 I-03-22   JJE   $$3    Group Submission
!  13-Jan-00           OTT          Remove Division
!  17-Jan-00 I-03-26+  JJE   $$4    Group Submission
!  25-May-00           OTT   $$5    Add Division
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

(Layout cmdcfg_cdrs
    (Components
        (SubLayout                      cdrs_1)
        (SubLayout                      cdrs_2)
    )

    (Resources
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1) (Cols 1)
                cdrs_1
                cdrs_2
            )
        )
    )
)

(Layout cdrs_1
    (Components
        (InputPanel                     AppMgrDir)
        (PushButton                     AppMgrDirMod)
        (Label                          AppMgrDirLab)
        (InputPanel                     CDRSGraphLibDir)
        (PushButton                     CDRSGraphLibDirMod)
        (Label                          CDRSGraphLibDirLab)
        (Label                          DivisionDirLab)
        (InputPanel                     DivisionDir)
        (PushButton                     DivisionDirMod)
    )

    (Resources
        (AppMgrDir.MaxLen               512)
        (AppMgrDirMod.Bitmap            "UI dir open image")
        (AppMgrDirMod.AttachLeft        True)
        (AppMgrDirLab.Label             "PTC Application Manager")
        (AppMgrDirLab.AttachRight       True)
        (AppMgrDirLab.Alignment         0)
        (CDRSGraphLibDir.MaxLen         512)
        (CDRSGraphLibDirMod.Bitmap      "UI dir open image")
        (CDRSGraphLibDirMod.AttachLeft  True)
        (CDRSGraphLibDirLab.Label       "PTC Graphic Library")
        (CDRSGraphLibDirLab.AttachRight True)
        (CDRSGraphLibDirLab.Alignment   0)
        (DivisionDir.MaxLen             512)
        (DivisionDirMod.Bitmap          "UI dir open image")
        (DivisionDirMod.AttachLeft      True)
        (DivisionDirLab.Label           "DIVSION MockUp")
        (DivisionDirLab.AttachRight     True)
        (DivisionDirLab.Alignment       0)
        (.Label                         "Locate Other Installation Directories (Optional)")
        (.Decorated                     True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1 1) (Cols 1 1 1)
                AppMgrDirLab
                AppMgrDir
                AppMgrDirMod
                CDRSGraphLibDirLab
                CDRSGraphLibDir
                CDRSGraphLibDirMod
                DivisionDirLab
                DivisionDir
                DivisionDirMod
            )
        )
    )
)

(Layout cdrs_2
    (Components
        (Label                          ProeCmdLab)
        (Label                          PaintCmdLab)
        (OptionMenu                     proestartCmd)
        (OptionMenu                     paintCmd)
        (PushButton                     proestartCmdMod)
        (PushButton                     paintCmdMod)
    )

    (Resources
        (ProeCmdLab.Label               "Pro/ENGINEER Command")
        (ProeCmdLab.AttachRight         True)
        (ProeCmdLab.Alignment           0)
        (PaintCmdLab.Label              "3DPAINT Command")
        (PaintCmdLab.AttachRight        True)
        (PaintCmdLab.Alignment          0)
        (proestartCmd.Columns           14)
        (proestartCmd.MaxLen            512)
        (proestartCmd.Editable          True)
        (paintCmd.Columns               14)
        (paintCmd.MaxLen                512)
        (paintCmd.Editable              True)
        (proestartCmdMod.Bitmap         "UI dir open image")
        (proestartCmdMod.AttachLeft     True)
        (paintCmdMod.Bitmap             "UI dir open image")
        (paintCmdMod.AttachLeft         True)
        (.Label                         "Optional Inputs")
        (.Decorated                     True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1) (Cols 1 1 1)
                ProeCmdLab
                proestartCmd
                proestartCmdMod
                PaintCmdLab
                paintCmd
                paintCmdMod
            )
        )
    )
)
