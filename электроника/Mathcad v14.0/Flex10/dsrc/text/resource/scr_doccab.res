!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  scr_doccab.res
! 
!  Windchill document cabinet properties screen
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  23-Mar-99           JJE          Created
!  28-Mar-00 I-03-28+  JJE   $$1    Group Submission
!  25-Apr-01 J-01-32+  DAR   $$2    Added template files prompts
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout scr_doccab
    (Components
        (SubLayout                      scr_doccab1)
        (SubLayout                      scr_doccab2)
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
        (TextArea.Value                 " ")
        (TextArea.Decorated             False)
        (TextArea.AttachTop             False)
        (TextArea.AttachBottom          False)
        (TextArea.Wrap                  True)
        (TextArea.ScrollBarPosition     6)
        (TextArea.CaretVisible          False)
        (TextArea.ScrollBarsWhenNeeded  True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 0 0 1 1) (Cols 1 1 1)
                (Pos 1 2)
                Label4
                (Pos 2 1)
                Label2
                TextArea
                Label3
                (Pos 3 2)
                scr_doccab1
                (Pos 4 2)
                scr_doccab2
                (Pos 5 2)
                Label1
            )
        )
    )
)

(Layout scr_doccab1
    (Components
        (InputPanel                     DocumentCabinetName)
        (Label                          DocumentCabinetLab)
    )

    (Resources
        (DocumentCabinetName.AutoHighlight True)
        (DocumentCabinetLab.Label       "Default Document Cabinet Name")
        (DocumentCabinetLab.AttachRight True)
        (DocumentCabinetLab.Alignment   1)
        (.Label                         "Windchill Document Cabinet Setting")
        (.Decorated                     True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    6)
        (.RightOffset                   6)
        (.Layout
            (Grid (Rows 1) (Cols 1 1)
                DocumentCabinetLab
                DocumentCabinetName
            )
        )
    )
)

(Layout scr_doccab2
    (Components
        (Label                          ComponentNameLab)
        (Label                          AssemblyNameLab)
        (Label                          DrawingNameLab)
        (InputPanel                     ComponentName)
        (InputPanel                     AssemblyName)
        (InputPanel                     DrawingName)
    )

    (Resources
        (ComponentNameLab.Label         "CAD Component Document Name")
        (ComponentNameLab.AttachRight   True)
        (AssemblyNameLab.Label          "CAD Assembly Document Name")
        (AssemblyNameLab.AttachRight    True)
        (AssemblyNameLab.Alignment      1)
        (DrawingNameLab.Label           "CAD Drawing Document Name")
        (DrawingNameLab.AttachRight     True)
        (DrawingNameLab.Alignment       1)
        (.Label                         "Windchill CAD Template Files")
        (.Decorated                     True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1 1) (Cols 1 1)
                ComponentNameLab
                ComponentName
                AssemblyNameLab
                AssemblyName
                DrawingNameLab
                DrawingName
            )
        )
    )
)
