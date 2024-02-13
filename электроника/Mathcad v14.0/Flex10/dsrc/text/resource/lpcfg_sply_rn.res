!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  RosettaNet properties screen for SupplyLink
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  01-May-02 J-01-44+  MAZ   $$1    Created
!  28-May-02 J-01-45+  MAZ   $$2    Change some lables' text
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout lpcfg_sply_rn
    (Components
        (TextArea                       TextArea)
        (Label                          Label2)
        (Label                          Label1)
        (Label                          Label3)
        (Label                          Label4)
        (SubLayout                      lpcfg_sply_rn2)
        (SubLayout                      lpcfg_sply_rn3)
        (SubLayout                      lpcfg_sply_rn4)
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
                (Grid (Rows 1 1 1 1 1 1) (Cols 0)
                    Label4
                    TextArea
                    lpcfg_sply_rn2
                    lpcfg_sply_rn3
                    lpcfg_sply_rn4
                    Label2
                )
                Label3
            )
        )
    )
)

(Layout lpcfg_sply_rn2
    (Components
        (Label                          rmi_port_label)
        (InputPanel                     rmi_port)
    )

    (Resources
        (rmi_port_label.Label           "RMI Registry Port Number")
        (rmi_port_label.AttachLeft      True)
        (rmi_port_label.TopOffset       5)
        (rmi_port_label.BottomOffset    5)
        (rmi_port_label.LeftOffset      5)
        (rmi_port_label.RightOffset     5)
        (rmi_port.Value                 "10011")
        (rmi_port.TopOffset             5)
        (rmi_port.BottomOffset          5)
        (rmi_port.LeftOffset            5)
        (rmi_port.RightOffset           5)
        (.Label                         "Configuration Properties")
        (.Decorated                     True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.Layout
            (Grid (Rows 1) (Cols 1 1)
                rmi_port_label
                rmi_port
            )
        )
    )
)

(Layout lpcfg_sply_rn3
    (Components
        (Label                          port_label)
        (InputPanel                     port)
        (Label                          duns_label)
        (InputPanel                     duns)
    )

    (Resources
        (port_label.Label               "Port Number")
        (port_label.AttachLeft          True)
        (port_label.TopOffset           5)
        (port_label.BottomOffset        5)
        (port_label.LeftOffset          5)
        (port_label.RightOffset         5)
        (port.Value                     "10080")
        (port.TopOffset                 5)
        (port.BottomOffset              5)
        (port.LeftOffset                5)
        (port.RightOffset               5)
        (duns_label.Label               "DUNS Number")
        (duns_label.AttachLeft          True)
        (duns_label.TopOffset           5)
        (duns_label.BottomOffset        5)
        (duns_label.LeftOffset          5)
        (duns_label.RightOffset         5)
        (duns.Value                     "100000000")
        (duns.TopOffset                 5)
        (duns.LeftOffset                5)
        (duns.RightOffset               5)
        (.Label                         "Windchill Gateway for RosettaNet Properties")
        (.Decorated                     True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.Layout
            (Grid (Rows 1 1) (Cols 1 1)
                port_label
                port
                duns_label
                duns
            )
        )
    )
)

(Layout lpcfg_sply_rn4
    (Components
        (Label                          ieport_label)
        (Label                          user_label)
        (Label                          passwd_label)
        (InputPanel                     ieport)
        (InputPanel                     user)
        (InputPanel                     passwd)
    )

    (Resources
        (ieport_label.Label             "Port Number")
        (ieport_label.AttachLeft        True)
        (ieport_label.TopOffset         5)
        (ieport_label.BottomOffset      5)
        (ieport_label.LeftOffset        5)
        (ieport_label.RightOffset       5)
        (user_label.Label               "User Name")
        (user_label.AttachLeft          True)
        (user_label.TopOffset           5)
        (user_label.BottomOffset        5)
        (user_label.LeftOffset          5)
        (user_label.RightOffset         5)
        (passwd_label.Label             "Password")
        (passwd_label.AttachLeft        True)
        (passwd_label.TopOffset         5)
        (passwd_label.BottomOffset      5)
        (passwd_label.LeftOffset        5)
        (passwd_label.RightOffset       5)
        (ieport.Value                   "10066")
        (ieport.TopOffset               5)
        (ieport.BottomOffset            5)
        (ieport.LeftOffset              5)
        (ieport.RightOffset             5)
        (user.TopOffset                 5)
        (user.BottomOffset              5)
        (user.LeftOffset                5)
        (user.RightOffset               5)
        (passwd.TopOffset               5)
        (passwd.BottomOffset            5)
        (passwd.LeftOffset              5)
        (passwd.RightOffset             5)
        (passwd.Password                True)
        (.Label                         "Windchill RosettaNet Adapter Properties")
        (.Decorated                     True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.Layout
            (Grid (Rows 1 1 1) (Cols 1 1)
                ieport_label
                ieport
                user_label
                user
                passwd_label
                passwd
            )
        )
    )
)
