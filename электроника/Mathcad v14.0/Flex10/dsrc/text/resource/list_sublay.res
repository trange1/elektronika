!----------------------------------------------------------------------------
!
!  Date      Release Name  Ver.  Comments
! ---------- ------- ----- ----- --------------------------------------------
! 01-Jun-97  H-03-13  DXU  $$1   Created
! 23-Jul-97  H-03-15  DXU  $$2   Added list table config support.
! 10-Jul-97  H-03-16  DXU  $$3   changed List to SymList.
! 27-Jul-97  H-03-17  DXU  $$4   added more icons.
! 31-Jul-97  H-03-17+ dxu  $$5   use the right icon names.
! 30-Jul-97  H-03-18  HMT  $$6   Increased # of rows
! 28-Aug-97  H-03-19+ DRM  $$7   Made background white
! 19-Sep-97  H-03-29  DXU  $$8   New icons added.
! 30-Oct-97  H-03-29  DXU  $$9   Added intralink sysattr icons.
! 25-Nov-97  H-03-31  MBE  $$10  Added diagram icons.
! 10-Aug-98  I-01-16  XKA  $$11 Changed BackgroundColor from White (15)
!                              to SunkenBackground (22).
! 30-Mar-99  I-03-07  HMR  $$12  Add lookin icons for folder lists
! 22-Jul-99  I-03-12  aap  $$13  Add network neighborhood.
! 21-Oct-99  I-03-19  aap  $$14  .RememberSize is TRUE
! 06-Oct-00  J-01-21  aap  $$15  Use SelectionPolicy 2.
! 20-Jul-01  J-03-05  aap  $$16  ScrollBarsWhenNeeded.
! 28-Jan-02  J-03-18  HMR  $$17  Changed from tree to list, selection policy.
! 04-Mar-02  J-03-20  HMR  $$18  Changed highlighting, horizontal scrolling.
! 01-Apr-02  J-03-22  HMR  $$19  Added "bookmark" icon for favorites.
! 09-Oct-02  J-03-35  HMR  $$20  Tweak file icon symbol names.
! 08-Nov-02  J-03-37  HMR  $$21  Change icon for T_PARAM_AUX files.
! 07-Mar-03  K-01-02  HMR  $$22  Use "folder_navigator" icon.
! 22-Dec-03  K-01-21  AW   $$23  Set ColumnLabel on List_table
! 08-Mar-04  K-01-25  jas  $$24  Use SelectionVisible
! 26-Jul-04  K-03-07  jas  $$25  Replaced obsolete UI classes
! 02-Feb-05  K-03-19  HMR  $$26  Enabled KeyboardAutoScroll.
!----------------------------------------------------------------------------
(Layout list_sublay
    (Components
        (Tab                            Tab_list
                                        Tree_lay
                                        List_lay)
    )
    (Resources
        (Tab_list.TopOffset                 0)
        (Tab_list.BottomOffset              0)
        (Tab_list.LeftOffset                0)
        (Tab_list.RightOffset               0)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.TopOffset                     0)
        (.BottomOffset                  0)
        (.LeftOffset                    0)
        (.RightOffset                   0)
        (.RememberSize                  True)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                Tab_list
            )
        )
    )
)

(Layout Tree_lay
    (Components
        (List                           Filelist)
    )

    (Resources
	(Filelist.HighlightStyle           1)
	(Filelist.SelectionVisible         False)
	(Filelist.Wrap                     True)
        (Filelist.TopOffset                0)
        (Filelist.BottomOffset             0)
        (Filelist.LeftOffset               0)
        (Filelist.RightOffset              0)
        (Filelist.ListType                 0)
        (Filelist.SelectionPolicy          2)
	(Filelist.KeyboardAutoScroll       True)
	(Filelist.MinRows                  15)
        (Filelist.SymbolNames		     "1:" "2:" "3:" "4:" "5:" "6:"
					     "7:" "8:" "9:" "10:" "11:" "12:"
					     "13:" "14:" "15:" "16:" "17:"
					     "18:" "19:" "20:" "21:" "22:"
					     "23:" "24:" "25:" "26:"
					     "27:" "28:"
					     "1001:" "1002:" "1003:" "1004:"
					     "1005:" "1006:" "1007:" "1008:" 
					     "1009:" "1010:" "1011:" "1012:"
					     "1013:" "1014:"
					     "1015:" "1016:" "1017:" "1018:"
					     "1019:" "1020:" "1021:" "1022:"
					     "1023:" "1024:" "1025:" "1026:"
					     "1027:" "1028:" "1029:" "1034:")
	(Filelist.SymbolImages	     "prt_image" "asm_image" 
					     "drawing" "format" "mfg" 
				             "folder" "generic_nonptc" 
					     "generic_ptc" "markup" "layout" 
					     "diagram" "report" "sketch" 
					     "sketch" "sketch" "mfg_ascii"
					     "mfg_ascii" "mfg_ascii" "generic_nonptc"
					     "mfg_ascii" "mfg_ascii" "mfg_ascii"
					     "mfg_tool" "mold" "cast" "skeleton"
				             "multi_view_comp" "component_group"
					     "closed_folder" "conflict"
					     "intenttomodify" "locked"
  					     "lockedmodified" "modified"
				             "modified1" "modifiednolock"
				             "modifiedwarn" "modifyintent"
					     "notification" "openfolder"
				             "warning" "warningoutdate"
					     "session" "workspace"
					     "common_space" "library"
					     "config_folder" "favorites"
                                             "UI fixed device image"
					"UI floppy device image"
					"UI cdrom device image"
					"UI removable device image"
					"UI remote device image"
					"UI network image"
                                        "UI floppy 5.25 device image"
                                        "folder_navigator"
                                        "UI host image"
					"bookmark")
        (.TopOffset                     0)
        (.BottomOffset                  0)
        (.LeftOffset                    0)
        (.RightOffset                   0)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                Filelist
            )
        )
    )
)

(Layout List_lay
    (Components
        (List                           List_table)
    )

    (Resources
	(List_table.BackgroundColor	     22)
	(List_table.HighlightStyle           1)
        (List_table.TopOffset                0)
        (List_table.BottomOffset             0)
        (List_table.LeftOffset               0)
        (List_table.RightOffset              0)
        (List_table.ListType                 1)
        (List_table.SelectionPolicy          2)
	(List_table.KeyboardAutoScroll       True)
	(List_table.MinRows                  15)
        (List_table.SymbolNames		     "1:" "2:" "3:" "4:" "5:" "6:"
					     "7:" "8:" "9:" "10:" "11:" "12:"
					     "13:" "14:" "15:" "16:" "17:"
					     "18:" "19:" "20:" "21:" "22:"
					     "23:" "24:" "25:" "26:"
					     "27:" "28:"
					     "1001:" "1002:" "1003:" "1004:"
					     "1005:" "1006:" "1007:" "1008:" 
					     "1009:" "1010:" "1011:" "1012:"
					     "1013:" "1014:"
					     "1015:" "1016:" "1017:" "1018:"
					     "1019:" "1020:" "1021:" "1022:"
					     "1023:" "1024:" "1025:" "1026:"
					     "1027:" "1028:" "1029:" "1034:")
	(List_table.SymbolImages	     "prt_image" "asm_image" 
					     "drawing" "format" "mfg" 
				             "folder" "generic_nonptc" 
					     "generic_ptc" "markup" "layout" 
					     "diagram" "report" "sketch" 
					     "sketch" "sketch" "mfg_ascii"
					     "mfg_ascii" "mfg_ascii" "generic_nonptc"
					     "mfg_ascii" "mfg_ascii" "mfg_ascii"
					     "mfg_tool" "mold" "cast" "skeleton"
				             "multi_view_comp" "component_group"
					     "closed_folder" "conflict"
					     "intenttomodify" "locked"
  					     "lockedmodified" "modified"
				             "modified1" "modifiednolock"
				             "modifiedwarn" "modifyintent"
					     "notification" "openfolder"
				             "warning" "warningoutdate"
					     "session" "workspace"
					     "common_space" "library"
					     "config_folder" "favorites"
                                             "UI fixed device image"
					"UI floppy device image"
					"UI cdrom device image"
					"UI removable device image"
					"UI remote device image"
					"UI network image"
                                        "UI floppy 5.25 device image"
                                        "folder_navigator"
                                        "UI host image"
					"bookmark")
        (List_table.ColumnLabel		"                ")
        (.TopOffset                     0)
        (.BottomOffset                  0)
        (.LeftOffset                    0)
        (.RightOffset                   0)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                List_table
            )
        )
    )
)
