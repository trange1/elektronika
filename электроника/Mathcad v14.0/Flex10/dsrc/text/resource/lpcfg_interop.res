!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  lpcfg_interop.res
! 
!  Command configuration, proe
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  29-Apr-03 K-01-06   TWH   $$1    Created
!  29-Jul-03 K-01-11   TWH   $$2    Add Instructions; Address alignment
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout lpcfg_interop
    (Components
        (ScrolledLayout                 interopt_scrolledlayout)
        (SubLayout                      grp_layout)
        (Label                          Label5)
        (SubLayout                      lpcfg_interop3)
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
            (Grid (Rows 0 0 0 1) (Cols 1)
                lpcfg_interop3
                interopt_scrolledlayout
                grp_layout
                Label5
            )
        )
    )
)

(Layout interopt_scrolledlayout
    (Components
        (SubLayout                      interop_2)
    )

    (Resources
        (.Decorated                     False)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
    )
)

(Layout interop_2
    (Components
        (Label                          InstCmdLab)
        (Label                          ReleaseLab)
        (PushButton                     LP_browse)
        (OptionMenu                     Cmd_optmnu)
        (Label                          InstLocLab)
        (OptionMenu                     LP_optmnu)
        (Label                          StartInLab)
        (InputPanel                     StartIn_ip)
        (PushButton                     StartIn_browse)
    )

    (Resources
        (InstCmdLab.Label               "Start Command:")
        (InstCmdLab.AttachLeft          True)
        (InstCmdLab.AttachRight         True)
        (InstCmdLab.Alignment           1)
        (InstCmdLab.Resizeable          True)
        (InstCmdLab.RightOffset         3)
        (ReleaseLab.Label               "<name>  <release>  <datecode>")
        (ReleaseLab.AttachLeft          True)
        (ReleaseLab.AttachRight         True)
        (ReleaseLab.Alignment           0)
        (ReleaseLab.TopOffset           2)
        (ReleaseLab.BottomOffset        2)
        (LP_browse.Bitmap               "UI dir open image")
        (LP_browse.AttachLeft           True)
        (LP_browse.LeftOffset           3)
        (Cmd_optmnu.MaxLen              80)
        (Cmd_optmnu.Editable            True)
        (InstLocLab.Label               "Install Location:")
        (InstLocLab.AttachLeft          True)
        (InstLocLab.AttachRight         True)
        (InstLocLab.Alignment           1)
        (InstLocLab.Resizeable          True)
        (InstLocLab.RightOffset         3)
        (LP_optmnu.MaxLen               256)
        (LP_optmnu.Editable             True)
        (StartInLab.Label               "Start In:")
        (StartInLab.Visible             False)
        (StartInLab.AttachLeft          True)
        (StartInLab.AttachRight         True)
        (StartInLab.Alignment           1)
        (StartInLab.Resizeable          True)
        (StartInLab.RightOffset         3)
        (StartIn_ip.Visible             False)
        (StartIn_browse.Bitmap          "UI dir open image")
        (StartIn_browse.Visible         False)
        (StartIn_browse.AttachLeft      True)
        (StartIn_browse.LeftOffset      3)
        (.Label                         "Pro/INTRALINK Integration (Optional)")
        (.Decorated                     True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.Layout
            (Grid (Rows 0 0 0) (Cols 0 1)
                InstLocLab
                (Grid (Rows 0) (Cols 1 0)
                    LP_optmnu
                    LP_browse
                )
                (Pos 2 2)
                ReleaseLab
                (Grid (Rows 0 0) (Cols 0)
                    InstCmdLab
                    StartInLab
                )
                (Grid (Rows 0 0) (Cols 0 1)
                    Cmd_optmnu
                    (Pos 2 1)
                    StartIn_ip
                    StartIn_browse
                )
            )
        )
    )
)

(Layout grp_layout
    (Components
        (ScrolledLayout                 interopt_grouplayout)
        (Label                          Label6)
    )

    (Resources
        (.Label                         "Locate Other Installation Locations (Optional)")
        (.Decorated                     True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.Layout
            (Grid (Rows 0 1) (Cols 1)
                interopt_grouplayout
                Label6
            )
        )
    )
)

(Layout interopt_grouplayout
    (Components
        (SubLayout                      interop_5)
    )

    (Resources
        (.Decorated                     False)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.Resizeable                    True)
        (.AlwaysOnTop                   True)
    )
)

(Layout interop_5
    (Components
        (Label                          grpCmdLab)
        (Label                          grpReleaseLab)
        (PushButton                     grpLocBrowse)
        (OptionMenu                     grpCmdMenu)
        (Label                          grpLocLab)
        (OptionMenu                     grpLocMenu)
        (Label                          grpStartLab)
        (InputPanel                     grpStartIn)
        (PushButton                     grpStartBrowse)
    )

    (Resources
        (grpCmdLab.Label                "Start Command:")
        (grpCmdLab.AttachLeft           True)
        (grpCmdLab.AttachRight          True)
        (grpCmdLab.Alignment            1)
        (grpCmdLab.Resizeable           True)
        (grpCmdLab.RightOffset          3)
        (grpReleaseLab.Label            "<name>  <release>  <datecode>")
        (grpReleaseLab.AttachLeft       True)
        (grpReleaseLab.AttachRight      True)
        (grpReleaseLab.Alignment        0)
        (grpReleaseLab.TopOffset        2)
        (grpReleaseLab.BottomOffset     2)
        (grpLocBrowse.Bitmap            "UI dir open image")
        (grpLocBrowse.AttachLeft        True)
        (grpLocBrowse.LeftOffset        3)
        (grpCmdMenu.MaxLen              80)
        (grpCmdMenu.Editable            True)
        (grpLocLab.Label                "Install Location:")
        (grpLocLab.AttachLeft           True)
        (grpLocLab.AttachRight          True)
        (grpLocLab.Alignment            1)
        (grpLocLab.Resizeable           True)
        (grpLocLab.RightOffset          3)
        (grpLocMenu.MaxLen              256)
        (grpLocMenu.Editable            True)
        (grpStartLab.Label              "Start In:")
        (grpStartLab.Visible            False)
        (grpStartLab.AttachLeft         True)
        (grpStartLab.AttachRight        True)
        (grpStartLab.Alignment          1)
        (grpStartLab.Resizeable         True)
        (grpStartLab.RightOffset        3)
        (grpStartIn.Visible             False)
        (grpStartBrowse.Bitmap          "UI dir open image")
        (grpStartBrowse.Visible         False)
        (grpStartBrowse.AttachLeft      True)
        (grpStartBrowse.LeftOffset      3)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.Layout
            (Grid (Rows 0 0 0) (Cols 0 1)
                grpLocLab
                (Grid (Rows 0) (Cols 1 0)
                    grpLocMenu
                    grpLocBrowse
                )
                (Pos 2 2)
                grpReleaseLab
                (Grid (Rows 0 0) (Cols 0)
                    grpCmdLab
                    grpStartLab
                )
                (Grid (Rows 0 0) (Cols 0 1)
                    grpCmdMenu
                    (Pos 2 1)
                    grpStartIn
                    grpStartBrowse
                )
            )
        )
    )
)

(Layout lpcfg_interop3
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
