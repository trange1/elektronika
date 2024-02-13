!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  lpcfg_replication.res
! 
!  Windchill Replication properties screen
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  08-Mar-00           JJE          Created
!  17-Mar-00 I-03-28+  JJE   $$1    Group Submission
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout lpcfg_replication
    (Components
        (SubLayout                      lpcfg_replication2)
        (TextArea                       TextArea)
        (Label                          Label1)
    )

    (Resources
        (TextArea.Rows                  8)
        (TextArea.Columns               25)
        (TextArea.MaxLen                200)
        (TextArea.Editable              False)
        (TextArea.Decorated             False)
        (TextArea.AttachLeft            False)
        (TextArea.AttachRight           False)
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
            (Grid (Rows 0 0 1) (Cols 1)
                TextArea
                lpcfg_replication2
                Label1
            )
        )
    )
)

(Layout lpcfg_replication2
    (Components
        (CheckButton                    ServeReplicas)
        (CheckButton                    HostReplicas)
        (CheckButton                    StdDisable)
        (Label                          SiteNameLab)
        (InputPanel                     SiteName)
    )

    (Resources
        (ServeReplicas.Label            "Replicate data from this server")
        (ServeReplicas.AttachLeft       True)
        (HostReplicas.Label             "Host replica data for other servers")
        (HostReplicas.AttachLeft        True)
        (StdDisable.Label               "Disable all non-replication services")
        (StdDisable.AttachLeft          True)
        (SiteNameLab.Label              "Name of site hosting replica data")
        (SiteName.Columns               12)
        (.Label                         "Replication Settings")
        (.Decorated                     True)
        (.AttachTop                     True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1 1 1) (Cols 1)
                ServeReplicas
                HostReplicas
                (Grid (Rows 1) (Cols 1 1)
                    SiteNameLab
                    SiteName
                )
                StdDisable
            )
        )
    )
)
