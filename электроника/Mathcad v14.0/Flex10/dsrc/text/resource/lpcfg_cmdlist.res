!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  29-Apr-03 K-01-06   TWH   $$1    Created.
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout lpcfg_cmdlist
    (Components
        (SubLayout                      lpcfg_cmdlist2)
    )

    (Resources
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                lpcfg_cmdlist2
            )
        )
    )
)

(Layout lpcfg_cmdlist2
    (Components
        (List                           CmdList)
        (PushButton                     cmd_add)
        (PushButton                     cmd_edit)
        (PushButton                     cmd_del)
        (Label                          Label1)
        (SubLayout                      TALayout)
        (Label                          Label2)
    )

    (Resources
        (CmdList.VisibleRows            11)
        (CmdList.TabStops               12)
        (CmdList.ListType               True)
        (CmdList.MinRows                11)
        (CmdList.DefaultColumnWidth     0)
        (cmd_add.Label                  "Add")
        (cmd_add.AttachLeft             True)
        (cmd_add.AttachRight            True)
        (cmd_edit.Label                 "Edit")
        (cmd_edit.AttachLeft            True)
        (cmd_edit.AttachRight           True)
        (cmd_del.Label                  "Delete")
        (cmd_del.AttachLeft             True)
        (cmd_del.AttachRight            True)
        (Label1.Label                   "License Configurations")
        (Label1.AttachLeft              True)
        (Label1.AttachTop               True)
        (Label1.AttachBottom            True)
        (Label1.BottomOffset            0)
        (.Label                         "Advanced")
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 0 0 1) (Cols 1 0)
                TALayout
                (Pos 2 1)
                Label1
                (Pos 3 1)
                CmdList
                (Grid (Rows 0 0 0 1) (Cols 0)
                    cmd_add
                    cmd_edit
                    cmd_del
                    Label2
                )
            )
        )
    )
)

(Layout TALayout
    (Components
        (TextArea                       TextArea)
    )

    (Resources
        (TextArea.Rows                  3)
        (TextArea.MaxLen                512)
        (TextArea.Editable              False)
        (TextArea.Decorated             False)
        (TextArea.Wrap                  True)
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
        (.Layout
            (Grid (Rows 1) (Cols 1)
                TextArea
            )
        )
    )
)
