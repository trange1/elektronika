!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  pro_help.res
! 
!  Pro help path input dialog
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  16-Feb-99 I-03-02   JJE   $$1    Group submission
!  30-Apr-99           JJE          Use image instead of Browse
!  11-May-99 I-03-09   JJE   $$2    Group Submission
!  11-Nov-99           MAZ          Change Pro/HELP to Help
!  16-Nov-99 I-03-21   JJE   $$3    Group Submission
!  20-Jan-00           MYA          Expand maxlen of pathInput
!  12-Jan-00 I-03-26+  JJE   $$4    Group Submission
!  08-Feb-00           JJE          Add setup bitmap
!  09-Feb-00 I-03-26+  JJE   $$5    Group Submission
!  03-Jan-03 J-03-40   ALG   $$6    Add AlwaysAbove, DefaultButton, Focus;
!                                     Rearrange comps
!  02-Jun-03 K-01-07+  TWH   $$7    Fix AlwaysAbove
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Dialog pro_help
    (Components
        (Label                          Label1)
        (InputPanel                     pathInput)
        (PushButton                     DirBrowse)
        (StdButton                      StdOK)
        (StdButton                      StdCancel)
    )

    (Resources
        (Label1.Label                   "Enter the Help URL or full path to Help installation directory")
        (Label1.AttachLeft              True)
        (Label1.AttachTop               True)
        (Label1.AttachBottom            True)
        (Label1.TopOffset               10)
        (Label1.BottomOffset            5)
        (Label1.LeftOffset              5)
        (pathInput.Columns              40)
        (pathInput.MaxLen               255)
        (pathInput.BottomOffset         10)
        (pathInput.LeftOffset           5)
        (DirBrowse.Bitmap               "UI dir open image")
        (DirBrowse.AttachLeft           True)
        (DirBrowse.AttachRight          True)
        (DirBrowse.BottomOffset         10)
        (DirBrowse.LeftOffset           5)
        (DirBrowse.RightOffset          5)
        (StdOK.Label                    "&OK")
        (StdCancel.Label                "&Cancel")
        (.Bitmap                        "setup")
        (.Label                         "Help Loadpoint Input")
        (.Focus                         "pathInput")
        (.DefaultButton                 "StdOK")
        (.AlwaysAbove                   "ptcsetup")
        (.Layout
            (Grid (Rows 1 1) (Cols 1 1)
                Label1
                (Pos 2 1)
                pathInput
                DirBrowse
            )
        )
    )
)
