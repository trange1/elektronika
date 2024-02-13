!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  RosettaNet adapter properties screen
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  18-Oct-00 J-01-20   TWH   $$1    Created
!  02-May-01           DAR          Added fields for LDAP & and I*E
!  09-May-01 J-01-32+  DAR   $$2    2 words for hostname and username
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout scr_rn_adptr
    (Components
        (SubLayout                      scr_rn_adptr1)
        (SubLayout                      scr_rn_adptr2)
        (SubLayout                      scr_rn_adptr3)
        (Label                          Label1)
        (Label                          Label2)
    )

    (Resources
        (Label1.AttachRight             True)
        (Label1.Alignment               1)
        (Label2.AttachLeft              True)
        (Label2.Alignment               0)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.Alignment                     2)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1) (Cols 1 0 1)
                Label1
                (Grid (Rows 1 1 1) (Cols 0)
                    scr_rn_adptr1
                    scr_rn_adptr2
                    scr_rn_adptr3
                )
                Label2
            )
        )
    )
)

(Layout scr_rn_adptr1
    (Components
        (Label                          portnumberLab)
        (InputPanel                     portnumber)
        (Label                          useridLab)
        (InputPanel                     userid)
        (Label                          passwordLab)
        (InputPanel                     password)
    )

    (Resources
        (portnumberLab.Label            "Port Number")
        (portnumberLab.AttachRight      True)
        (portnumberLab.Alignment        1)
        (portnumber.Columns             8)
        (portnumber.Integer             10066)
        (portnumber.MinInteger          1)
        (portnumber.MaxInteger          65535)
        (portnumber.InputType           2)
        (useridLab.Label                "User Name")
        (useridLab.AttachLeft           True)
        (useridLab.AttachRight          True)
        (useridLab.Alignment            1)
        (userid.Columns                 6)
        (passwordLab.Label              "Password")
        (passwordLab.AttachLeft         True)
        (passwordLab.AttachRight        True)
        (passwordLab.Alignment          1)
        (password.Columns               5)
        (password.Password              True)
        (.Label                         "Info*Engine Adapter Settings")
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
            (Grid (Rows 1 1) (Cols 1 1)
                portnumberLab
                portnumber
                useridLab
                (Grid (Rows 1) (Cols 1 1 1)
                    userid
                    passwordLab
                    password
                )
            )
        )
    )
)

(Layout scr_rn_adptr2
    (Components
        (Label                          IEInstallDirLab)
        (InputPanel                     IEInstallDir)
        (Label                          IEServiceLab)
        (InputPanel                     IEService)
        (PushButton                     IEServiceBrowse)
    )

    (Resources
        (IEInstallDirLab.Label          "Installation Directory")
        (IEInstallDirLab.AttachRight    True)
        (IEInstallDir.Columns           20)
        (IEInstallDir.MaxLen            256)
        (IEInstallDir.Value             "C:\ptc\Windchill")
        (IEServiceLab.Label             "Naming Service Name")
        (IEServiceLab.AttachRight       True)
        (IEServiceLab.Alignment         1)
        (IEService.MaxLen               256)
        (IEServiceBrowse.Bitmap         "UI dir open image")
        (IEServiceBrowse.AttachLeft     True)
        (IEServiceBrowse.AttachRight    True)
        (IEServiceBrowse.LeftOffset     0)
        (.Label                         "Info*Engine Configurations")
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
            (Grid (Rows 1 0) (Cols 1 0)
                IEInstallDirLab
                (Grid (Rows 1) (Cols 0 0)
                    IEInstallDir
                    IEServiceBrowse
                )
                IEServiceLab
                IEService
            )
        )
    )
)

(Layout scr_rn_adptr3
    (Components
        (Label                          LDAPHostLab)
        (InputPanel                     LDAPHost)
        (Label                          LDAPPortLab)
        (InputPanel                     LDAPPort)
        (Label                          LDAPUserLab)
        (InputPanel                     LDAPUser)
        (Label                          LDAPPasswordLab)
        (InputPanel                     LDAPPassword)
        (Label                          IEPropNameLab)
        (InputPanel                     IEPropName)
    )

    (Resources
        (LDAPHostLab.Label              "Server Host Name")
        (LDAPHostLab.AttachRight        True)
        (LDAPHostLab.Alignment          1)
        (LDAPHost.Columns               10)
        (LDAPPortLab.Label              "Port Number")
        (LDAPPortLab.AttachRight        True)
        (LDAPPort.Columns               6)
        (LDAPPort.Value                 "389")
        (LDAPPort.InputType             2)
        (LDAPUserLab.Label              "User Distinguished Name")
        (LDAPUserLab.AttachRight        True)
        (LDAPUserLab.Alignment          1)
        (LDAPUser.MaxLen                256)
        (LDAPPasswordLab.Label          "User Password")
        (LDAPPasswordLab.AttachRight    True)
        (LDAPPasswordLab.Alignment      1)
        (LDAPPassword.Password          True)
        (IEPropNameLab.Label            "Info*Engine Properties
Base Distinguished Name")
        (IEPropNameLab.AttachRight      True)
        (IEPropNameLab.Alignment        1)
        (IEPropName.MaxLen              256)
        (.Label                         "LDAP Directory Access")
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
            (Grid (Rows 1 1 1 1) (Cols 1 1)
                LDAPHostLab
                (Grid (Rows 1) (Cols 1 0 0)
                    LDAPHost
                    LDAPPortLab
                    LDAPPort
                )
                LDAPUserLab
                LDAPUser
                LDAPPasswordLab
                LDAPPassword
                IEPropNameLab
                IEPropName
            )
        )
    )
)
