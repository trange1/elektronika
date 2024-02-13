!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  scr_makejar.res
! 
!  The makejar screen
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  18-Apr-00           JJE          Created
!  19-Apr-00 I-03-28+  JJE   $$1    Group Submission
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout scr_makejar
    (Components
        (SubLayout                      scr_makejar2)
        (Label                          Label1)
        (Label                          Label2)
        (Label                          Label3)
        (Label                          Label5)
    )

    (Resources
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.Layout
            (Grid (Rows 1) (Cols 1 0 1)
                Label2
                (Grid (Rows 1 0 1) (Cols 0)
                    Label5
                    scr_makejar2
                    Label1
                )
                Label3
            )
        )
    )
)

(Layout scr_makejar2
    (Components
        (TextArea                       MakeJarTextArea)
        (List                           MakeJarList)
        (PushButton                     SelAllJars)
        (PushButton                     SelNoJars)
    )

    (Resources
        (MakeJarTextArea.Rows           5)
        (MakeJarTextArea.Columns        25)
        (MakeJarTextArea.MaxLen         512)
        (MakeJarTextArea.Editable       False)
        (MakeJarTextArea.Value          "The following is a list of bootstrap JAR files that should be regenerated during or after this installation. Please highlight the JAR files you wish PTC.Setup to automatically generate for you.")
        (MakeJarTextArea.Decorated      False)
        (MakeJarTextArea.Wrap           True)
        (MakeJarTextArea.TopOffset      10)
        (MakeJarTextArea.RightOffset    10)
        (MakeJarTextArea.ScrollBarPosition 6)
        (MakeJarTextArea.CaretVisible   False)
        (MakeJarTextArea.ScrollBarsWhenNeeded True)
        (MakeJarList.SelectionPolicy    3)
        (MakeJarList.Columns            12)
        (MakeJarList.VisibleRows        8)
        (MakeJarList.MinRows            10)
        (SelAllJars.Label               "Select All")
        (SelAllJars.AttachLeft          True)
        (SelAllJars.AttachRight         True)
        (SelNoJars.Label                "Select None")
        (SelNoJars.AttachLeft           True)
        (SelNoJars.AttachRight          True)
        (.Label                         "Advanced")
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1) (Cols 1)
                MakeJarTextArea
                (Grid (Rows 1) (Cols 1 1 1)
                    (Pos 1 2)
                    MakeJarList
                    (Grid (Rows 0 0 1) (Cols 1 1)
                        SelAllJars
                        (Pos 2 1)
                        SelNoJars
                    )
                )
            )
        )
    )
)
