!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  scr_migrate.res
! 
!  The migrate screen
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  24-Feb-00 I-03-27+  TWH   $$1    Group Submission
!  11-Jul-00           TWH          Hide Oracle Password components
!  16-Aug-00 I-03-32+  TWH   $$2    Group Submission
!  16-Mar-01 I-03-38+  TWH   $$3    resizeable space avail labels 813485
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout scr_migrate
    (Components
        (SubLayout                      scr_migrate2)
        (Label                          Label1)
        (Label                          Label2)
        (Label                          Label3)
        (Label                          Label4)
    )

    (Resources
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 0 0 1 1) (Cols 1 0 1)
                (Pos 1 2)
                Label4
                (Pos 3 1)
                Label1
                scr_migrate2
                Label2
                (Pos 5 2)
                Label3
            )
        )
    )
)

(Layout scr_migrate2
    (Components
        (SubLayout                      MigLoadpointLayout)
        (SubLayout                      LayoutMig)
        (TextArea                       TextArea)
    )

    (Resources
        (TextArea.Rows                  3)
        (TextArea.Columns               25)
        (TextArea.MaxLen                300)
        (TextArea.Editable              False)
        (TextArea.Decorated             False)
        (TextArea.Wrap                  True)
        (TextArea.TopOffset             10)
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
            (Grid (Rows 1 1 1) (Cols 1)
                MigLoadpointLayout
                TextArea
                LayoutMig
            )
        )
    )
)

(Layout MigLoadpointLayout
    (Components
        (SubLayout                      MigLpLayout)
        (SubLayout                      MigDiskSpaceLayout)
    )

    (Resources
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.TopOffset                     1)
        (.BottomOffset                  1)
        (.LeftOffset                    1)
        (.RightOffset                   1)
        (.Layout
            (Grid (Rows 1) (Cols 1 0)
                MigLpLayout
                MigDiskSpaceLayout
            )
        )
    )
)

(Layout MigLpLayout
    (Components
        (Label                          LpLab)
        (InputPanel                     LoadPoint)
        (PushButton                     LpBrowse)
    )

    (Resources
        (LpLab.Label                    "Temporary Directory for Migration Process")
        (LpLab.AttachLeft               True)
        (LpLab.AttachRight              True)
        (LpLab.Alignment                0)
        (LoadPoint.Columns              0)
        (LoadPoint.MaxLen               255)
        (LoadPoint.RightOffset          2)
        (LpBrowse.Bitmap                "UI dir open image")
        (LpBrowse.HelpText              "Browse for Installation Directory")
        (LpBrowse.AttachLeft            True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.Alignment                     2)
        (.Layout
            (Grid (Rows 0 1) (Cols 1 0)
                LpLab
                (Pos 2 1)
                LoadPoint
                LpBrowse
            )
        )
    )
)

(Layout MigDiskSpaceLayout
    (Components
        (Label                          SpaceAvailLab)
        (Label                          SpaceReqLab)
    )

    (Resources
        (SpaceAvailLab.Label            "Available on C: 9999GB")
        (SpaceAvailLab.AttachLeft       True)
        (SpaceAvailLab.AttachRight      True)
        (SpaceAvailLab.Alignment        0)
        (SpaceAvailLab.TruncateLabel    False)
        (SpaceAvailLab.Resizeable       True)
        (SpaceReqLab.Label              "Required on C: 9999GB")
        (SpaceReqLab.AttachLeft         True)
        (SpaceReqLab.AttachRight        True)
        (SpaceReqLab.Alignment          0)
        (SpaceReqLab.TruncateLabel      False)
        (SpaceReqLab.Resizeable         True)
        (.Label                         "Disk Space")
        (.Decorated                     True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.LeftOffset                    10)
        (.Layout
            (Grid (Rows 1 1) (Cols 1)
                SpaceAvailLab
                SpaceReqLab
            )
        )
    )
)

(Layout LayoutMig
    (Components
        (Label                          Label6)
        (InputPanel                     SysPasswd)
        (RadioGroup                     MigrateGroup)
        (Label                          Label7)
        (PushButton                     Status)
        (Label                          Label12)
        (Label                          Label13)
    )

    (Resources
        (Label6.Label                   "Oracle 'SYSTEM' Password")
        (Label6.Visible                 False)
        (Label6.AttachLeft              True)
        (Label6.AttachRight             True)
        (Label6.Alignment               1)
        (Label6.RightOffset             2)
        (SysPasswd.Visible              False)
        (SysPasswd.LeftOffset           5)
        (SysPasswd.Password             True)
        (MigrateGroup.Orientation       True)
        (MigrateGroup.AttachLeft        False)
        (MigrateGroup.AttachRight       False)
        (MigrateGroup.Names             "0"
                                        "1")
        (MigrateGroup.Labels            "Generate report on Data Server configuration only"
                                        "Perform export migration step with report generation")
        (MigrateGroup.Alignment         2)
        (Label7.Label                   "Status:")
        (Label7.AttachLeft              True)
        (Label7.AttachRight             True)
        (Label7.Alignment               1)
        (Status.Label                   "Migration Required")
        (Status.ButtonStyle             3)
        (Status.AttachLeft              True)
        (Status.ForegroundColor         27)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.TopOffset                     1)
        (.BottomOffset                  1)
        (.LeftOffset                    1)
        (.RightOffset                   1)
        (.Layout
            (Grid (Rows 1 1 1) (Cols 1)
                (Grid (Rows 1 1) (Cols 1 1)
                    Label6
                    SysPasswd
                    Label12
                )
                MigrateGroup
                (Grid (Rows 1 1) (Cols 1 1)
                    Label13
                    (Pos 2 1)
                    Label7
                    Status
                )
            )
        )
    )
)
