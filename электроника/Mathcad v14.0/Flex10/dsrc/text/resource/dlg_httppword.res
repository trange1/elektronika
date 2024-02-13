!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
!
!  dlg_httppword.res
!
!  Web download authentication dialog
!
!  Date        Release   Name  Ver.   Comments
!  ----------- -------   ----  ----   --------
!  17-Nov-2003 K-01-18   JJE   $$1    Created
!  26-Mar-2004 K-01-25   JJE   $$2    Add retry msg
!  11-Jun-2004 K-01-28   JJE          Allow longer inputs
!  21-Jun-2004 K-03-04   MAZ   $$3    Sub to K-03
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Dialog dlg_httppword
    (Components
        (Label                          Lab_Please)
        (Label                          Lab_Realm)
        (Label                          Inp_Realm)
        (Label                          Lab_User)
        (Label                          Lab_PWord)
        (SubLayout                      Layout1)
        (InputPanel                     Inp_User)
        (InputPanel                     Inp_PWord)
        (Label                          Lab_Retry)
    )

    (Resources
        (Lab_Please.Label               "Please type your user name and password.")
        (Lab_Please.TopOffset           10)
        (Lab_Realm.Label                "Realm:")
        (Lab_Realm.AttachLeft           True)
        (Lab_Realm.AttachRight          True)
        (Lab_Realm.Alignment            0)
        (Inp_Realm.Label                "Web site realm")
        (Inp_Realm.AttachLeft           True)
        (Inp_Realm.Alignment            0)
        (Lab_User.Label                 "&User Name")
        (Lab_User.AttachLeft            True)
        (Lab_User.AttachRight           True)
        (Lab_User.Alignment             0)
        (Lab_PWord.Label                "Password")
        (Lab_PWord.AttachLeft           True)
        (Lab_PWord.AttachRight          True)
        (Lab_PWord.Alignment            0)
        (Inp_User.MaxLen                256)
        (Inp_PWord.MaxLen               256)
        (Inp_PWord.Password             True)
        (Lab_Retry.Label                "Authentication failed, please try again.")
        (Lab_Retry.Visible              False)
        (Lab_Retry.ForegroundColor      9)
        (Lab_Retry.TopOffset            10)
        (Lab_Retry.FontStyle            8)
        (.Label                         "Web Site Authentication")
        (.Focus                         "Inp_User")
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.DefaultButton                 "OkBtn")
        (.Layout
            (Grid (Rows 1 1 1 1) (Cols 1)
                Lab_Retry
                Lab_Please
                (Grid (Rows 1 1 1) (Cols 1 1)
                    Lab_Realm
                    Inp_Realm
                    Lab_User
                    Inp_User
                    Lab_PWord
                    Inp_PWord
                )
                Layout1
            )
        )
    )
)

(Layout Layout1
    (Components
        (PushButton                     OkBtn)
        (PushButton                     CancelBtn)
    )

    (Resources
        (OkBtn.Label                    "OK")
        (CancelBtn.Label                "Cancel")
        (.AttachRight                   True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1) (Cols 1 1)
                OkBtn
                CancelBtn
            )
        )
    )
)
