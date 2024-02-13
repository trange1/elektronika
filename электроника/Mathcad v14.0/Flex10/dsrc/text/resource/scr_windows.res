!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  scr_windows.res
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  29-Apr-03 K-01-06   TWH   $$1    Created.
!  09-Jun-03 K-01-08   TWH   $$2    Add instructions layout
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout scr_windows
    (Components
        (SubLayout                      ShortcutLayout)
        (SubLayout                      PathLayout)
        (Label                          Label1)
        (Label                          Label3)
        (Label                          Label4)
        (Label                          Label2)
        (SubLayout                      scr_windows3)
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
            (Grid (Rows 1) (Cols 1 0 1)
                Label1
                (Grid (Rows 1 1 1 1 1) (Cols 0)
                    Label2
                    scr_windows3
                    ShortcutLayout
                    PathLayout
                    Label4
                )
                Label3
            )
        )
    )
)

(Layout ShortcutLayout
    (Components
        (OptionMenu                     ShortcutFolder)
        (Label                          FolderLab)
        (Label                          StartInDirLab)
        (InputPanel                     StartInDir)
        (PushButton                     StartInDirBrowse)
        (Label                          LocationLab)
        (CheckButton                    ScProgramFolder)
        (CheckButton                    ScStartMenu)
        (CheckButton                    ScDesktop)
    )

    (Resources
        (ShortcutFolder.Editable        True)
        (FolderLab.Label                "Program Folder")
        (FolderLab.AttachRight          True)
        (FolderLab.Alignment            1)
        (StartInDirLab.Label            "Startup Directory")
        (StartInDirLab.AttachRight      True)
        (StartInDirLab.Alignment        1)
        (StartInDir.MaxLen              260)
        (StartInDirBrowse.Bitmap        "UI dir open image")
        (StartInDirBrowse.AttachLeft    True)
        (StartInDirBrowse.AttachRight   True)
        (StartInDirBrowse.LeftOffset    0)
        (LocationLab.Label              "Shortcut Location(s)")
        (LocationLab.AttachRight        True)
        (LocationLab.Alignment          1)
        (ScProgramFolder.Label          "Program folder")
        (ScProgramFolder.AttachLeft     True)
        (ScProgramFolder.TopOffset      2)
        (ScStartMenu.Label              "Start menu")
        (ScStartMenu.AttachLeft         True)
        (ScStartMenu.TopOffset          2)
        (ScStartMenu.BottomOffset       0)
        (ScDesktop.Label                "Desktop")
        (ScDesktop.AttachLeft           True)
        (ScDesktop.BottomOffset         0)
        (.Label                         "Windows Shortcut Preferences")
        (.Decorated                     True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1 1 1 1) (Cols 1 1 0)
                LocationLab
                ScDesktop
                (Pos 2 2)
                ScStartMenu
                (Pos 3 2)
                ScProgramFolder
                (Pos 4 1)
                FolderLab
                ShortcutFolder
                (Pos 5 1)
                StartInDirLab
                StartInDir
                StartInDirBrowse
            )
        )
    )
)

(Layout PathLayout
    (Components
        (RadioGroup                     PathChoice)
    )

    (Resources
        (PathChoice.Orientation         True)
        (PathChoice.AttachLeft          False)
        (PathChoice.AttachRight         False)
        (PathChoice.AttachTop           False)
        (PathChoice.AttachBottom        False)
        (PathChoice.Names               "systempath"
                                        "userpath")
        (PathChoice.Labels              "Modify system environment for all users"
                                        "Modify current user's environment only")
        (.Label                         "Windows Environment Preferences")
        (.Decorated                     True)
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
                PathChoice
            )
        )
    )
)

(Layout scr_windows3
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
