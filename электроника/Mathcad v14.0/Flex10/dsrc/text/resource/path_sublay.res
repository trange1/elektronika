!----------------------------------------------------------------------------
!
!  Date      Release Name  Ver.  Comments
! ---------- ------- ----- ----- --------------------------------------------
! 01-Jun-97  H-03-13  DXU  $$1   Created 
! 23-Jul-97  H-03-15  DXU  $$2   Added list/table switch.
! 29-Jul-97  H-03-18  HMT  $$3   Helptext for up_folder, list, table
! 11-Jul-97  H-03-19  DRM  $$4   Added shortcut buttons
! 19-Aug-97  H-03-19+ dxu  $$5   icon position adjustments.
! 03-Dec-97  H-03-32  xw   $$6   Shortcuts go into a toolbar.
! 12-Jul-98  I-01-14  aap  $$7   Favorites button replaces "dummy".
! 29-Jul-98  I-01-16  aap  $$8   Help text for above; remove unused MenuPane
! 15-Sep-98  I-01-20  SCL  $$9   Set .KeyboardInput for tool-style buttons
! 02-Oct-98  I-01-23  aap $$10   Favorites is finally a CascadeButton now.
! 16-Jun-99  I-02-04  aap $$11   No .Wrap for the toolbar. I feel better now.
! 23-Jul-99  I-03-14  aap $$12   Add TruncateLabel to Path.
! 26-Nov-01  J-03-13  aap $$13   add org_favorites
! 06-Dec-01  J-03-14  aap $$14   list/details button moves to menu pane
! 02-Jan-02  J-03-16  aap $$15   flat buttons.
! 20-Feb-02  J-03-19  JSP $$16	 Removed bad AcceleratorCode from Radgp_table
! 04-Mar-02  J-03-20  HMR $$17   Changed highlighting of dropdown entries.
! 17-May-02  J-03-25  HMR $$18   Added DispButton.HelpText.
! 19-Feb-03  K-01-01 Moti $$19   Changed Layout name to be non conflict .
!----------------------------------------------------------------------------

(Layout path_sublay
    (Components
        (SashLayout                     Sash2)
        (OptionMenu                     Path)
        (Label                          Path_label)
    )

    (Resources
        (Path.AttachTop                 True)
        (Path.TopOffset                 0)
        (Path.BottomOffset              0)
        (Path.LeftOffset                0)
        (Path.RightOffset               4)
        (Path.TruncateLabel             True)
	(Path.HighlightStyle            1)
        (Path_label.Label               "Look In")
        (Path_label.AttachLeft          True)
        (Path_label.TopOffset           0)
        (Path_label.BottomOffset        0)
        (Path_label.LeftOffset          0)
        (Path_label.RightOffset         4)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.TopOffset                     0)
        (.BottomOffset                  0)
        (.LeftOffset                    0)
        (.RightOffset                   0)
        (.Layout
            (Grid (Rows 0) (Cols 0 1 0)
                Path_label
                Path
                Sash2
            )
        )
    )
)

(Sash Sash2
    (Components
        (SubLayout                      Layout11)
        (SashLayout                     Sash1)
    )

    (Resources
        (.Sensitive                     False)
        (.SashWidth                     0)
    )
)

(Layout Layout11
    (Components
        (PushButton                     up_directory)
    )

    (Resources
        (up_directory.Bitmap            "up_folder")
        (up_directory.HelpText          "Up One Level")
        (up_directory.ButtonStyle       3)
        (up_directory.AttachLeft        True)
        (up_directory.KeyboardInput     True)
        (up_directory.TopOffset         0)
        (up_directory.BottomOffset      0)
        (up_directory.LeftOffset        0)
        (up_directory.RightOffset       4)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.Layout
            (Grid (Rows 0) (Cols 0)
                up_directory
            )
        )
    )
)

(Sash Sash1
    (Components
        (SashLayout                     Sash3)
        (CascadeButton                  DispButton
                                        DispMenuPane)
    )

    (Resources
        (DispButton.ButtonStyle         3)
        (DispButton.Selected_image      "columnn_d")
        (DispButton.Unselected_image    "columnn_d")
	(DispButton.HelpText            "Display Configuration")
        (DispButton.AttachTop           True)
        (DispButton.TopOffset           0)
        (DispButton.BottomOffset        0)
        (DispButton.LeftOffset          4)
        (DispButton.RightOffset         0)
        (.Sensitive                     False)
        (.SashWidth                     0)
    )
)

(Sash Sash3
    (Components
        (SubToolBar                     tb_shortcuts)
        (Label                          Label1)
    )

    (Resources
        (Label1.Bitmap                  "empty")
        (.Sensitive                     False)
        (.Orientation                   True)
        (.ForegroundColor               28)
        (.SashWidth                     0)
    )
)

(ToolBar tb_shortcuts
    (Components
        (Label                          Label2)
        (CascadeButton                  Favorites
                                        FavMenuPane)
    )

    (Resources
        (Label2.AttachTop               True)
        (Label2.AttachBottom            True)
        (Favorites.HelpText             "Favorites")
        (Favorites.ButtonStyle          3)
        (Favorites.Selected_image       "fav_btn")
        (Favorites.Unselected_image     "fav_btn")
        (Favorites.AttachTop            True)
        (Favorites.AttachBottom         True)
        (.Wrap                          False)
    )
)

(MenuPane FavMenuPane
    (Components
        (PushButton                     add_favorite)
        (PushButton                     del_favorite)
        (PushButton                     org_favorites)
        (PushButton                     view_favorites)
    )

    (Resources
        (add_favorite.Label             "Save location")
        (add_favorite.HelpText          "Add the current location to Favorites")
        (del_favorite.Label             "Remove location")
        (del_favorite.HelpText          "Remove the current location from Favorites")
        (org_favorites.Label            "Organize favorites...")
        (org_favorites.HelpText         "Invoke the Organize Favorites dialog")
        (view_favorites.Label           "Browse favorites")
        (view_favorites.HelpText        "Show the Favorites in the open browser")
    )
)

(MenuPane DispMenuPane
    (Components
        (RadioGroup                     Radgp_table)
    )

    (Resources
        (Radgp_table.Names              "a"
                                        "b")
        (Radgp_table.Labels             "<a> List"
                                        "<b> Details")
        (Radgp_table.ItemImage          "columnn"
                                        "columny")
        (Radgp_table.KeyboardInput      True)
        (Radgp_table.TopOffset          0)
        (Radgp_table.BottomOffset       0)
        (Radgp_table.LeftOffset         4)
        (Radgp_table.RightOffset        0)
        (Radgp_table.SymbolNames        "a"
                                        "b")
        (Radgp_table.SymbolImages       "columnn"
                                        "columny")
        (Radgp_table.FontStyle          1)
    )
)
