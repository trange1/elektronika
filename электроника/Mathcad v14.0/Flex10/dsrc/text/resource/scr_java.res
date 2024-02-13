!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  scr_java.res
! 
!  The java screen
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  10-Apr-00           TWH          Created
!  10-Apr-00 I-03-28+  JJE   $$1    Group Submission
!  13-Apr-00           MAZ          Layout changes
!  19-Apr-00 I-03-28+  JJE   $$2    Group Submission
!  20-Sep-00 J-01-19   MAZ   $$3    Fix label to JRE/JDK
!  23-Apr-01 J-01-32+  MAZ   $$4    Make WC R6 changes!
!  11-May-01 J-01-32+  MAZ   $$5    Use Java SDK label
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout scr_java
    (Components
        (SubLayout                      scr_java2)
        (TextArea                       TextArea)
        (Label                          Label1)
        (Label                          Label2)
        (Label                          Label3)
        (Label                          Label4)
    )

    (Resources
        (TextArea.Rows                  3)
        (TextArea.Columns               25)
        (TextArea.MaxLen                200)
        (TextArea.Editable              False)
        (TextArea.Decorated             False)
        (TextArea.Wrap                  True)
        (TextArea.TopOffset             10)
        (TextArea.ScrollBarPosition     6)
        (TextArea.CaretVisible          False)
        (TextArea.ScrollBarsWhenNeeded  True)
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
                Label1
                scr_java2
                Label2
                (Pos 4 2)
                Label3
            )
        )
    )
)

(Layout scr_java2
    (Components
        (InputPanel                     JavaDir)
        (PushButton                     BrowseJavaDir)
        (Label                          MinLab)
        (Label                          ActualLab)
        (Label                          RecLab)
        (Label                          DirLab)
    )

    (Resources
        (JavaDir.MaxLen                 255)
        (BrowseJavaDir.Bitmap           "UI dir open image")
        (BrowseJavaDir.AttachLeft       True)
        (BrowseJavaDir.AttachRight      True)
        (MinLab.Label                   "<min>")
        (MinLab.AttachLeft              True)
        (MinLab.AttachRight             True)
        (MinLab.Alignment               0)
        (MinLab.Resizeable              True)
        (MinLab.TruncateLabel           False)
        (ActualLab.Label                "<actual>")
        (ActualLab.AttachLeft           True)
        (ActualLab.AttachRight          True)
        (ActualLab.Alignment            0)
        (ActualLab.Resizeable           True)
        (ActualLab.TruncateLabel        False)
        (RecLab.Label                   "<recommended>")
        (RecLab.AttachLeft              True)
        (RecLab.AttachRight             True)
        (RecLab.Alignment               0)
        (RecLab.Resizeable              True)
        (RecLab.TruncateLabel           False)
        (DirLab.Label                   "Java SDK Directory")
        (DirLab.AttachLeft              True)
        (DirLab.AttachRight             True)
        (.Label                         "Java SDK Settings")
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
            (Grid (Rows 1 1 1 1) (Cols 1)
                (Grid (Rows 1) (Cols 0 0 1)
                    DirLab
                    JavaDir
                    BrowseJavaDir
                )
                ActualLab
                MinLab
                RecLab
            )
        )
    )
)
