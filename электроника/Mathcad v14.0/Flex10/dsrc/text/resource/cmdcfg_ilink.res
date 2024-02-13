!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  cmdcfg_ilink.res
! 
!  Command configuration, ilink
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  16-Feb-99 I-03-02   JJE   $$1    Group submission
!  11-Mar-99           TWH          Chg proe_start -> proe
!  30-Apr-99           JJE          Use image instead of Browse
!  11-May-99 I-03-09   JJE   $$2    Group Submission
!  17-Nov-99           JJE          Add browse buttons, change internal names
!  23-Nov-99 I-03-22   JJE   $$3    Group Submission
!  09-Dec-99           JJE          Bump up maxlen
!  15-Dec-99 I-03-24   JJE   $$4    Group Submission
!  02-May-00           TWH          Chg proeCmd to proestartCmd; Add ProeDir
!  05-May-00 I-03-28+  JJE   $$5    Group Submission
!  15-Aug-00           TWH          MaxLen ProeDir, proestartCmd
!  16-Aug-00 I-03-32+  TWH   $$6    Group Submission
!  28-Nov-00 I-03-35   TWH          Hide Appmgr refer for now 849777
!  30-Nov-00           JJE          Unknown
!  30-Nov-00 J-01-22   JJE   $$7    Group Submission
!  03-Dec-02 J-03-40   TWH   $$8    Re-Group Proe inputs
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
!
!# External resource file for CmdType ilnk_client.
!# Follow the following structure:
!# Other Product directories should have:
!#   InputPanel - <Tag>Dir
!#   Label      - <Tag>DirLab
!#   PushButton - <Tag>DirMod
!# Other Commands should have:
!#   OptionMenu - <CmdType.GetTag>Cmd
!#   Editable   - True
!# 

(Layout cmdcfg_ilink
    (Components
        (SubLayout                      ilink_2)
        (SubLayout                      ilink_1)
    )

    (Resources
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1) (Cols 1)
                ilink_2
                ilink_1
            )
        )
    )
)

(Layout ilink_1
    (Components
        (InputPanel                     AppMgrDir)
        (PushButton                     AppMgrDirMod)
        (Label                          AppMgrDirLab)
    )

    (Resources
        (AppMgrDir.Visible              False)
        (AppMgrDir.MaxLen               256)
        (AppMgrDirMod.Bitmap            "UI dir open image")
        (AppMgrDirMod.Visible           False)
        (AppMgrDirMod.AttachLeft        True)
        (AppMgrDirLab.Label             "PTC Application Manager")
        (AppMgrDirLab.Visible           False)
        (AppMgrDirLab.AttachRight       True)
        (AppMgrDirLab.Alignment         0)
        (.Label                         "Locate Other Installation Directories (Optional)")
        (.Visible                       False)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1) (Cols 1 1 1)
                AppMgrDirLab
                AppMgrDir
                AppMgrDirMod
            )
        )
    )
)

(Layout ilink_2
    (Components
        (Label                          ProeCmdLab)
        (InputPanel                     ProeDir)
        (PushButton                     ProeDirMod)
        (OptionMenu                     proestartCmd)
        (Label                          ProeDirLab)
    )

    (Resources
        (ProeCmdLab.Label               "Start Command")
        (ProeCmdLab.AttachRight         True)
        (ProeCmdLab.Alignment           1)
        (proestartCmd.Columns           14)
        (proestartCmd.MaxLen            256)
        (proestartCmd.Editable          True)
        (ProeDirLab.Label               "Installation Directory")
        (ProeDirLab.AttachRight         True)
        (ProeDirLab.Alignment           1)
        (ProeDir.MaxLen                 256)
        (ProeDirMod.Bitmap              "UI dir open image")
        (ProeDirMod.AttachLeft          True)
        (.Label                         "Pro/ENGINEER Integration (Optional)")
        (.Decorated                     True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1) (Cols 1 1 1)
                ProeDirLab
                ProeDir
                ProeDirMod
                ProeCmdLab
                proestartCmd
            )
        )
    )
)
