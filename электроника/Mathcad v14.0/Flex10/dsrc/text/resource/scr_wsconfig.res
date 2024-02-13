!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  scr_wsconfig.res
! 
!  Windchill Workgroup Managers Workspace Configuration screen
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  26-Sep-00           DAR          Created
!  10-Oct-00           JJE          Switch to check button
!  18-Oct-00 J-01-20   JJE   $$1    Group Submission
!  07-Dec-01 J-03-14   MAZ   $$2    SPR 917581 & 817578: Change Project to Team
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout scr_wsconfig
    (Components
        (SubLayout                      scr_wsconfig2)
        (TextArea                       TextArea)
        (Label                          Label1)
        (Label                          Label2)
        (Label                          Label3)
        (Label                          Label4)
    )

    (Resources
        (TextArea.Rows                  8)
        (TextArea.Columns               25)
        (TextArea.MaxLen                200)
        (TextArea.Editable              False)
        (TextArea.Value                 "Specify the Workspace Configuration names that are to be saved in the 'site' located preference file and set the permissions for each configuration.")
        (TextArea.Decorated             False)
        (TextArea.Wrap                  True)
        (TextArea.LeftOffset            20)
        (TextArea.RightOffset           20)
        (TextArea.ScrollBarPosition     6)
        (TextArea.CaretVisible          False)
        (TextArea.ScrollBarsWhenNeeded  True)
        (.Label                         "Workgroup Manager for PRODUCT_NAME Workspace Configuration")
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 0 0 1) (Cols 1 0 1)
                (Pos 1 2)
                Label4
                (Pos 2 2)
                TextArea
                (Pos 3 1)
                Label2
                scr_wsconfig2
                Label3
                (Pos 4 2)
                Label1
            )
        )
    )
)

(Layout scr_wsconfig2
    (Components
        (Label                          TeamNameLab)
        (InputPanel                     TeamName)
        (CheckButton                    TeamNameRO)
        (Label                          PartLifecycleLab)
        (InputPanel                     PartLifecycle)
        (CheckButton                    PartLifecycleRO)
        (Label                          DocLifecycleLab)
        (InputPanel                     DocLifecycle)
        (CheckButton                    DocLifecycleRO)
        (Label                          PartViewLab)
        (InputPanel                     PartView)
        (CheckButton                    PartViewRO)
        (Label                          LabelRO)
    )

    (Resources
        (TeamNameLab.Label              "Team Name")
        (TeamNameLab.AttachRight        True)
        (TeamNameLab.Alignment          1)
        (TeamName.AttachRight           False)
        (TeamName.AutoHighlight         True)
        (PartLifecycleLab.Label         "Part Lifecycle")
        (PartLifecycleLab.AttachRight   True)
        (PartLifecycle.AttachRight      False)
        (DocLifecycleLab.Label          "Document Lifecycle")
        (DocLifecycleLab.AttachRight    True)
        (PartViewLab.Label              "Part View")
        (PartViewLab.AttachRight        True)
        (LabelRO.Label                  "Read-Only")
        (.Label                         "Workspace Configuration")
        (.Decorated                     True)
        (.AttachLeft                    True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1 1 1 1) (Cols 1 1 1)
                (Pos 1 3)
                LabelRO
                TeamNameLab
                TeamName
                TeamNameRO
                PartLifecycleLab
                PartLifecycle
                PartLifecycleRO
                DocLifecycleLab
                DocLifecycle
                DocLifecycleRO
                PartViewLab
                PartView
                PartViewRO
            )
        )
    )
)
