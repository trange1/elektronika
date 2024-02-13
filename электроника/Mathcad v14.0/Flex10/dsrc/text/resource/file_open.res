!----------------------------------------------------------------------------
!
!  Date      Release Name  Ver.  Comments
! ---------- ------- ----- ----- --------------------------------------------
! 24-Mar-97  H-03-04  DXU  $$1  Submitted.
! 07-Apr-97  H-03-05  DXU  $$2  Cosmetic changes.
! 13-May-97  H-03-10  DXU  $$3  Added Intralink button, replace tree by list.
! 27-May-97  H-03-12  DXU  $$4  Added path pulldown win.
! 30-May-97  H-03-13  DXU  $$5  Changed to use the sublayout/placeholder.
! 30-May-97  H-03-14  DXU  $$6 	remove "update session" button.
! 08-Jun-97  H-03-14  DXU    	Set "Sort by Model" to be the default.
! 15-Jun-97  H-03-14  DXU       increase the "inputname" string len.
! 16-Jun-97  H-03-14  DXU  $$7  Do not put sublayout res file name here.
! 19-Jun-97  H-03-15  DXU  $$8  Create tab for "Open Rep" button.
! 29-Jun-97  H-03-16  DXU  $$9  table display support.
! 11-Jul-97  H-03-16+ HMT  $$10 Default button -> "Open"
! 29-Jul-97  H-03-18  HMT  $$11 Fixed termination button spacing, labels
! 16-Aug-97  H-03-19  hmt  $$12 re-place some icons.
! 19-Aug-97  H-03-19+ dxu  $$13 icon position adjustments.
! 10-Dec-97  H-03-33  xw   $$14 Shortcut toolbar, set default-lookin button.
! 19-Dec-97  H-03-34  xw   $$15 Button-style mixed for CascadeButton1.
! 09-Jan-98  H-03-36  hmt  $$16 helptext for seltzer icon
! 07-Jan-98  H-03-36  xw   $$17 One line helps.
! 20-Feb-98  I-01-02  MHM  $$18 Added Select/Unselect All menu buttons.
! 12-JUN-98  I-01-11  KMG  $$19 Changed a tooltip
! 11-AUG-98  I-01-17  KMG  $$20 Maxlen for inputname
! 28-May-99  I-03-10 aap/CK  $$21 Preview tab & friends.
! 07-Jun-99  I-03-10  Chris $$22 Rename IconDisplay - IconRenderstyle
! 15-Jul-99  i-03-12  SNR  $$23 Added Image preview tab 
! 21-Sep-99  I-03-15  CJL  $$24 Added Forward and Back buttons.
! 21-Oct-99  I-03-19  aap  $$25 .RememberSize is FALSE
! 26-Oct-99  I-03-19  CJL  $$26 Cleaned up PglPreviewLayout.
! 01-Nov-99  I-03-20  aap  $$27 preview button disappears when irrelevant
! 23-Nov-99  I-03-23  aap  $$28 added SymbolPreviewLayout
! 20-Dec-99  I-03-25  snr  $$29 Change preview tabs from collapsable to not
!                               collapsable to fix preview dialog resizing
!                               problem
! 02-Jan-02  J-03-16  aap  $$30 flat seltzer button.
! 04-Mar-02  J-03-20  HMR  $$31 Allow <Alt><char> for button activation.
! 11-Sep-02  J-03-34  mla  $$32 Preview buttons now flat; added frame rate icon.
! 15-Apr-03  K-01-05  aap  $$33 Added "Open Content" button.
! 23-Dec-03  K-03-01 AlexM $$34  Use UI PGLWindow class for graphics area
! 11-Feb-05  K-03-20  mgs  $$35  No default button action for preview window 
! 24-Jan-06  K-03-39  aap  $$36  Remove obsolete table_display submenu.
!----------------------------------------------------------------------------

(Dialog file_open
    (Components
        (SubLayout                      FileLayout)
        (Tab                            MasterPreview
                                        MasterEmptyTab
                                        MasterPreviewTab)
    )

    (Resources
        (MasterPreview.Collapsable      True)
        (MasterPreview.TopOffset        4)
        (MasterPreview.BottomOffset     4)
        (MasterPreview.LeftOffset       4)
        (MasterPreview.RightOffset      4)
        (.Label                         "Open")
        (.StartLocation                 5)
        (.LeftOffset                    10)
        (.RightOffset                   2)
        (.DefaultButton                 "Open")
        (.RememberSize                  False)
        (.Layout
            (Grid (Rows 1) (Cols 1 1)
                FileLayout
                MasterPreview
            )
        )
    )
)

(Layout FileLayout
    (Components
        (SubLayout                      Layout2)
        (SubLayout                      bottom)
    )

    (Resources
        (.Label                         "Open")
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.Layout
            (Grid (Rows 0 1) (Cols 1)
                Layout2
                bottom
            )
        )
    )
)

(Layout Layout2
    (Components
        (CascadeButton                  CascadeButton1
                                        MenuPane1)
        (SubLayout                      Ph_path)
        (PHolder                        Ph_path)
    )

    (Resources
        (CascadeButton1.HelpText        "Commands and Settings")
        (CascadeButton1.ButtonStyle     3)
        (CascadeButton1.Selected_image  "seltzer")
        (CascadeButton1.Unselected_image "seltzer")
        (CascadeButton1.AttachRight     True)
        (CascadeButton1.AttachTop       True)
        (CascadeButton1.TopOffset       0)
        (CascadeButton1.BottomOffset    0)
        (CascadeButton1.LeftOffset      4)
        (CascadeButton1.RightOffset     0)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.TopOffset                     8)
        (.BottomOffset                  0)
        (.LeftOffset                    4)
        (.RightOffset                   4)
        (.Layout
            (Grid (Rows 0) (Cols 1 0)
                Ph_path
                CascadeButton1
            )
        )
    )
)

(MenuPane MenuPane1
    (Components
        (PushButton                     DefaultLookin)
        (PushButton                     working_dir0)
        (PushButton                     working_dir1)
        (PushButton                     working_dir2)
        (PushButton                     working_dir3)
        (PushButton                     working_dir4)
        (PushButton                     working_dir5)
        (PushButton                     working_dir6)
        (PushButton                     working_dir7)
        (PushButton                     working_dir8)
        (PushButton                     working_dir9)
        (Separator                      Separator6)
        (PushButton                     SelectAll)
        (PushButton                     UnselAll)
        (Separator                      Separator5)
        (CascadeButton                  markup_instance_display
                                        MenuPane4)
        (Separator                      Separator9)
        (CheckButton                    VersionCheck)
        (Separator                      Separator3)
        (CheckButton                    ViewOnly)
    )

    (Resources
        (DefaultLookin.Label            "`Look In' Default")
        (DefaultLookin.AttachLeft       True)
        (DefaultLookin.AttachTop        True)
        (DefaultLookin.AttachBottom     True)
        (DefaultLookin.TopOffset        10)
        (DefaultLookin.BottomOffset     0)
        (DefaultLookin.LeftOffset       0)
        (working_dir0.Label             "Working Directory")
        (working_dir0.Visible           False)
        (working_dir0.AttachLeft        True)
        (working_dir0.AttachTop         True)
        (working_dir0.AttachBottom      True)
        (working_dir0.TopOffset         10)
        (working_dir0.BottomOffset      0)
        (working_dir0.LeftOffset        0)
        (working_dir1.Label             "Working Directory 1")
        (working_dir1.Visible           False)
        (working_dir2.Label             "Working Directory 2")
        (working_dir2.Visible           False)
        (working_dir3.Label             "Working Directory 3")
        (working_dir3.Visible           False)
        (working_dir4.Label             "Working Directory 4")
        (working_dir4.Visible           False)
        (working_dir5.Label             "Working Directory 5")
        (working_dir5.Visible           False)
        (working_dir6.Label             "Working Directory 6")
        (working_dir6.Visible           False)
        (working_dir7.Label             "Working Directory 7")
        (working_dir7.Visible           False)
        (working_dir8.Label             "Working Directory 8")
        (working_dir8.Visible           False)
        (working_dir9.Label             "Working Directory 9")
        (working_dir9.Visible           False)
        (Separator6.TopOffset           0)
        (Separator6.BottomOffset        0)
        (Separator6.LeftOffset          0)
        (Separator6.RightOffset         0)
        (SelectAll.Label                "Select All")
        (UnselAll.Label                 "Unselect All")
        (Separator5.TopOffset           0)
        (Separator5.BottomOffset        0)
        (Separator5.LeftOffset          0)
        (Separator5.RightOffset         0)
        (markup_instance_display.Label  "Sort By")
        (Separator9.TopOffset           0)
        (Separator9.BottomOffset        0)
        (Separator9.LeftOffset          0)
        (Separator9.RightOffset         0)
        (VersionCheck.Label             "All Versions")
        (Separator3.TopOffset           0)
        (Separator3.BottomOffset        0)
        (Separator3.LeftOffset          0)
        (Separator3.RightOffset         0)
        (ViewOnly.Label                 "Retrieve Drawing as View Only")
    )
)

(MenuPane MenuPane4
    (Components
        (RadioGroup                     RadioGroup3)
    )

    (Resources
        (RadioGroup3.ItemHelpText       ""
                                        "")
        (RadioGroup3.Names              "a"
                                        "b")
        (RadioGroup3.Labels             "Model Name"
                                        "Markup/Instance Name")
        (RadioGroup3.ItemImage          ""
                                        "")
    )
)

(Layout bottom
    (Components
        (Label                          Name_label)
        (InputPanel                     Inputname)
        (Label                          Type_label)
        (OptionMenu                     Type)
        (Label                          Sub_type_label)
        (OptionMenu                     SubType)
        (SubLayout                      Layout3)
        (SubLayout                      Layout4)
        (Separator                      Separator7)
    )

    (Resources
        (Name_label.Label               "Name")
        (Name_label.AttachLeft          True)
        (Name_label.TopOffset           0)
        (Name_label.BottomOffset        0)
        (Name_label.LeftOffset          6)
        (Name_label.RightOffset         4)
        (Inputname.MaxLen               255)
        (Inputname.TopOffset            0)
        (Inputname.BottomOffset         0)
        (Inputname.LeftOffset           0)
        (Inputname.RightOffset          6)
        (Inputname.AlwaysHasFocus       True)
        (Type_label.Label               "Type")
        (Type_label.AttachLeft          True)
        (Type_label.TopOffset           4)
        (Type_label.LeftOffset          6)
        (Type_label.RightOffset         4)
        (Type.Columns                   8)
        (Type.TopOffset                 4)
        (Type.LeftOffset                0)
        (Type.RightOffset               0)
        (Sub_type_label.Label           "Sub-type")
        (Sub_type_label.AttachRight     True)
        (Sub_type_label.TopOffset       4)
        (Sub_type_label.LeftOffset      8)
        (Sub_type_label.RightOffset     4)
        (SubType.Columns                8)
        (SubType.Value                  "4")
        (SubType.TopOffset              4)
        (SubType.LeftOffset             0)
        (SubType.RightOffset            4)
        (Separator7.TopOffset           4)
        (Separator7.BottomOffset        4)
        (Separator7.LeftOffset          0)
        (Separator7.RightOffset         0)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.Layout
            (Grid (Rows 1 0 0 0) (Cols 1)
                Layout3
                (Grid (Rows 0 0) (Cols 0 1)
                    Name_label
                    Inputname
                    Type_label
                    (Grid (Rows 0) (Cols 1 0 1)
                        Type
                        Sub_type_label
                        SubType
                    )
                )
                Separator7
                Layout4
            )
        )
    )
)

(Layout Layout3
    (Components
        (SubLayout                      Ph_list)
        (PHolder                        Ph_list)
    )

    (Resources
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.TopOffset                     2)
        (.BottomOffset                  2)
        (.LeftOffset                    4)
        (.RightOffset                   4)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                Ph_list
            )
        )
    )
)

(Layout Layout4
    (Components
        (PushButton                     Open)
        (PushButton                     Cancel)
        (Tab                            openrep_tab
                                        openrep_lay
                                        empty_lay
                                        reporcontent_lay)
        (Tab                            pvw_btn_tab
                                        empty_lay_2
                                        pvw_lay)
    )

    (Resources
        (Open.Label                     "&Open")
        (Cancel.Label                   "&Cancel")
        (openrep_tab.Collapsable        True)
        (pvw_btn_tab.Collapsable        True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.TopOffset                     0)
        (.BottomOffset                  2)
        (.LeftOffset                    0)
        (.RightOffset                   0)
        (.Layout
            (Grid (Rows 1) (Cols 1 1 1 1)
                Open
                openrep_tab
                Cancel
                pvw_btn_tab
            )
        )
    )
)

(Layout openrep_lay
    (Components
        (PushButton                     Open_Rep)
    )

    (Resources
        (Open_Rep.Label                 "Open &Rep...")
        (Open_Rep.HelpText              "Open Rep of the current object")
        (Open_Rep.TopOffset             0)
        (Open_Rep.BottomOffset          0)
        (Open_Rep.LeftOffset            0)
        (Open_Rep.RightOffset           0)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                Open_Rep
            )
        )
    )
)

(Layout empty_lay
    (Components
        (Label                          empty_label)
    )

    (Resources
        (empty_label.Visible            False)
        (.Layout
            (Grid (Rows 0) (Cols 0)
                empty_label
            )
        )
    )
)

(Layout reporcontent_lay
    (Components
        (FlyOutButton                   rep_fly
                                        ToolBar1)
    )

    (Resources
        (.Layout
            (Grid (Rows 1) (Cols 1)
                rep_fly
            )
        )
    )
)

(ToolBar ToolBar1
    (Components
        (PushButton                     Open_Rep_2)
        (PushButton                     Open_Content)
    )

    (Resources
        (Open_Rep_2.Label               "Open Rep...")
        (Open_Content.Label             "Open Content...")
        (.Orientation                   True)
    )
)

(Layout empty_lay_2
    (Components
        (Label                          Label2)
    )

    (Resources
        (Label2.Visible                 False)
        (.Layout
            (Grid (Rows 0) (Cols 0)
                Label2
            )
        )
    )
)

(Layout pvw_lay
    (Components
        (CheckButton                    Preview)
    )

    (Resources
        (Preview.Label                  "&Preview >>>")
        (Preview.ButtonStyle            1)
        (Preview.TopOffset              0)
        (Preview.BottomOffset           0)
        (Preview.LeftOffset             0)
        (Preview.RightOffset            0)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                Preview
            )
        )
    )
)

(Layout MasterEmptyTab
    (Components
        (Label                          EmptyLayoutLabel)
    )

    (Resources
        (.Layout
            (Grid (Rows 1) (Cols 0)
                EmptyLayoutLabel
            )
        )
    )
)

(Layout MasterPreviewTab
    (Components
        (Tab                            PreviewTab
                                        PglPreviewLayout
                                        PglImagePreviewLayout
                                        TextPreviewLayout
                                        NAPreviewLayout
                                        SymbolPreviewLayout)
    )

    (Resources
        (PreviewTab.TopOffset           4)
        (PreviewTab.BottomOffset        4)
        (PreviewTab.LeftOffset          4)
        (PreviewTab.RightOffset         4)
        (.Label                         "Open")
        (.TopOffset                     10)
        (.LeftOffset                    10)
        (.RightOffset                   10)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                PreviewTab
            )
        )
    )
)

(Layout PglPreviewLayout
    (Components
        (SubToolBar                     ToolBar)
        (PGLWindow                      DisplayArea)
    )

    (Resources
        (DisplayArea.NakedWidth         540)
        (DisplayArea.NakedHeight        521)
        (DisplayArea.NakedMinWidth      100)
        (DisplayArea.NakedMinHeight     84)
        (DisplayArea.DefaultButtonAction 0)
        (DisplayArea.AlwaysAllowEvents  True)
        (DisplayArea.PGLCallbacks       True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.Layout
            (Grid (Rows 0 1) (Cols 1)
                ToolBar
                DisplayArea
            )
        )
    )
)

(ToolBar ToolBar
    (Components
        (RadioGroup                     IconProjection)
        (RadioGroup                     IconRenderstyle)
        (PushButton                     IconRefit)
        (CascadeButton                  CascadeButtonFPS
                                        MenuPaneFPS)
        (PushButton                     Back)
        (PushButton                     Forward)
    )

    (Resources
        (IconProjection.ButtonStyle     3)
        (IconProjection.ItemHelpText    "Orthographic"
                                        "Perspective")
        (IconProjection.Names           "Orthographic"
                                        "Perspective")
        (IconProjection.Labels          ""
                                        "")
        (IconProjection.ItemImage       "trimetric.bif"
                                        "perspective.bif")
        (IconProjection.TopOffset       2)
        (IconProjection.BottomOffset    4)
        (IconProjection.LeftOffset      5)
        (IconProjection.RightOffset     10)
        (IconRenderstyle.ButtonStyle    3)
        (IconRenderstyle.ItemHelpText   "Wireframe"
                                        "Hidden Line"
                                        "No Hidden"
                                        "Shading")
        (IconRenderstyle.Names          "Wireframe"
                                        "Hidden Line"
                                        "No Hidden"
                                        "Shading")
        (IconRenderstyle.Labels         ""
                                        ""
                                        ""
                                        "")
        (IconRenderstyle.ItemImage      "wireframe.bif"
                                        "hidden.bif"
                                        "nohidden.bif"
                                        "shaded.bif")
        (IconRenderstyle.TopOffset      2)
        (IconRenderstyle.BottomOffset   4)
        (IconRenderstyle.LeftOffset     5)
        (IconRenderstyle.RightOffset    10)
        (IconRefit.Bitmap               "zoom_to_fit.bif")
        (IconRefit.HelpText             "Refit")
        (IconRefit.ButtonStyle          3)
        (IconRefit.AttachTop            True)
        (IconRefit.TopOffset            2)
        (IconRefit.BottomOffset         4)
        (IconRefit.LeftOffset           5)
        (IconRefit.RightOffset          10)
        (CascadeButtonFPS.HelpText      "Frames Per Second")
        (CascadeButtonFPS.ButtonStyle   3)
        (CascadeButtonFPS.Selected_image "frame_rate")
        (CascadeButtonFPS.Unselected_image "frame_rate")
        (CascadeButtonFPS.TopOffset     2)
        (CascadeButtonFPS.BottomOffset  4)
        (CascadeButtonFPS.LeftOffset    5)
        (CascadeButtonFPS.RightOffset   10)
        (Back.Bitmap                    "playrev.bif")
        (Back.HelpText                  "Back")
        (Back.ButtonStyle               3)
        (Back.AttachTop                 True)
        (Back.TopOffset                 2)
        (Back.BottomOffset              4)
        (Back.LeftOffset                5)
        (Back.RightOffset               2)
        (Forward.Bitmap                 "play.bif")
        (Forward.HelpText               "Forward")
        (Forward.ButtonStyle            3)
        (Forward.AttachTop              True)
        (Forward.TopOffset              2)
        (Forward.BottomOffset           4)
        (Forward.LeftOffset             2)
        (Forward.RightOffset            10)
    )
)

(MenuPane MenuPaneFPS
    (Components
        (RadioGroup                     FPSRadio)
    )

    (Resources
        (FPSRadio.ButtonStyle           1)
        (FPSRadio.Names                 "FPS1"
                                        "FPS2"
                                        "FPS3"
                                        "FPS4"
                                        "FPS5"
                                        "FPS6"
                                        "FPS7"
                                        "FPS8"
                                        "FPS9"
                                        "FPS10"
                                        "FPS15"
                                        "FPS20"
                                        "FPS25"
                                        "FPS30")
        (FPSRadio.Labels                "1"
                                        "2"
                                        "3"
                                        "4"
                                        "5"
                                        "6"
                                        "7"
                                        "8"
                                        "9"
                                        "10"
                                        "15"
                                        "20"
                                        "25"
                                        "30")
    )
)


(Layout PglImagePreviewLayout
    (Components
        (PGLWindow                      ImageDisplayArea)
    )

    (Resources
        (ImageDisplayArea.NakedWidth    540)
        (ImageDisplayArea.NakedHeight   521)
        (ImageDisplayArea.NakedMinWidth 100)
        (ImageDisplayArea.NakedMinHeight 84)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                ImageDisplayArea
            )
        )
    )
)


(Layout TextPreviewLayout
    (Components
        (TextArea                       PreviewText)
    )

    (Resources
        (PreviewText.Value              "This is a text area.
Maybe we could put the first 
few lines of a text file here.")
        (PreviewText.ScrollBarsWhenNeeded True)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                PreviewText
            )
        )
    )
)

(Layout NAPreviewLayout
    (Components
        (Label                          Label1)
    )

    (Resources
        (Label1.Label                   "Preview not available.")
        (Label1.FontSize                46.000000)
        (.Decorated                     True)
        (.LeftOffset                    10)
        (.RightOffset                   10)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                Label1
            )
        )
    )
)

(Layout SymbolPreviewLayout
    (Components
        (PGLWindow                      SymbolProeWindow)
    )

    (Resources
        (SymbolProeWindow.Decorated     False)
        (SymbolProeWindow.NakedWidth    178)
        (SymbolProeWindow.ValidDropSite False)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                SymbolProeWindow
            )
        )
    )
)

