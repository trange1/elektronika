!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  cmdcfg_profly.res
! 
!  Command configuration, profly
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  16-Feb-99 I-03-02   JJE   $$1    Group submission
!  11-Mar-99           TWH          Chg proe_start -> proe
!  11-May-99 I-03-09   JJE   $$2    Group Submission
!  02-May-00           MYA          Add proeCmd's max length, bug 820763 
!  02-May-00 I-03-28+  MYA   $$3    chg proeCmd to proestartCmd
!  17-May-00           MYA          Add IlinkDir
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

!# External resource file for CmdType profly.
!# Follow the following structure:
!# Other Product directories should have:
!#   InputPanel - <Tag>Dir
!#   Label      - <Tag>DirLab
!#   PushButton - <Tag>DirMod
!# Other Commands should have:
!#   OptionMenu - <CmdType.GetTag>Cmd
!#   Editable   - True
!# 

(Layout cmdcfg_profly
    (Components
        (SubLayout                      profly_1)
        (SubLayout                      profly_2)
    )

    (Resources
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1) (Cols 1)
                profly_1
                profly_2
            )
        )
    )
)

(Layout profly_1
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
! (.Decorated  : USE True once visible components are added.
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

(Layout profly_2
    (Components
        (Label                          ProeCmdLab)
        (OptionMenu                     proestartCmd)
    )

    (Resources
        (ProeCmdLab.Label               "Pro/ENGINEER Command")
        (ProeCmdLab.AttachRight         True)
        (ProeCmdLab.Alignment           0)
        (proestartCmd.MaxLen                 260)
        (proestartCmd.Columns                10)
        (proestartCmd.Editable               True)
        (proestartCmd.AttachRight            False)
        (.Label                         "Optional Inputs")
        (.Decorated                     True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1) (Cols 0 1)
                ProeCmdLab
                proestartCmd
            )
        )
    )
)

