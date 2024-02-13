!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
!
!  scr_ldapdir.res
! 
!  Windchill Info*Engine LDAP screen
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  22-Feb-01           DAR          Created
!  21-Mar-01 J-01-30   MAZ   $$1    Add parent layout (scr_ldapdir)
!  04-Apr-01 J-01-31   DAR   $$2    Changed some labels to multi-line
!  12-Apr-01           DAR          Changed some field lengths to 256
!  13-Apr-01           DAR          Changed radiogroup wording
!  26-Apr-01 J-01-32+  DAR   $$3    Added Web Tool fields & SPR 870028
!  30-Apr-01 J-01-32+  JJE   $$4    Modify Screen Layout
!  02-May-01           DAR          Changed size LDAP browse
!  09-May-01 J-01-32+  DAR   $$5    Changed Hostname to Host Name
!  10-Oct-01 J-01-38   MAZ          Make 6.2 changes
!  16-Oct-01 J-01-38+  MAZ          Rm reference to I*E (SPR 904533)
!  31-Oct-01 J-03-12   MAZ   $$6    Update from J-01
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout scr_ldapdir
    (Components
        (SubLayout                      scr_ldapdir1)
        (Label                          Label1)
        (Label                          Label2)
        (Label                          Label3)
        (Label                          Label4)
        (TextArea                       TextArea)
    )

    (Resources
        (TextArea.Rows                  3)
        (TextArea.Columns               25)
        (TextArea.MaxLen                200)
        (TextArea.Editable              False)
        (TextArea.Decorated             False)
        (TextArea.Wrap                  True)
        (TextArea.BackgroundColor       7)
        (TextArea.ScrollBarPosition     6)
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
                Label2
                (Grid (Rows 1 1 1 1) (Cols 1)
                    Label1
                    TextArea
                    scr_ldapdir1
                    Label4
                )
                Label3
            )
        )
    )
)

(Layout scr_ldapdir1
    (Components
        (Label                          LDAPHostLab)
        (InputPanel                     LDAPHost)
        (Label                          LDAPPortLab)
        (InputPanel                     LDAPPort)
        (Label                          AdminNameLab)
        (InputPanel                     AdminName)
        (Label                          AdminPasswdLab)
        (InputPanel                     AdminPasswd)
        (Label                          IEPropNameLab)
        (InputPanel                     IEPropName)
    )

    (Resources
        (LDAPHostLab.Label              "Server Host Name")
        (LDAPHostLab.AttachRight        True)
        (LDAPHostLab.Alignment          1)
        (LDAPHost.Columns               8)
        (LDAPHost.MaxLen                255)
        (LDAPPortLab.Label              "Port Number")
        (LDAPPortLab.AttachRight        True)
        (LDAPPortLab.Alignment          1)
        (LDAPPort.Columns               6)
        (LDAPPort.Value                 "389")
        (LDAPPort.InputType             2)
        (AdminNameLab.Label             "Administrator Distinguished Name")
        (AdminNameLab.AttachRight       True)
        (AdminNameLab.Alignment         1)
        (AdminName.Columns              14)
        (AdminName.MaxLen               256)
        (AdminPasswdLab.Label           "Administrator Password")
        (AdminPasswdLab.AttachRight     True)
        (AdminPasswdLab.Alignment       1)
        (AdminPasswd.Columns            8)
        (AdminPasswd.Password           True)
        (IEPropNameLab.Label            "Base Distinguished Name")
        (IEPropNameLab.AttachRight      True)
        (IEPropNameLab.Alignment        1)
        (IEPropName.Columns             14)
        (IEPropName.MaxLen              255)
        (.Label                         "LDAP Directory Access")
        (.Focus                         "LDAPConfigure")
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
                (Grid (Rows 1) (Cols 1 1 1)
                    LDAPHost
                    LDAPPortLab
                    LDAPPort
                )
                AdminNameLab
                AdminName
                AdminPasswdLab
                AdminPasswd
                IEPropNameLab
                IEPropName
            )
        )
    )
)
