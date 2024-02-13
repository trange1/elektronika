!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  scr_netscape.res
! 
!  Standard mime type selection screen
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  17-Apr-00           MYA          Created
!  19-Apr-00 I-03-28+  JJE   $$1    Group Submission
!  21-Apr-03 K-01-05   JJE   $$2    Fix to pass ui_reschk
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout scr_netscape
    (Components
        (SubLayout                      scr_netscape2)
        (TextArea                       TextArea)
        (Label                          XLabel1)
    )

    (Resources
        (TextArea.Rows                  8)
        (TextArea.Columns               25)
        (TextArea.MaxLen                200)
        (TextArea.Editable              False)
        (TextArea.Value                 " ")
        (TextArea.Decorated             False)
        (TextArea.AttachLeft            False)
        (TextArea.AttachRight           False)
        (TextArea.AttachTop             False)
        (TextArea.AttachBottom          False)
        (TextArea.Wrap                  True)
        (TextArea.ScrollBarPosition     6)
        (TextArea.CaretVisible          False)
        (TextArea.ScrollBarsWhenNeeded  True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 0 0 1) (Cols 1)
                TextArea
                scr_netscape2
                XLabel1
            )
        )
    )
)



(Layout scr_netscape2
    (Components
        (RadioGroup                     RadioMime)
        (InputPanel                     GlobalDir)
        (Label                          Label1)
        (PushButton                     GlobalDirBrowse)
    )

    (Resources
        (RadioMime.Orientation          True)
        (RadioMime.Names                "0"
                                        "1")
        (RadioMime.Labels               "Modify current user MIME type information only"
                                        "Modify global Netscape MIME type registration information")
        (RadioMime.TopOffset            5)
        (RadioMime.BottomOffset         5)
        (RadioMime.LeftOffset           10)
        (RadioMime.RightOffset          10)
        (GlobalDir.MaxLen               260)
        (GlobalDir.LeftOffset           10)
        (GlobalDir.RightOffset          10)
        (Label1.Label                   "Specify directory where global mime.types and mailcap files reside")
        (Label1.AttachLeft              True)
        (Label1.AttachRight             True)
        (Label1.AttachTop               True)
        (Label1.AttachBottom            True)
        (Label1.TopOffset               5)
        (Label1.BottomOffset            5)
        (Label1.LeftOffset              10)
        (Label1.RightOffset             10)
        (GlobalDirBrowse.Label          "Browse")
        (.Label                         "")
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 0 1 1) (Cols 1 1)
                RadioMime
                (Pos 2 1)
                Label1
                (Pos 3 1)
                GlobalDir
                GlobalDirBrowse
            )
        )
    )
)
