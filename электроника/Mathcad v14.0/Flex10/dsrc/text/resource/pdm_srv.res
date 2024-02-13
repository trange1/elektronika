!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  pdm_srv.res
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  17-Aug-99 I-03-12+  JJE   $$1    Group Submission
!  08-Feb-00           JJE          Add setup bitmap
!  09-Feb-00 I-03-26+  JJE   $$2    Group Submission
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Dialog pdm_srv
    (Components
        (Label                          Label1)
        (Label                          Label2)
        (Label                          Label3)
        (InputPanel                     HostName)
        (InputPanel                     PortNumber)
        (StdButton                      StdOK)
        (StdButton                      StdCancel)
    )

    (Resources
        (.Bitmap                        "setup")
        (Label1.Label                   "Specify PDM Server Location")
        (Label1.AttachTop               True)
        (Label1.TopOffset               10)
        (Label2.Label                   "HostName")
        (Label2.AttachLeft              True)
        (Label2.AttachTop               True)
        (Label2.TopOffset               10)
        (Label2.LeftOffset              10)
        (Label3.Label                   "Port")
        (Label3.AttachLeft              True)
        (Label3.AttachTop               True)
        (Label3.TopOffset               10)
        (Label3.LeftOffset              10)
        (HostName.Columns               20)
        (HostName.MaxLen                60)
        (HostName.LeftOffset            10)
        (HostName.RightOffset           5)
        (PortNumber.Columns             10)
        (PortNumber.MaxLen              15)
        (PortNumber.LeftOffset          5)
        (PortNumber.RightOffset         10)
        (StdOK.Label                    "&OK")
        (StdCancel.Label                "&Cancel")
        (.Label                         "PDM Server")
        (.Layout
            (Grid (Rows 1 1) (Cols 1)
                Label1
                (Grid (Rows 1 1) (Cols 1 1)
                    Label2
                    Label3
                    HostName
                    PortNumber
                )
            )
        )
    )
)
