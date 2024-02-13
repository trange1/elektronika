!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  scr_wcocu.res
!  The Windchill OCU resource file (based on the dataserver file)
! 
!  The Data Server screen
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  03-Jul-02 J-01-47   MAZ   $$1    Created based on scr_dataserver.res
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout scr_wcocu
    (Components
        (SubLayout                      WCDSLayout)
        (SubLayout                      WCDSLptLayout)
        (TextArea                       TextArea)
        (Label                          Label15)
        (Label                          Label16)
        (Label                          Label17)
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
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1 1 1) (Cols 1 1 1)
                (Pos 1 2)
                WCDSLptLayout
                (Pos 2 1)
                Label15
                TextArea
                Label17
                (Pos 3 2)
                WCDSLayout
                (Pos 4 2)
                Label16
            )
        )
    )
)

(Layout WCDSLayout
    (Components
        (SubLayout                      WCDSCompDescLayout)
        (SubLayout                      WCDSLayout2)
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
            (Grid (Rows 1 0) (Cols 1)
                (Grid (Rows 1) (Cols 1 1)
                    WCDSLayout2
                )
                WCDSCompDescLayout
            )
        )
    )
)

(Layout WCDSCompDescLayout
    (Components
        (TextArea                       CompDescTA)
    )

    (Resources
        (CompDescTA.Rows                2)
        (CompDescTA.Columns             12)
        (CompDescTA.MaxLen              320)
        (CompDescTA.Editable            False)
        (CompDescTA.Value               "Select a component or subcomponent to view its description.")
        (CompDescTA.Decorated           False)
        (CompDescTA.Wrap                True)
        (CompDescTA.BackgroundColor     20)
        (CompDescTA.ScrollBarPosition   6)
        (CompDescTA.ScrollBarsWhenNeeded True)
        (.Label                         "Description")
        (.Decorated                     True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.TopOffset                     5)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                CompDescTA
            )
        )
    )
)

(Layout WCDSLayout2
    (Components
        (RadioGroup                     DsRadioSize)
        (CheckButton                    DsVaultCheck)
    )

    (Resources
        (DsRadioSize.Rows               2)
        (DsRadioSize.Columns            2)
        (DsRadioSize.AttachTop          False)
        (DsRadioSize.AttachBottom       False)
        (DsRadioSize.Names              "0"
                                        "1"
                                        "2")
        (DsRadioSize.Labels             "Small (700 MB)"
                                        "Medium (900 MB)"
                                        "Large (1800 MB)")
        (DsRadioSize.Resizeable         True)
        (DsRadioSize.TopOffset          5)
        (DsRadioSize.BottomOffset       5)
        (DsRadioSize.LeftOffset         5)
        (DsRadioSize.RightOffset        5)
        (DsRadioSize.TruncateLabel      False)
        (DsVaultCheck.Label             "Exclusively use external file vaults")
        (DsVaultCheck.AttachLeft        True)
        (DsVaultCheck.AttachRight       True)
        (DsVaultCheck.TopOffset         5)
        (DsVaultCheck.BottomOffset      5)
        (DsVaultCheck.LeftOffset        5)
        (DsVaultCheck.RightOffset       5)
        (.Label                         "Database size")
        (.Decorated                     True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.TopOffset                     5)
        (.Layout
            (Grid (Rows 1 1) (Cols 1)
                DsVaultCheck
                DsRadioSize
            )
        )
    )
)

(Layout WCDSLptLayout
    (Components
        (SubLayout                      WCDSLpLayout)
        (SubLayout                      WCDSDiskSpaceLayout)
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
                WCDSLpLayout
                WCDSDiskSpaceLayout
            )
        )
    )
)

(Layout WCDSLpLayout
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

(Layout WCDSDiskSpaceLayout
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
        (.Layout
            (Grid (Rows 1 1) (Cols 1)
                SpaceAvailLab
                SpaceReqLab
            )
        )
    )
)
