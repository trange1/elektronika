!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  scr_liclst.res
! 
!  The license list screen
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  16-Feb-99 I-03-02   JJE   $$1    Group submission
!  29-Apr-03 K-01-06   TWH   $$2    Rewrite - no longer genlist
!  19-May-03 K-01-07   TWH   $$3    Add license img "keys" to tree usage
!  09-Jun-03 K-01-08   TWH   $$4    rename layout
!  29-Jul-03 K-01-11   TWH   $$5    Support edit
!  04-Aug-05 K-03-30   TWH   $$6    FLEXlm -> FLEXnet
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout scr_liclst
    (Components
        (SubLayout                      scr_liclst2)
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
            (Grid (Rows 1) (Cols 1)
                scr_liclst2
            )
        )
    )
)

(Layout scr_liclst2
    (Components
        (Tree                           Tree1)
        (PushButton                     PushButton1)
        (PushButton                     PushButton2)
        (Label                          LicSrvLab)
        (Label                          DumLabLL)
        (SubLayout                      scr_liclist3)
        (Label                          TreeLegend)
        (PushButton                     PushButton3)
    )

    (Resources
        (Tree1.TreeLinkStyle            95)
        (Tree1.TreeDisplayRoot          False)
        (PushButton1.Label              "Add")
        (PushButton1.AttachLeft         True)
        (PushButton1.AttachRight        True)
        (PushButton1.Resizeable         True)
        (PushButton1.KeyboardInput      True)
        (PushButton2.Label              "Delete")
        (PushButton2.AttachLeft         True)
        (PushButton2.AttachRight        True)
        (PushButton2.Resizeable         True)
        (PushButton2.KeyboardInput      True)
        (LicSrvLab.Label                "FLEXnet License Servers")
        (LicSrvLab.AttachLeft           True)
        (LicSrvLab.AttachBottom         True)
        (LicSrvLab.BottomOffset         0)
        (TreeLegend.Label               "Legend: <ltr> License to Run;  <ext> Startup Extensions;  <flt> Floating options")
        (TreeLegend.AttachLeft          True)
        (TreeLegend.AttachTop           True)
        (TreeLegend.Alignment           0)
        (TreeLegend.SymbolNames         "ltr"
                                        "ext"
                                        "flt")
        (TreeLegend.SymbolImages        "ps_run_licenses"
                                        "ps_extension"
                                        "ps_floating_license")
        (PushButton3.Label              "Edit")
        (PushButton3.AttachLeft         True)
        (PushButton3.AttachRight        True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 0 0 1 0) (Cols 1 1)
                scr_liclist3
                (Pos 2 1)
                LicSrvLab
                (Pos 3 1)
                Tree1
                (Grid (Rows 0 0 0 1) (Cols 1)
                    PushButton1
                    PushButton3
                    PushButton2
                    DumLabLL
                )
                TreeLegend
            )
        )
    )
)


(Layout scr_liclist3
    (Components
        (TextArea                       TextArea1)
    )

    (Resources
        (TextArea1.Rows                 3)
        (TextArea1.MaxLen               512)
        (TextArea1.Editable             False)
        (TextArea1.Decorated            False)
        (TextArea1.Wrap                 True)
        (TextArea1.BottomOffset         5)
        (TextArea1.ScrollBarPosition    6)
        (TextArea1.CaretVisible         False)
        (TextArea1.ScrollBarsWhenNeeded True)
        (.Label                         "Instructions")
        (.Decorated                     True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                TextArea1
            )
        )
    )
)
