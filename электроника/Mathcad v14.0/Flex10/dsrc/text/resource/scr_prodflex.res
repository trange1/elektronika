!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
!
!  scr_prodflex - FLEXlm install version of screen prod 
!
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  29-Apr-03 K-01-06   TWH   $$1    Created.
!  29-Jul-03 K-01-11   TWH   $$2    Allow DND
!  25-Aug-03 K-01-13   TWH   $$3    Hyper link cmdline args
!  22-Jan-04 K-01-22   TWH   $$4    Enable popup help on Tree
!  04-Aug-05 K-03-30   TWH   $$5    FLEXlm -> FLEXnet
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout scr_prodflex
    (Components
        (SubLayout                      prodflexTopLayout)
        (SashLayout                     Sash3)
    )

    (Resources
        (.AttachLeft                    True)
        (.AttachTop                     True)
        (.Layout
            (Grid (Rows 0 1) (Cols 1)
                prodflexTopLayout
                Sash3
            )
        )
    )
)

(Layout prodflexTopLayout
    (Components
        (SubLayout                      prodflexLayout3)
        (SubLayout                      FlexLPLayout)
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
            (Grid (Rows 1) (Cols 1 0)
                FlexLPLayout
                prodflexLayout3
            )
        )
    )
)

(Layout prodflexLayout3
    (Components
        (Label                          Label7)
        (Label                          Label8)
    )

    (Resources
        (Label7.Label                   "Available on C: 9999GB")
        (Label7.AttachLeft              True)
        (Label7.AttachRight             True)
        (Label7.Alignment               0)
        (Label7.Resizeable              True)
        (Label7.TruncateLabel           False)
        (Label8.Label                   "Required on C: 9999GB")
        (Label8.AttachLeft              True)
        (Label8.AttachRight             True)
        (Label8.Alignment               0)
        (Label8.Resizeable              True)
        (Label8.TruncateLabel           False)
        (.Label                         "Disk Space")
        (.Decorated                     True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.Layout
            (Grid (Rows 1 1) (Cols 1)
                Label7
                Label8
            )
        )
    )
)

(Layout FlexLPLayout
    (Components
        (OptionMenu                     LpMenuFlex)
        (PushButton                     PushButton2)
        (Label                          LpReleaseLab)
    )

    (Resources
        (LpMenuFlex.MaxLen              256)
        (LpMenuFlex.Editable            True)
        (LpMenuFlex.AttachBottom        True)
        (PushButton2.Bitmap             "UI dir open image")
        (PushButton2.ButtonStyle        2)
        (PushButton2.KeyboardInput      True)
        (PushButton2.LeftOffset         5)
        (LpReleaseLab.Label             "Dummy Label")
        (LpReleaseLab.AttachLeft        True)
        (LpReleaseLab.AttachTop         True)
        (LpReleaseLab.Alignment         0)
        (LpReleaseLab.Resizeable        True)
        (LpReleaseLab.TopOffset         3)
        (.Label                         "Destination Folder")
        (.Decorated                     True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.Layout
            (Grid (Rows 1 1) (Cols 1 0)
                LpMenuFlex
                PushButton2
                LpReleaseLab
            )
        )
    )
)

(Sash Sash3
    (Components
        (SubLayout                      prodflexTreeLayout)
        (SubLayout                      prodflexOptLayout)
    )

    (Resources
        (.Sensitive                     False)
        (.Orientation                   True)
    )
)

(Layout prodflexTreeLayout
    (Components
        (Tree                           Tree2)
        (SubLayout                      prodflexLayout5)
        (InputPanel                     InputPanel1)
        (PushButton                     PushButton1)
    )

    (Resources
        (Tree2.TreeLinkStyle            95)
        (Tree2.TreeDisplayRoot          False)
        (Tree2.ValidDropTypes           4)
        (Tree2.PopupHelpEnabled         True)
        (InputPanel1.MaxLen             256)
        (InputPanel1.ValidDropTypes     4)
        (PushButton1.Bitmap             "UI dir open image")
        (PushButton1.ButtonStyle        2)
        (PushButton1.KeyboardInput      True)
        (.Label                         "License File")
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
            (Grid (Rows 0 1) (Cols 1 0)
                InputPanel1
                PushButton1
                Tree2
                prodflexLayout5
            )
        )
    )
)


(Layout prodflexLayout5
    (Components
        (PushButton                     PushButton15)
    )

    (Resources
        (PushButton15.Bitmap            "UI file image")
        (PushButton15.HelpText          "Edit license file")
        (PushButton15.ButtonStyle       2)
        (PushButton15.KeyboardInput     True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                PushButton15
            )
        )
    )
)

(Layout prodflexOptLayout
    (Components
        (PushButton                     PushButton6)
        (Tab                            Tab1
                                        UnixLayout
                                        StdLayout)
    )

    (Resources
        (PushButton6.Bitmap             "UI Menu Cascade unsel image")
        (PushButton6.Label              "FLEXnet Server Options")
        (PushButton6.ButtonStyle        2)
        (PushButton6.AttachLeft         True)
        (PushButton6.AttachRight        True)
        (PushButton6.AttachTop          True)
        (PushButton6.AttachBottom       True)
        (PushButton6.KeyboardInput      True)
        (PushButton6.ButtonAlignment    4411)
        (Tab1.Visible                   False)
        (Tab1.Collapsable               True)
        (Tab1.TopOffset                 5)
        (Tab1.BottomOffset              5)
        (Tab1.LeftOffset                5)
        (Tab1.RightOffset               5)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.Layout
            (Grid (Rows 0 1) (Cols 1)
                PushButton6
                Tab1
            )
        )
    )
)

(Layout UnixLayout
    (Components
        (Label                          Label3)
        (Label                          Label9)
        (PushButton                     uCmdLineArgs)
        (InputPanel                     InputPanel5)
        (PushButton                     PushButton16)
        (InputPanel                     InputPanel2)
        (InputPanel                     InputPanel6)
        (Label                          RebootLab)
        (CheckButton                    CheckButton2)
    )

    (Resources
        (Label3.Label                   "Server process owner")
        (Label3.AttachLeft              True)
        (Label3.AttachRight             True)
        (Label3.Alignment               1)
        (Label3.Resizeable              True)
        (Label3.TruncateLabel           False)
        (Label9.Label                   "Create Links to Directory")
        (Label9.AttachLeft              True)
        (Label9.AttachRight             True)
        (Label9.Alignment               1)
        (uCmdLineArgs.Label             "Command Line Arguments")
        (uCmdLineArgs.ButtonStyle       4)
        (uCmdLineArgs.AttachLeft        True)
        (uCmdLineArgs.AttachRight       True)
        (uCmdLineArgs.Alignment         1)
        (uCmdLineArgs.Resizeable        True)
        (InputPanel5.Columns            18)
        (InputPanel5.MaxLen             256)
        (PushButton16.Bitmap            "UI dir open image")
        (PushButton16.ButtonStyle       2)
        (PushButton16.AttachLeft        True)
        (PushButton16.KeyboardInput     True)
        (InputPanel6.MaxLen             120)
        (RebootLab.Label                "Start on Reboot")
        (RebootLab.AttachLeft           True)
        (RebootLab.AttachRight          True)
        (RebootLab.Alignment            1)
        (CheckButton2.AttachLeft        True)
        (.Label                         "Unix")
        (.Mapped                        False)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 0 0 0 0) (Cols 0 1 1)
                Label9
                InputPanel5
                PushButton16
                Label3
                InputPanel2
                (Pos 3 1)
                uCmdLineArgs
                InputPanel6
                (Pos 4 1)
                RebootLab
                CheckButton2
            )
        )
    )
)

(Layout StdLayout
    (Components
        (InputPanel                     InputPanel3)
        (PushButton                     wCmdLineArgs)
        (Label                          RebootLabW)
        (CheckButton                    CheckButton1)
    )

    (Resources
        (InputPanel3.MaxLen             120)
        (wCmdLineArgs.Label             "Command Line Arguments")
        (wCmdLineArgs.ButtonStyle       4)
        (wCmdLineArgs.AttachLeft        True)
        (wCmdLineArgs.AttachRight       True)
        (wCmdLineArgs.Alignment         1)
        (wCmdLineArgs.Resizeable        True)
        (RebootLabW.Label               "Start on Reboot")
        (RebootLabW.AttachLeft          True)
        (RebootLabW.AttachRight         True)
        (RebootLabW.Alignment           1)
        (CheckButton1.AttachLeft        True)
        (.Decorated                     True)
        (.Mapped                        False)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 0 1) (Cols 0 1)
                wCmdLineArgs
                InputPanel3
                RebootLabW
                CheckButton1
            )
        )
    )
)
