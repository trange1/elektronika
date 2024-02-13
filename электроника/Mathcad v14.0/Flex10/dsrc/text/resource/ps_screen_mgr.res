!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  ps_screen_mgr.res
! 
!  The screen manager dialog
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  16-Feb-99 I-03-02   JJE   $$1    Group submission
!  26-Mar-99           TWH          Add debug levels to menus
!  01-Apr-99           TWH          Chg debug from PB to RadioGroup
!  29-Apr-99           JJE          Add dump top level
!  11-May-99 I-03-09   JJE   $$2    Group Submission
!  08-Feb-00           JJE          Add setup bitmap
!  09-Feb-00 I-03-26+  JJE   $$3    Group Submission
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Dialog ps_screen_mgr
    (Components
        (List                           List1)
        (Label                          Label1)
        (MenuBar                        ScrMgrMenuBar
                                        FileMenuPane
                                        DebugMenuPane)
        (Tab                            Tab1
                                        TextLayout
                                        BlankLayout)
    )

    (Resources
        (.Bitmap                        "setup")
        (List1.Columns                  10)
        (List1.VisibleRows              10)
        (List1.Decorated                False)
        (List1.TabStops                 8)
        (List1.TopOffset                5)
        (List1.BottomOffset             5)
        (List1.LeftOffset               5)
        (List1.RightOffset              5)
        (Label1.Bitmap                  "tanalian")
        (Tab1.Collapsable               True)
        (.Label                         "Screen Manager")
        (.DialogStyle                   1)
        (.StartLocation                 7)
        (.MinimizeButton                True)
        (.BackgroundColor               15)
        (.Layout
            (Grid (Rows 1) (Cols 0 1)
                (Grid (Rows 1 1) (Cols 1)
                    Label1
                    List1
                )
                Tab1
            )
        )
    )
)

(MenuPane FileMenuPane
    (Components
        (PushButton                     LoadTrail)
        (PushButton                     Exit)
    )

    (Resources
        (LoadTrail.Label                "Load Trail")
        (LoadTrail.Sensitive            False)
        (Exit.Label                     "Exit")
        (.Label                         "File")
    )
)

(MenuPane DebugMenuPane
    (Components
        (PushButton                     RunMode)
        (CascadeButton                  Dbglvl_cascade
                                        DbglvlMenuPane)
        (Separator                      Separator1)
        (PushButton                     DebugSave)
        (PushButton                     DumpScreen)
        (PushButton                     DumpTopLevel)
	(PushButton                     ClearScreen)
        (CheckButton                    DebugShow)
    )

    (Resources
        (RunMode.Label                  "Set Runmode")
        (Dbglvl_cascade.Label           "Set Debug Level")
        (Separator1.TopOffset           0)
        (Separator1.BottomOffset        0)
        (Separator1.LeftOffset          0)
        (Separator1.RightOffset         0)
        (DebugSave.Label                "Save Debug")
        (DebugSave.HelpText             "Save text in debug window to a file")
        (DumpScreen.Label               "Dump Screen")
        (DumpTopLevel.Label             "Dump Top Level")
        (ClearScreen.Label              "Clear Window")
        (DebugShow.Label                "Show")
        (DebugShow.Set                  True)
        (DebugShow.ButtonStyle          0)
        (.Label                         "Debug")
    )
)

(MenuPane DbglvlMenuPane
    (Components
        (RadioGroup                     Dbglvl)
    )

    (Resources
        (Dbglvl.Names                   "0"
                                        "1"
                                        "4"
                                        "7"
                                        "10"
                                        "13"
                                        "17")
        (Dbglvl.Labels                  "None"
                                        "Abort"
                                        "Error"
                                        "Warning"
                                        "Diagnose"
                                        "Info"
                                        "Verbose")
    )
)

(Layout TextLayout
    (Components
        (TextArea                       DebugTextArea)
    )

    (Resources
        (DebugTextArea.Columns          60)
        (DebugTextArea.MaxLen           32764)
        (DebugTextArea.ScrollBarsWhenNeeded True)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                DebugTextArea
            )
        )
    )
)

(Layout BlankLayout
    (Components
        (Label                          Label2)
    )

    (Resources
        (.Layout
            (Grid (Rows 1) (Cols 1)
                Label2
            )
        )
    )
)
