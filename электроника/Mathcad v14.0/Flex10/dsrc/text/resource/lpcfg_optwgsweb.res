!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  lpcfg_optwgsweb.res
! 
!  Optegra Gateway I*E Web Server settings optional screen
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  19-Sep-00           DAR          Created
!  20-Sep-00 J-01-19   MAZ   $$1    Add title and textarea value
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout lpcfg_optwgsweb
    (Components
        (SubLayout                      lpcfg_optwgsweb2)
        (TextArea                       TextArea)
        (Label                          Label1)
    )

    (Resources
        (TextArea.Rows                  8)
        (TextArea.Columns               25)
        (TextArea.MaxLen                200)
        (TextArea.Editable              False)
        (TextArea.Value                 "Specify the Windchill Graphics Web Server and User Name and Password for Authentication")
        (TextArea.Decorated             False)
        (TextArea.AttachLeft            False)
        (TextArea.AttachRight           False)
        (TextArea.Wrap                  True)
        (TextArea.ScrollBarPosition     6)
        (TextArea.CaretVisible          False)
        (TextArea.ScrollBarsWhenNeeded  True)
        (.Label                         "Windchill Graphics Web Server Access Settings")
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
                lpcfg_optwgsweb2
                Label1
            )
        )
    )
)

(Layout lpcfg_optwgsweb2
    (Components
        (InputPanel                     HostName)
        (Label                          HostNameLab)
        (InputPanel                     UserName)
        (Label                          UserPassLab)
        (InputPanel                     UserPass)
        (Label                          UserNameLab)
    )

    (Resources
        (HostName.MaxLen                255)
        (HostName.AutoHighlight         True)
        (HostNameLab.Label              "Web Server Hostname:")
        (HostNameLab.AttachRight        True)
        (HostNameLab.Alignment          1)
        (UserName.MaxLen                255)
        (UserName.AutoHighlight         True)
        (UserPassLab.Label              "Password:")
        (UserPassLab.AttachRight        True)
        (UserPassLab.Alignment          1)
        (UserPass.MaxLen                255)
        (UserPass.AutoHighlight         True)
        (UserPass.Password              True)
        (UserNameLab.Label              "User Name:")
        (UserNameLab.AttachRight        True)
        (UserNameLab.Alignment          1)
        (.Label                         "Windchill Graphics Web Server Access Settings")
        (.Decorated                     True)
        (.AttachTop                     True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1 1) (Cols 1 1)
                HostNameLab
                HostName
                UserNameLab
                UserName
                UserPassLab
                UserPass
            )
        )
    )
)
