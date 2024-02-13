!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
!
!  dlg_proxy.res
!
!  Web download authentication dialog
!
!  Date        Release   Name  Ver.   Comments
!  ----------- -------   ----  ----   --------
!  07-Jun-2004 K-01-28   JJE          Created
!  21-Jun-2004 K-03-04   MAZ   $$1    Sub to K-03
!  24-Jan-2005 K-03-18   MAZ   $$2    SPR 1123468: set MaxLen to MAXHOSTNAMELEN
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Dialog dlg_proxy
    (Components
        (Label                          Lab_Proxy)
        (Label                          Lab_Host)
        (Label                          Lab_Port)
        (SubLayout                      Layout1)
        (InputPanel                     Inp_Host)
        (InputPanel                     Inp_Port)
        (Label                          Lab_Retry)
    )

    (Resources
        (Lab_Proxy.Label                "Please specify your HTTP Proxy")
        (Lab_Proxy.TopOffset            10)
        (Lab_Host.Label                 "&Host Address:")
        (Lab_Host.AttachLeft            True)
        (Lab_Host.AttachRight           True)
        (Lab_Host.Alignment             0)
        (Lab_Host.RightOffset           0)
        (Lab_Port.Label                 "Port:")
        (Lab_Port.AttachLeft            True)
        (Lab_Port.AttachRight           True)
        (Lab_Port.Alignment             0)
        (Lab_Port.RightOffset           0)
        (Inp_Host.Columns               12)
        (Inp_Host.MaxLen                64)
        (Inp_Port.Columns               5)
        (Inp_Port.InputType             2)
        (Lab_Retry.Label                "Connection failed, please try again.")
        (Lab_Retry.Visible              False)
        (Lab_Retry.ForegroundColor      9)
        (Lab_Retry.TopOffset            10)
        (Lab_Retry.FontStyle            8)
        (.Label                         "Proxy Configuration")
        (.Focus                         "Inp_User")
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.DefaultButton                 "OkBtn")
        (.Layout
            (Grid (Rows 1 1 1 1) (Cols 1)
                Lab_Retry
                Lab_Proxy
                (Grid (Rows 1) (Cols 1 1 1 1)
                    Lab_Host
                    Inp_Host
                    Lab_Port
                    Inp_Port
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
