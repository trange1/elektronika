!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  Windchill Info*Engine properties screen
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  09-Mar-00           MAZ          Created
!  28-Mar-00 I-03-28+  TWH          Group Submission
!  22-Mar-01 J-01-30   DAR          Removed verbose logging
!  17-Apr-01 J-01-32+  MAZ   $$1    This file replaces scr_iebroker
!  09-May-01 J-01-32+  DAR   $$2    2 words for hostname and username
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout lpcfg_iebroker
    (Components
        (SubLayout                      lpcfg_iebroker2)
        (TextArea                       TextArea)
        (Label                          Label2)
        (Label                          Label1)
        (Label                          Label3)
        (Label                          Label4)
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
            (Grid (Rows 1) (Cols 1 1 1)
                Label1
                (Grid (Rows 1 1 1 1 1) (Cols 1)
                    Label4
                    TextArea
                    lpcfg_iebroker2
                    Label2
                )
                Label3
            )
        )
    )
)

(Layout lpcfg_iebroker2
    (Components
        (InputPanel                     EmailServer)
        (Label                          EmailServerLab)
        (InputPanel                     Username)
        (Label                          UsernameLab)
        (InputPanel                     Passwd)
        (Label                          PasswdLab)
        (InputPanel                     Folder)
        (Label                          FolderLab)
        (InputPanel                     Admin)
        (Label                          AdminLab)
        (Label                          TimeLab)
        (InputPanel                     Time)
        (CheckButton                    DelCheckBox)
    )

    (Resources
        (EmailServer.MaxLen             255)
        (EmailServer.AutoHighlight      True)
        (EmailServerLab.Label           "E-Mail Server Host Name")
        (EmailServerLab.AttachRight     True)
        (EmailServerLab.Alignment       1)
        (Username.MaxLen                255)
        (Username.AutoHighlight         True)
        (UsernameLab.Label              "Account User Name")
        (UsernameLab.AttachRight        True)
        (UsernameLab.Alignment          1)
        (Passwd.MaxLen                  255)
        (Passwd.Password                True)
        (Passwd.AutoHighlight           True)
        (PasswdLab.Label                "Account Password")
        (PasswdLab.AttachRight          True)
        (PasswdLab.Alignment            1)
        (Folder.MaxLen                  255)
        (Folder.AutoHighlight           True)
        (FolderLab.Label                "E-Mail Folder")
        (FolderLab.AttachRight          True)
        (FolderLab.Alignment            1)
        (Admin.MaxLen                   255)
        (Admin.AutoHighlight            True)
        (AdminLab.Label                 "Administrator E-Mail Address")
        (AdminLab.AttachRight           True)
        (AdminLab.Alignment             1)
        (TimeLab.Label                  "Time Between Checks (seconds)")
        (TimeLab.AttachRight            True)
        (Time.MaxLen                    255)
        (Time.MinInteger                0)
        (Time.MaxInteger                6000)
        (Time.InputType                 2)
        (DelCheckBox.Label              "Delete Processed Messages?")
        (DelCheckBox.AttachLeft         True)
        (.Label                         "E-Mail Broker Configuration")
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
            (Grid (Rows 1 1 1 1 1 1 1) (Cols 1 1)
                EmailServerLab
                EmailServer
                UsernameLab
                Username
                PasswdLab
                Passwd
                FolderLab
                Folder
                AdminLab
                Admin
                TimeLab
                Time
                (Pos 7 2)
                DelCheckBox
            )
        )
    )
)
