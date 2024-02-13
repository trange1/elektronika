!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  scr_erbprop.res
! 
!  ERB properties screen
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  18-Oct-99           JJE          Created
!  22-Oct-99 I-03-18+  JJE   $$1    Group Submission
!  01-Apr-00           JJE          Add task directory alias
!  10-Apr-00 I-03-28+  JJE   $$2    Group Submission
!  12-Apr-00           JJE          Include Windchill in I*E name
!  13-Apr-00 I-03-28+  JJE   $$3    Group Submission
!  22-Apr-01 J-01-32+  ALG   $$4    Remove "Server" from scr_erbprop2.Label
!  07-Jun-01 J-01-33+  DAR   $$5    Removed Template Directory Alias SPR 875632
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout scr_erbprop
    (Components
        (SubLayout                      scr_erbprop2)
        (TextArea                       TextArea)
        (Label                          Label1)
    )

    (Resources
        (TextArea.Rows                  8)
        (TextArea.Columns               25)
        (TextArea.MaxLen                200)
        (TextArea.Editable              False)
        (TextArea.Decorated             False)
        (TextArea.AttachLeft            False)
        (TextArea.AttachRight           False)
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
            (Grid (Rows 0 0 1) (Cols 1)
                TextArea
                scr_erbprop2
                Label1
            )
        )
    )
)

(Layout scr_erbprop2
    (Components
        (InputPanel                     IEWebServerURL)
        (Label                          IEWebServerURLLab)
        (InputPanel                     IEWebServerPortNo)
        (Label                          IEWebServerPortNoLab)
        (InputPanel                     IETaskDirectoryAlias)
        (Label                          IETaskDirectoryAliasLab)
    )

    (Resources
        (IEWebServerURL.MaxLen          255)
        (IEWebServerURL.AutoHighlight   True)
        (IEWebServerURLLab.Label        "Web Server URL")
        (IEWebServerURLLab.AttachRight  True)
        (IEWebServerURLLab.Alignment    1)
        (IEWebServerPortNo.MaxLen       255)
        (IEWebServerPortNo.AutoHighlight True)
        (IEWebServerPortNoLab.Label     "Web Server Port Number")
        (IEWebServerPortNoLab.AttachRight True)
        (IEWebServerPortNoLab.Alignment 1)
        (IETaskDirectoryAlias.MaxLen    255)
        (IETaskDirectoryAlias.AutoHighlight True)
        (IETaskDirectoryAliasLab.Label  "Task Directory Alias")
        (IETaskDirectoryAliasLab.AttachRight True)
        (IETaskDirectoryAliasLab.Alignment 1)
        (.Label                         "Windchill Info*Engine Settings")
        (.Decorated                     True)
        (.AttachTop                     True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1 1) (Cols 1 1)
                IEWebServerURLLab
                IEWebServerURL
                IEWebServerPortNoLab
                IEWebServerPortNo
                IETaskDirectoryAliasLab
                IETaskDirectoryAlias
            )
        )
    )
)
