!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  cmdcfg_desg.res
! 
!  Command configuration, CDRS
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  16-Feb-99 I-03-02   JJE   $$1    Group submission
!  11-Mar-99           TWH          Chg proe_start -> proe
!  30-Apr-99           JJE          Use image instead of Browse
!  11-May-99 I-03-09   JJE   $$2    Group Submission
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

(Layout cmdcfg_desg
    (Components
        (SubLayout                      desg_1)
        (SubLayout                      desg_2)
    )

    (Resources
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1) (Cols 1)
                desg_1
                desg_2
            )
        )
    )
)

(Layout desg_1
    (Components
        (InputPanel                     GraphLibDir)
        (PushButton                     GraphLibDirMod)
        (Label                          GraphLibDirLab)
    )

    (Resources
        (GraphLibDirMod.Bitmap          "UI dir open image")
        (GraphLibDirMod.AttachLeft      True)
        (GraphLibDirLab.Label           "PTC Graphic Library")
        (GraphLibDirLab.AttachRight     True)
        (GraphLibDirLab.Alignment       0)
        (.Label                         "Locate Other Installation Directories (Optional)")
        (.Decorated                     True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1) (Cols 1 1 1)
                GraphLibDirLab
                GraphLibDir
                GraphLibDirMod
            )
        )
    )
)

(Layout desg_2
    (Components
        (Label                          ProeCmdLab)
        (OptionMenu                     proeCmd)
        (Label                          PaintCmdLab)
        (OptionMenu                     paintCmd)
    )

    (Resources
        (ProeCmdLab.Label               "Pro/ENGINEER Command")
        (ProeCmdLab.AttachRight         True)
        (ProeCmdLab.Alignment           0)
        (proeCmd.Columns          10)
        (proeCmd.Editable         True)
        (proeCmd.AttachRight      False)
        (PaintCmdLab.Label              "3D Paint Command")
        (PaintCmdLab.AttachRight        True)
        (PaintCmdLab.Alignment          0)
        (paintCmd.Columns               10)
        (paintCmd.Editable              True)
        (paintCmd.AttachRight           False)
        (.Label                         "Optional Inputs")
        (.Decorated                     True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1) (Cols 0 1)
                ProeCmdLab
                proeCmd
                PaintCmdLab
                paintCmd
            )
        )
    )
)
