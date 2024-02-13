!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  Windchill Info*Engine properties screen
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  09-Mar-00           MAZ          Created
!  28-Mar-00 I-03-28+  JJE   $$1    Group Submission
!  12-Apr-00           JJE          Include Windchill in I*E name
!  13-Apr-00 I-03-28+  JJE          Group Submission
!  13-Apr-00           MAZ          Change label value
!  19-Apr-00 I-03-28+  JJE   $$2    Group Submission
!  28-Sep-00 J-01-20+  DAR   $$3    Removed 2 Prefix entries, add App URL
!  22-Mar-01 J-01-30   DAR   $$4    Removed task and templates
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout scr_ieserver
    (Components
        (SubLayout                      scr_ieserver2)
        (TextArea                       TextArea)
        (Label                          Label2)
        (Label                          Label1)
        (Label                          Label3)
        (Label                          Label4)
        (SubLayout                      scr_auth)
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
                    scr_ieserver2
                    scr_auth
                    Label2
                )
                Label3
            )
        )
    )
)

(Layout scr_ieserver2
    (Components
        (Label                          AppURLLab)
        (InputPanel                     AppURL)
    )

    (Resources
        (AppURLLab.Label                "Application URL")
        (AppURLLab.AttachRight          True)
        (AppURLLab.Alignment            1)
        (AppURL.MaxLen                  255)
        (AppURL.Value                   "infoengine")
        (AppURL.AutoHighlight           True)
        (.Label                         "Windchill Info*Engine Server and Servlet Configuration")
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
            (Grid (Rows 1) (Cols 1 1)
                AppURLLab
                AppURL
            )
        )
    )
)

(Layout scr_auth
    (Components
        (InputPanel                     AuthRealm)
        (Label                          AuthRealmLab)
        (Label                          IdleTimeoutLab)
        (InputPanel                     IdleTimeout)
        (InputPanel                     AuthTask)
        (Label                          AuthTaskLab)
    )

    (Resources
        (AuthRealmLab.Label             "Authentication HTTP Realm")
        (AuthRealmLab.AttachRight       True)
        (IdleTimeoutLab.Label           "Idle Timeout (minutes)")
        (IdleTimeoutLab.AttachRight     True)
        (IdleTimeoutLab.Alignment       1)
        (IdleTimeout.MaxLen             255)
        (IdleTimeout.MinInteger         0)
        (IdleTimeout.MaxInteger         600)
        (IdleTimeout.InputType          2)
        (IdleTimeout.AutoHighlight      True)
        (AuthTask.MaxLen                255)
        (AuthTask.AutoHighlight         True)
        (AuthTaskLab.Label              "Authentication Task Relative Path ")
        (AuthTaskLab.AttachRight        True)
        (AuthTaskLab.Alignment          1)
        (.Label                         "Windchill Info*Engine Servlet Authentication")
        (.Decorated                     True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.TopOffset                     10)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1 1) (Cols 1 1)
                AuthTaskLab
                AuthTask
                AuthRealmLab
                AuthRealm
                IdleTimeoutLab
                IdleTimeout
            )
        )
    )
)
