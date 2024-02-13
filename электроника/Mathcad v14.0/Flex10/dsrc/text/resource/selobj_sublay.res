!*****************************************************************************!
!
! 05-Jun-97 H-03-16  vrs/KMG  $$1  Created.
! 10-Jul-97 H-03-16+ KMG      $$2  Cleaned up and aligned things
! 08-Jan-98 H-03-36  hmt      $$3 CascadeButton style to "tool"
! 19-Feb-03 K-01-01  Moti     $$4 Moved Cascade Button info to here .
!
!*****************************************************************************!
!*****************************************************************************!

(Layout selobj_sublay
    (Components
        (Tab                            tab_main
                                        lay_page_2
                                        lay_page_0
                                        lay_page_1)
    )

    (Resources
        (tab_main.Collapsable           True)
        (.Label                         "Select Object")
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.TopOffset                     0)
        (.LeftOffset                    0)
        (.RightOffset                   0)
        (.Layout
            (Grid (Rows 0) (Cols 1)
                tab_main
            )
        )
    )
)

(Layout lay_page_0
    (Components
        (InputPanel                     ObjName0)
        (CascadeButton                  cb
                                        ObjList)
    )

    (Resources
        (ObjName0.AttachTop             True)
        (ObjName0.AttachBottom          True)
        (ObjName0.TopOffset             0)
        (ObjName0.BottomOffset          0)
        (ObjName0.LeftOffset            0)
        (ObjName0.RightOffset           0)
        (cb.Selected_image              "seltzer")
        (cb.Unselected_image            "seltzer")
	(cb.HelpText			"Commands and Settings")
	(cb.ButtonStyle			Mixed)
        (cb.AttachLeft                  True)
        (cb.AttachRight                 True)
        (cb.AttachTop                   True)
        (cb.AttachBottom                True)
        (cb.TopOffset                   0)
        (cb.BottomOffset                0)
        (cb.LeftOffset                  2)
        (cb.RightOffset                 0)
        (.Layout
            (Grid (Rows 0) (Cols 1 0)
                ObjName0
                cb
            )
        )
    )
)

(Layout lay_page_1
    (Components
        (InputPanel                     ObjName1)
    )

    (Resources
        (ObjName1.AttachTop             True)
        (ObjName1.AttachBottom          True)
        (ObjName1.TopOffset             0)
        (ObjName1.BottomOffset          0)
        (ObjName1.LeftOffset            0)
        (ObjName1.RightOffset           0)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                ObjName1
            )
        )
    )
)

(Layout lay_page_2
    (Components
        (Label                          dummy)
    )

    (Resources
        (dummy.Bitmap                   "empty")
        (dummy.TopOffset                0)
        (dummy.BottomOffset             0)
        (dummy.LeftOffset               0)
        (dummy.RightOffset              0)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                dummy
            )
        )
    )
)

(MenuPane ObjList
    (Components
        (PushButton                     Select)
        (Separator                      seperator1)
    )

    (Resources
        (Select.Label                   "Select...")
        (seperator1.TopOffset           0)
        (seperator1.BottomOffset        0)
        (seperator1.LeftOffset          0)
        (seperator1.RightOffset         0)
    )
)
