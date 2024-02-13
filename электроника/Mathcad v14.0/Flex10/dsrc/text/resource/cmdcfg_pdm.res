!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  cmdcfg_pdm.res
! 
!  Command configuration, pdm
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  16-Feb-99 I-03-02   JJE   $$1    Group submission
!  11-Mar-99           TWH          Chg proe_start -> proe
!  11-May-99 I-03-09   JJE   $$2    Group Submission
!  17-Nov-99           JJE          Add browse buttons for cmds
!  23-Nov-99 I-03-22   JJE   $$3    Group Submission
!  29-Feb-00 I-03-27+  TWH   $$4    Chg proeCmd to proestartCmd
!  06-Jun-00           MYA          chg maxlen of proestartcmd
!  08-Jun-00 I-03-28+  JJE   $$5    Group Submission
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
!# External resource file for CmdType pdm.
!# Follow the following structure:
!# Other Product directories should have:
!#   InputPanel - <Tag>Dir
!#   Label      - <Tag>DirLab
!#   PushButton - <Tag>DirMod
!# Other Commands should have:
!#   OptionMenu - <CmdType.GetTag>Cmd
!#   Editable   - True
!# 
! (.Decorated  : USE True once visible components are added.

(Layout cmdcfg_pdm
    (Components
        (SubLayout                      pdm_1)
        (SubLayout                      pdm_2)
    )

    (Resources
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1) (Cols 1)
                pdm_1
                pdm_2
            )
        )
    )
)

(Layout pdm_1
    (Components
        (Label                          LabelInvisible)
    )

    (Resources
        (LabelInvisible.Visible         False)
        (.Label                         "Locate Other Installation Directories (Optional)")
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                LabelInvisible
            )
        )
    )
)

(Layout pdm_2
    (Components
        (Label                          ProeCmdLab)
        (OptionMenu                     proestartCmd)
        (PushButton                     proestartCmdMod)
    )

    (Resources
        (ProeCmdLab.Label               "Pro/ENGINEER Command")
        (ProeCmdLab.AttachRight         True)
        (ProeCmdLab.Alignment           0)
        (proestartCmd.MaxLen            260)
        (proestartCmd.Columns                14)
        (proestartCmd.Editable               True)
        (proestartCmdMod.Bitmap              "UI dir open image")
        (proestartCmdMod.AttachLeft          True)
        (.Label                         "Optional Inputs")
        (.Decorated                     True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1) (Cols 0 1 1)
                ProeCmdLab
                proestartCmd
                proestartCmdMod
            )
        )
    )
)
