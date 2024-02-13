!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  scr_dataserver.res
! 
!  The Data Server screen
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  24-Feb-00 I-03-27+  TWH   $$1    Group Submission
!  10-Apr-00           TWH          Add Maxlen, Add Comment
!  10-Apr-00 I-03-28+  JJE   $$2    Group Submission
!  16-Mar-01 I-03-38+  TWH   $$3    resizeable space avail labels 813485
!  16-Apr-04 K-01-26+  TWH   $$4    re-do layout for K-01
!  19-Jul-04 K-03-06   TWH   $$5    Add CheckButton RunCfg
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
!  Note: The radio group component contents are tied to screenDataserver
!        The numeric sizes are read from the labels as MB sizes by the screen
!        The last component should always be "Migrate".
!        Use PsDataserver::ShowMigrate = FALSE to cause this entry to be hidden
!

(Layout scr_dataserver
    (Components
        (SubLayout                      DSLayout)
        (SubLayout                      DSLptLayout)
        (SubLayout                      scr_dataserver2)
    )

    (Resources
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 0 0 0) (Cols 1)
                DSLptLayout
                scr_dataserver2
                DSLayout
            )
        )
    )
)

(Layout DSLayout
    (Components
        (RadioGroup                     DsRadioSize)
        (CheckButton                    RunCfg)
    )

    (Resources
        (DsRadioSize.Rows               4)
        (DsRadioSize.Columns            1)
        (DsRadioSize.Orientation        True)
        (DsRadioSize.AttachLeft         False)
        (DsRadioSize.AttachRight        False)
        (DsRadioSize.AttachTop          False)
        (DsRadioSize.AttachBottom       False)
        (DsRadioSize.Names              "0"
                                        "1"
                                        "2"
                                        "3")
        (DsRadioSize.Labels             "Small (130 MB)"
                                        "Medium (420 MB)"
                                        "Large (1950 MB)"
                                        "Migrate")
        (DsRadioSize.Alignment          2)
        (DsRadioSize.Resizeable         True)
        (DsRadioSize.TopOffset          5)
        (DsRadioSize.BottomOffset       5)
        (DsRadioSize.LeftOffset         5)
        (DsRadioSize.RightOffset        5)
        (DsRadioSize.TruncateLabel      False)
        (RunCfg.Label             "Run INTRALINK Configuration")
        (RunCfg.HelpText          "This option runs ds_install.  Uncheck this option only if you are using the 
Migration Procedure to Upgrade from a previous Release of Pro/INTRALINK.  
See Installation Guide for more details.")
        (RunCfg.Alignment         2)
        (RunCfg.TopOffset         5)
        (RunCfg.BottomOffset      5)
        (RunCfg.LeftOffset        5)
        (RunCfg.RightOffset       5)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.TopOffset                     1)
        (.BottomOffset                  1)
        (.LeftOffset                    1)
        (.RightOffset                   1)
        (.Layout
            (Grid (Rows 1 0) (Cols 1)
                DsRadioSize
                RunCfg
            )
        )
    )
)

(Layout DSLptLayout
    (Components
        (SubLayout                      DSLpLayout)
        (SubLayout                      DSDiskSpaceLayout)
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
                DSLpLayout
                DSDiskSpaceLayout
            )
        )
    )
)

(Layout DSLpLayout
    (Components
        (Label                          LpLab)
        (InputPanel                     LoadPoint)
        (PushButton                     LpBrowse)
    )

    (Resources
        (LpLab.Label                    "Directory for database files")
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
        (.LeftOffset                    3)
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

(Layout DSDiskSpaceLayout
    (Components
        (Label                          SpaceAvailLab)
        (Label                          SpaceReqLab)
    )

    (Resources
        (SpaceAvailLab.Label            "Available on C: 9999GB")
        (SpaceAvailLab.AttachLeft       True)
        (SpaceAvailLab.AttachRight      True)
        (SpaceAvailLab.Alignment        0)
        (SpaceAvailLab.Resizeable       True)
        (SpaceAvailLab.TruncateLabel    False)
        (SpaceReqLab.Label              "Required on C: 9999GB")
        (SpaceReqLab.AttachLeft         True)
        (SpaceReqLab.AttachRight        True)
        (SpaceReqLab.Alignment          0)
        (SpaceReqLab.Resizeable         True)
        (SpaceReqLab.TruncateLabel      False)
        (.Label                         "Disk Space")
        (.Decorated                     True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.LeftOffset                    10)
        (.RightOffset                   3)
        (.Layout
            (Grid (Rows 1 1) (Cols 1)
                SpaceAvailLab
                SpaceReqLab
            )
        )
    )
)

(Layout scr_dataserver2
    (Components
        (TextArea                       TextArea)
        (TextArea                       CompDescTA)
    )

    (Resources
        (TextArea.Rows                  3)
        (TextArea.Columns               25)
        (TextArea.MaxLen                300)
        (TextArea.Editable              False)
        (TextArea.Value                 "Identify the location of the database files and choose the size of the database.

For specific instructions see the Help screen.")
        (TextArea.Decorated             False)
        (TextArea.Wrap                  True)
        (TextArea.TopOffset             10)
        (TextArea.ScrollBarPosition     6)
        (TextArea.CaretVisible          False)
        (TextArea.ScrollBarsWhenNeeded  True)
        (CompDescTA.Columns             12)
        (CompDescTA.MaxLen              320)
        (CompDescTA.Editable            False)
        (CompDescTA.Value               "Select a component or subcomponent to view its description.")
        (CompDescTA.Decorated           False)
        (CompDescTA.Wrap                True)
        (CompDescTA.MinRows             3)
        (CompDescTA.BackgroundColor     20)
        (CompDescTA.TopOffset           5)
        (CompDescTA.ScrollBarPosition   6)
        (CompDescTA.ScrollBarsWhenNeeded True)
        (.Label                         "Instructions")
        (.Decorated                     True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.Layout
            (Grid (Rows 0 1) (Cols 1)
                TextArea
                CompDescTA
            )
        )
    )
)
