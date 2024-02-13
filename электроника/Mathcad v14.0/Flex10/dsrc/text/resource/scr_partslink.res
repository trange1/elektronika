!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  PartsLink properties screen
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  27-Nov-01 J-03-14   MAZ   $$1    Copied from scr_rn.res
!  10-Jan-02 J-01-41   MAZ          Fix spelling mistake, rm third*
!  07-Mar-02 J-03-21   MAZ   $$2    Submit to J-03-21
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout scr_partslink
    (Components
        (TextArea                       TextArea)
        (Label                          Label2)
        (Label                          Label1)
        (Label                          Label3)
        (Label                          Label4)
        (SubLayout                      scr_partslink2)
    )

    (Resources
        (TextArea.Rows                  3)
        (TextArea.Columns               25)
        (TextArea.MaxLen                200)
        (TextArea.Editable              False)
        (TextArea.Decorated             False)
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
            (Grid (Rows 1 1) (Cols 1 0 1)
                Label1
                (Grid (Rows 1 1 1 1) (Cols 0)
                    Label4
                    TextArea
                    scr_partslink2
                )
                Label3
                (Pos 2 2)
                Label2
            )
        )
    )
)

(Layout scr_partslink2
    (Components
        (SubLayout                      scr_partslink_common)
        (SubLayout                      scr_partslink_ports)
        (SubLayout                      scr_partslink_stats)
    )

    (Resources
        (.Layout
            (Grid (Rows 1 1 1) (Cols 1)
                scr_partslink_common
                scr_partslink_ports
                scr_partslink_stats
            )
        )
    )
)

(Layout scr_partslink_common
    (Components
        (InputPanel                     RMIPort)
        (Label                          RMIPortLab)
        (InputPanel                     JvmHomeDir)
        (Label                          JvmHomeDirLab)
        (PushButton                     JvmHomeDirBrowse)
    )

    (Resources
        (RMIPort.MaxLen                 255)
        (RMIPort.MinInteger             1)
        (RMIPort.MaxInteger             65535)
        (RMIPort.InputType              2)
        (RMIPort.AutoHighlight          True)
        (RMIPortLab.Label               "RMI Registry Port")
        (RMIPortLab.AttachRight         True)
        (RMIPortLab.Alignment           1)
        (JvmHomeDir.MaxLen              255)
        (JvmHomeDir.AutoHighlight       True)
        (JvmHomeDirLab.Label            "Java SDK Home Directory")
        (JvmHomeDirLab.AttachRight      True)
        (JvmHomeDirLab.Alignment        1)
        (JvmHomeDirBrowse.Bitmap        "UI dir open image")
        (JvmHomeDirBrowse.AttachLeft    True)
        (JvmHomeDirBrowse.AttachRight   True)
        (JvmHomeDirBrowse.LeftOffset    0)
        (.Label                         "Configuration Properties")
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
            (Grid (Rows 1 1) (Cols 1 1 0)
                RMIPortLab
                RMIPort
                (Pos 2 1)
                JvmHomeDirLab
                JvmHomeDir
                JvmHomeDirBrowse
            )
        )
    )
)

(Layout scr_partslink_ports
    (Components
        (Label                          UpdateLab)
        (InputPanel                     UpdatePort)
    )

    (Resources
        (UpdateLab.Label                "Content Update")
        (UpdateLab.AttachRight          True)
        (UpdateLab.Alignment            1)
        (UpdatePort.MaxLen              9)
        (UpdatePort.Integer             10082)
        (UpdatePort.MinInteger          1)
        (UpdatePort.MaxInteger          999999999)
        (UpdatePort.InputType           2)
        (.Label                         "Interface Ports")
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
            (Grid (Rows 1) (Cols 1 1)
                UpdateLab
                UpdatePort
            )
        )
    )
)

(Layout scr_partslink_stats
    (Components
        (Label                          StorageSizeLab)
        (Label                          StartDateLab)
        (InputPanel                     StorageSize)
        (OptionMenu                     StartDateMenu)
    )

    (Resources
        (StorageSizeLab.Label           "Maximum Statistics
Storage Size (Mb)")
        (StorageSizeLab.AttachRight     True)
        (StorageSizeLab.Alignment       1)
        (StartDateLab.Label             "Fiscal Year Start Date")
        (StartDateLab.AttachRight       True)
        (StartDateLab.Alignment         1)
        (StorageSize.Integer            10)
        (StorageSize.MinInteger         1)
        (StorageSize.MaxInteger         1024)
        (StorageSize.InputType          2)
        (StartDateMenu.Names            "1"
                                        "2"
                                        "3"
                                        "4"
                                        "5"
                                        "6"
                                        "7"
                                        "8"
                                        "9"
                                        "10"
                                        "11"
                                        "12")
        (StartDateMenu.Labels           "January"
                                        "February"
                                        "March"
                                        "April"
                                        "May"
                                        "June"
                                        "July"
                                        "August"
                                        "September"
                                        "October"
                                        "November"
                                        "December")
        (.Label                         "Statistics")
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
            (Grid (Rows 1 1) (Cols 1 1)
                StartDateLab
                StartDateMenu
                StorageSizeLab
                StorageSize
            )
        )
    )
)
