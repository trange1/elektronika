!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
!
!  ps_notepad.res
!
!  License editor dialog
!
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  30-Apr-99           TWH          Created from ui_notepad.res
!  11-May-99 I-03-09   JJE   $$1    Group Submission
!  08-Feb-00           JJE          Add setup bitmap
!  09-Feb-00 I-03-26+  JJE   $$2    Group Submission
!  04-Aug-05 K-03-30   TWH   $$3    FLEXlm -> FLEXnet
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Dialog ps_notepad
    (Components
        (TextArea                       text)
        (MenuBar                        menubar
                                        file
                                        edit
                                        search)
        (SubLayout                      Layout1)
    )

    (Resources
        (.Bitmap                        "setup")
        (text.Rows                      16)
        (text.Columns                   60)
        (text.MaxLen                    16777216)
        (text.SelectionVisible          True)
        (text.UndoBufferSize            65536)
        (text.CompressUndos             False)
        (.Label                         "FLEXnet license editor")
        (.MaximizeButton                True)
        (.MinimizeButton                True)
        (.TopOffset                     0)
        (.BottomOffset                  0)
        (.LeftOffset                    0)
        (.RightOffset                   0)
        (.SizeBox                       True)
        (.Layout
            (Grid (Rows 1 0) (Cols 1)
                text
                Layout1
            )
        )
    )
)

(MenuPane file
    (Components
        (PushButton                     import)
        (PushButton                     append)
        (PushButton                     save)
        (PushButton                     save_as)
        (Separator                      file_sep1)
        (PushButton                     exit)
    )

    (Resources
        (import.Label                   "&Import...")
        (import.HelpText                "Replace the file contents from another file")
        (append.Label                   "Append...")
        (append.HelpText                "Append another files' contents to this file")
        (save.Label                     "&Save")
        (save.HelpText                  "Save the file contents")
        (save_as.Label                  "Save &As...")
        (save_as.HelpText               "Save the contents in another file")
        (file_sep1.TopOffset            0)
        (file_sep1.BottomOffset         0)
        (file_sep1.LeftOffset           0)
        (file_sep1.RightOffset          0)
        (exit.Label                     "E&xit")
        (.Label                         "&File")
    )
)

(MenuPane edit
    (Components
        (PushButton                     undo)
        (PushButton                     redo)
        (Separator                      edit_sep1)
        (PushButton                     cut)
        (PushButton                     copy)
        (PushButton                     paste)
        (PushButton                     delete)
        (Separator                      edit_sep2)
        (PushButton                     select_all)
    )

    (Resources
        (undo.Label                     "&Undo")
        (undo.AcceleratorCode           67633152)
        (redo.Label                     "Redo")
        (redo.AcceleratorCode           34078720)
        (edit_sep1.TopOffset            0)
        (edit_sep1.BottomOffset         0)
        (edit_sep1.LeftOffset           0)
        (edit_sep1.RightOffset          0)
        (cut.Label                      "Cu&t")
        (cut.AcceleratorCode            16973824)
        (copy.Label                     "&Copy")
        (copy.AcceleratorCode           33685504)
        (paste.Label                    "&Paste")
        (paste.AcceleratorCode          16908288)
        (delete.Label                   "De&lete")
        (delete.AcceleratorCode         196608)
        (edit_sep2.TopOffset            0)
        (edit_sep2.BottomOffset         0)
        (edit_sep2.LeftOffset           0)
        (edit_sep2.RightOffset          0)
        (select_all.Label               "Select &All")
        (.Label                         "&Edit")
    )
)

(MenuPane search
    (Components
        (PushButton                     find)
        (PushButton                     next)
        (PushButton                     replace)
    )

    (Resources
        (find.Label                     "&Find...")
        (find.AcceleratorCode           17891328)
        (next.Label                     "Find &Next")
        (next.AcceleratorCode           1114112)
        (replace.Label                  "&Replace...")
        (.Label                         "&Search")
    )
)

(Layout Layout1
    (Components
        (PushButton                     CheckBtn)
        (Label                          CheckLab)
    )

    (Resources
        (CheckBtn.Label                 "ReCheck License(s)")
        (CheckBtn.AttachRight           True)
        (CheckBtn.RightOffset           2)
        (CheckLab.Label                 "License file still has errors")
        (CheckLab.AttachLeft            True)
        (CheckLab.AttachRight           True)
        (CheckLab.Alignment             0)
        (CheckLab.LeftOffset            10)
        (CheckLab.RightOffset           2)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.TopOffset                     2)
        (.BottomOffset                  2)
        (.Layout
            (Grid (Rows 1) (Cols 1 1)
                CheckLab
                CheckBtn
            )
        )
    )
)
