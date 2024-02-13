!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  pdm_db.res
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  17-Aug-99 I-03-12+  JJE   $$1    Group Submission
!  08-Feb-00           JJE          Add setup bitmap
!  09-Feb-00 I-03-26+  JJE   $$2    Group Submission
!  14-Jul-00           MYA   $$3    set maxlen of dbdirinput
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
(Dialog pdm_db
    (Components
        (Label                          Label1)
        (InputPanel                     DbDirInput)
        (StdButton                      StdOK)
        (StdButton                      StdCancel)
        (PushButton                     DbDirBrowse)
        (Label                          Label2)
    )

    (Resources
        (.Bitmap                        "setup")
        (Label1.Label                   "Enter Path to PDM Database.")
        (Label1.AttachLeft              True)
        (Label1.AttachTop               True)
        (Label1.TopOffset               10)
        (Label1.LeftOffset              5)
		(DbDirInput.MaxLen				260)
        (DbDirInput.AttachRight         False)
        (DbDirInput.AttachTop           True)
        (DbDirInput.TopOffset           9)
        (DbDirInput.LeftOffset          5)
        (StdOK.Label                    "&OK")
        (StdCancel.Label                "&Cancel")
        (DbDirBrowse.Label              "&Browse")
        (DbDirBrowse.AttachLeft         True)
        (DbDirBrowse.AttachRight        True)
        (DbDirBrowse.LeftOffset         5)
        (DbDirBrowse.RightOffset        10)
        (Label2.Label                   "Select Browse for a directory browser")
        (Label2.AttachLeft              True)
        (Label2.AttachTop               True)
        (Label2.TopOffset               5)
        (Label2.LeftOffset              5)
        (.Label                         "Select Installation Directory")
        (.Layout
            (Grid (Rows 1 1 1) (Cols 1 1)
                Label1
                (Pos 2 1)
                Label2
                (Pos 3 1)
                DbDirInput
                DbDirBrowse
            )
        )
    )
)
