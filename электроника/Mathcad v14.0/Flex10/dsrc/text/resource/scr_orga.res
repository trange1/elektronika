!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
!
!  scr_orga.res
!
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  25-May-01 J-01-33   ALG   $$1    Created
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout scr_orga
    (Components
        (Label                          LeftLabel)
        (Label                          TopLabel)
        (TextArea                       TextArea)
        (SubLayout                      orga_admin)
        (SubLayout                      orga_des)
        (Label                          BottomLabel)
        (Label                          RightLabel)
    )

    (Resources
        (TextArea.Rows                  3)
        (TextArea.Columns               25)
        (TextArea.MaxLen                200)
        (TextArea.Editable              False)
        (TextArea.Value                 "In the fields below, enter the paths to the directories to be used by the ORGA archive.")
        (TextArea.Decorated             False)
        (TextArea.Wrap                  True)
        (TextArea.ScrollBarPosition     6)
        (TextArea.CaretVisible          False)
        (TextArea.ScrollBarsWhenNeeded  True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1) (Cols 1 0 1)
                LeftLabel
                (Grid (Rows 1 0 1 1 1) (Cols 0)
                    TopLabel
                    TextArea
                    orga_admin
                    orga_des
                    BottomLabel
                )
                RightLabel
            )
        )
    )
)

(Layout orga_admin
    (Components
        (Label                          AdminDirLab)
        (InputPanel                     AdminDir)
        (PushButton                     AdminDirBrowse)
    )

    (Resources
        (AdminDirLab.Label              "If the administrator directory for this ORGA Archive
database already exists (either on this computer or
elsewhere on the network), enter the path of the
existing directory.")
        (AdminDirLab.AttachLeft         True)
        (AdminDirLab.AttachRight        True)
        (AdminDirLab.AttachTop          True)
        (AdminDirLab.AttachBottom       True)
        (AdminDirLab.Alignment          0)
        (AdminDir.MaxLen                260)
        (AdminDirBrowse.Bitmap          "UI dir open image")
        (AdminDirBrowse.AttachLeft      True)
        (AdminDirBrowse.AttachRight     True)
        (AdminDirBrowse.LeftOffset      0)
        (.Label                         "Administrator directory")
        (.Decorated                     True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 0) (Cols 1)
                AdminDirLab
                (Grid (Rows 0) (Cols 1 0)
                    AdminDir
                    AdminDirBrowse
                )
            )
        )
    )
)

(Layout orga_des
    (Components
        (Label                          DesDirLab)
        (InputPanel                     DesDir)
        (PushButton                     DesDirBrowse)
    )

    (Resources
        (DesDirLab.Label                "After installation, you may set up additional designers
by making copies of the subdirectories in this directory.")
        (DesDirLab.AttachLeft           True)
        (DesDirLab.AttachRight          True)
        (DesDirLab.AttachTop            True)
        (DesDirLab.AttachBottom         True)
        (DesDirLab.Alignment            0)
        (DesDir.MaxLen                  260)
        (DesDirBrowse.Bitmap            "UI dir open image")
        (DesDirBrowse.AttachLeft        True)
        (DesDirBrowse.AttachRight       True)
        (DesDirBrowse.LeftOffset        0)
        (.Label                         "First designer directory")
        (.Decorated                     True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 0) (Cols 1)
                DesDirLab
                (Grid (Rows 0) (Cols 1 0)
                    DesDir
                    DesDirBrowse
                )
            )
        )
    )
)

