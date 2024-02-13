!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  app_mgr_config.res
! 
!  Appmgr configuration, start menu tree
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  16-Feb-99 I-03-02   JJE   $$1    Group submission
!  08-Feb-00           JJE          Add setup bitmap
!  09-Feb-00 I-03-26+  JJE   $$2    Group Submission
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Dialog app_mgr_config
    (Components
        (SubLayout                      Menu)
    )

    (Resources
        (.Bitmap                        "setup")
        (.Label                         "PTC Application Manager - Installation Configuration")
        (.DialogStyle                   3)
        (.SizeToFit                     True)
        (.SizeBox                       True)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                Menu
            )
        )
    )
)

(Layout Menu
    (Components
        (Tree                           CmdTree)
        (PushButton                     CmdTreeAdd)
        (PushButton                     CmdTreeEdit)
        (PushButton                     CmdTreeDelete)
    )

    (Resources
        (CmdTree.Rows                   14)
        (CmdTree.Columns                20)
        (CmdTree.SymbolNames            "open"
                                        "close")
        (CmdTree.SymbolImages           "UI dir open image"
                                        "UI dir close image")
        (CmdTreeAdd.Label               "Add")
        (CmdTreeAdd.AttachLeft          True)
        (CmdTreeAdd.AttachRight         True)
        (CmdTreeEdit.Label              "Edit")
        (CmdTreeEdit.AttachLeft         True)
        (CmdTreeEdit.AttachRight        True)
        (CmdTreeDelete.Label            "Delete")
        (CmdTreeDelete.AttachLeft       True)
        (CmdTreeDelete.AttachRight      True)
        (.Label                         "Menu")
        (.Resizeable                    True)
        (.Scrollable                    True)
        (.OverlayPlane                  True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1) (Cols 1 1)
                CmdTree
                (Grid (Rows 0 0 0 1) (Cols 1)
                    CmdTreeAdd
                    CmdTreeEdit
                    CmdTreeDelete
                )
            )
        )
    )
)
