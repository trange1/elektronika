!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  lpcfg_windows.res
! 
!  Lpcfg, windows
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  16-Feb-99 I-03-02   JJE   $$1    Group submission
!  04-Mar-99           TWH          Add TextArea,Cosmetic changes
!  23-Mar-99           JJE          Tweaks
!  02-Apr-99           JJE          Tweaks
!  30-Apr-99           JJE          Use image instead of Browse
!  11-May-99 I-03-09   JJE   $$2    Group Submission
!  09-Aug-00           MYA          set maxlen of startup dir
!  23-Aug-00 J-01-15   TWH   $$3    Group Submission
!  19-Apr-00 J-01-32+  DAR   $$4    Removed reference to NT
!  22-Oct-01 J-01-38+  MAZ          Rm ref to Path, make it generic
!  31-Oct-01 J-03-12   MAZ   $$5    Update from J-01
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout lpcfg_windows
    (Components
        (SubLayout                      ShortcutLayout)
        (SubLayout                      PathLayout)
        (Label                          Label1)
        (Label                          Label3)
        (Label                          Label4)
        (TextArea                       TextArea)
        (Label                          Label2)
    )

    (Resources
        (TextArea.Rows                  3)
        (TextArea.Columns               25)
        (TextArea.MaxLen                200)
        (TextArea.Editable              False)
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
                Label1
                (Grid (Rows 1 0 0 0 1) (Cols 0)
                    Label2
                    TextArea
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
