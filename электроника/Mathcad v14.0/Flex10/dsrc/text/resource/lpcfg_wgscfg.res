!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  lpcfg_wgscfg.res
! 
!  Windchill Graphics Server properties screen
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  20-Sep-00 J-01-20   DAR   $$1    Created
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout lpcfg_wgscfg
    (Components
        (SubLayout                      lpcfg_wgscfg2)
        (TextArea                       TextArea)
        (Label                          Label1)
    )

    (Resources
        (TextArea.Rows                  8)
        (TextArea.Columns               25)
        (TextArea.MaxLen                200)
        (TextArea.Editable              False)
        (TextArea.Value                 "Specify the Windchill Graphics Server Hostname and Port Number.")
        (TextArea.Decorated             False)
        (TextArea.AttachLeft            False)
        (TextArea.AttachRight           False)
        (TextArea.Wrap                  True)
        (TextArea.ScrollBarPosition     6)
        (TextArea.CaretVisible          False)
        (TextArea.ScrollBarsWhenNeeded  True)
        (.Label                         "Windchill Graphics Server Configurations")
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
                lpcfg_wgscfg2
                Label1
            )
        )
    )
)

(Layout lpcfg_wgscfg2
    (Components
        (InputPanel                     AdapterHost)
        (Label                          HostnameLab)
        (InputPanel                     WGSPort)
        (Label                          WGSPortLab)
    )

    (Resources
        (AdapterHost.MaxLen             255)
        (AdapterHost.AutoHighlight      True)
        (HostnameLab.Label              "Fully Qualified Hostname")
        (HostnameLab.AttachRight        True)
        (HostnameLab.Alignment          1)
        (WGSPort.MaxLen                 255)
        (WGSPort.Integer                1603)
        (WGSPort.MinInteger             0)
        (WGSPort.MaxInteger             99999)
        (WGSPort.InputType              2)
        (WGSPort.AutoHighlight          True)
        (WGSPortLab.Label               "Port Number")
        (WGSPortLab.AttachRight         True)
        (WGSPortLab.Alignment           1)
        (.Label                         "Windchill Graphics Server Settings")
        (.Decorated                     True)
        (.AttachTop                     True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1) (Cols 1 1)
                HostnameLab
                AdapterHost
                WGSPortLab
                WGSPort
            )
        )
    )
)
