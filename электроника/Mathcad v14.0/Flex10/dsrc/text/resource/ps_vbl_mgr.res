!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
!
!  ps_vbl_mgr.res
!
!  Pro/SETUP variable manager dialog
!
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  11-May-99 I-03-09   JJE   $$1    Group Submission
!  08-Feb-00           JJE          Add setup bitmap
!  09-Feb-00 I-03-26+  JJE   $$2    Group Submission
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Dialog ps_vbl_mgr
    (Components
        (List                           VarList)
        (List                           ArgList)
    )

    (Resources
        (.Bitmap                        "setup")
        (VarList.SelectionPolicy        2)
        (VarList.Columns                40)
        (VarList.VisibleRows            8)
        (VarList.TabStops               12)
        (VarList.PopupMenu              "VarMenu")
        (VarList.ScrollBarPosition      2)
        (ArgList.SelectionPolicy        2)
        (ArgList.Columns                15)
        (ArgList.VisibleRows            8)
        (ArgList.TabStops               6)
        (ArgList.PopupMenu              "VarMenu")
        (ArgList.ScrollBarPosition      2)
        (.Label                         "Variable Manager")
        (.DialogStyle                   5)
        (.StartLocation                 2)
        (.Layout
            (Grid (Rows 1) (Cols 1 1)
                ArgList
                VarList
            )
        )
    )
)

(MenuPane VarMenu
    (Components
        (PushButton                     VarEdit)
    )

    (Resources
        (VarEdit.Label                  "Edit")
    )
)
