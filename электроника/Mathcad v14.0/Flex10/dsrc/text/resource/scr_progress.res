!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  scr_progress.res
! 
!  ScreenProgress
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  16-Feb-99 I-03-02   JJE   $$1    Group submission
!  12-Mar-99           JJE          Add the action list
!  24-Mar-99           TWH          Add Symbols
!  25-Mar-99           JJE          Change to a GifArea
!  15-Apr-99           JJE          Scrap the GifArea for now
!  11-May-99 I-03-09   JJE   $$2    Group Submission
!  17-May-99           JJE          Add a new bottom layout
!  07-Jun-99 I-03-10   JJE   $$3    Group Submission
!  10-Dec-99           JJE          Some layout changes
!  15-Dec-99 I-03-24   JJE   $$4    Group Submission
!  31-May-00           JJE          Increase length to 28 from 24
!  31-May-00 I-03-28+  JJE   $$5    Group Submission
!  03-Jan-02 J-03-16   ALG   $$6    SPR 919709 "Progress"->"File Copy Progress"
!  19-May-03 K-01-07   TWH   $$7    Add Advert Layout
!  25-Aug-03 K-01-13   TWH   $$8    Add fixed trio advert images
!  09-Sep-03 K-01-14   JJE   $$9    Tweak layout
!  07-Oct-03 K-01-16   TWH   $$10   Hide WhatsNew layout (#8)
!  05-Mar-04 K-01-25   JJE   $$11   Add Progress bar for download
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout scr_progress
    (Components
        (Label                          Label1)
        (Label                          Label2)
        (Label                          Label3)
        (Tab                            BottomTab
                                        StatusLayout
                                        CompleteLayout)
        (SubLayout                      AdvertLayout)
        (Label                          Label4)
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
            (Grid (Rows 1) (Cols 1 0 1)
                Label1
                (Grid (Rows 1 0 0 1) (Cols 0)
                    Label4
                    AdvertLayout
                    BottomTab
                    Label3
                )
                Label2
            )
        )
    )
)

(Layout StatusLayout
    (Components
        (ProgressBar                    MainProgress)
        (PushButton                     ProgressCancel)
        (Label                          ProgressLab)
        (Tab                            DlProgTab
                                        DlBlank
                                        DlProg)
        (Label                          Label7)
        (Label                          Label8)
    )

    (Resources
        (MainProgress.AttachLeft        True)
        (MainProgress.AttachRight       True)
        (MainProgress.Integer           0)
        (MainProgress.MinInteger        0)
        (MainProgress.MaxInteger        100)
        (MainProgress.Length            18)
        (MainProgress.BottomOffset      5)
        (ProgressCancel.Label           "Cancel")
        (ProgressCancel.ButtonStyle     2)
        (ProgressCancel.TopOffset       5)
        (ProgressLab.Label              "Ready to begin installation.")
        (ProgressLab.AttachLeft         True)
        (ProgressLab.AttachRight        True)
        (ProgressLab.Alignment          0)
        (DlProgTab.Collapsable          True)
        (.Label                         "Installation Progress")
        (.Decorated                     True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.Alignment                     2)
        (.Layout
            (Grid (Rows 0 1 1 1) (Cols 1 1 1)
                (Pos 1 2)
                ProgressLab
                (Pos 2 1)
                Label7
                MainProgress
                Label8
                (Pos 3 2)
                DlProgTab
                (Pos 4 2)
                ProgressCancel
            )
        )
    )
)

(Layout DlBlank
    (Components
        (Label                          Label4x)
    )

    (Resources
        (.Layout
            (Grid (Rows 1) (Cols 1)
                Label4x
            )
        )
    )
)

(Layout DlProg
    (Components
        (ProgressBar                    DlProgBar)
        (Label                          Label6)
    )

    (Resources
        (DlProgBar.AttachLeft           True)
        (DlProgBar.AttachRight          True)
        (DlProgBar.MinInteger           0)
        (DlProgBar.MaxInteger           100)
        (Label6.Label                   "Download Progress")
        (Label6.AttachLeft              True)
        (Label6.AttachRight             True)
        (Label6.Alignment               0)
        (.Layout
            (Grid (Rows 1 1) (Cols 1)
                Label6
                DlProgBar
            )
        )
    )
)

(Layout CompleteLayout
    (Components
        (Label                          Label5)
    )

    (Resources
        (Label5.Label                   "Installation Complete")
        (Label5.AttachLeft              True)
        (Label5.AttachRight             True)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                Label5
            )
        )
    )
)

(Layout AdvertLayout
    (Components
        (PushButton                     CurrentAdvert)
        (SubLayout                      Layout1)
    )

    (Resources
        (CurrentAdvert.Bitmap           "pf_ph.gif")
        (CurrentAdvert.ButtonStyle      4)
        (CurrentAdvert.AttachLeft       True)
        (CurrentAdvert.AttachRight      True)
        (CurrentAdvert.AttachTop        True)
        (CurrentAdvert.AttachBottom     True)
        (CurrentAdvert.Resizeable       True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.Layout
            (Grid (Rows 0 1) (Cols 1)
                Layout1
                CurrentAdvert
            )
        )
    )
)

(Layout Layout1
    (Components
        (PushButton                     whatsnew)
        (PushButton                     casestudies)
        (PushButton                     tools)
    )

    (Resources
        (whatsnew.Bitmap                "progress_whatsnew.gif")
        (whatsnew.ButtonStyle           4)
        (whatsnew.AttachLeft            True)
        (whatsnew.AttachRight           True)
        (whatsnew.AttachTop             True)
        (whatsnew.AttachBottom          True)
        (casestudies.Bitmap             "progress_casestudies.gif")
        (casestudies.ButtonStyle        4)
        (casestudies.AttachLeft         True)
        (casestudies.AttachRight        True)
        (casestudies.AttachTop          True)
        (casestudies.AttachBottom       True)
        (tools.Bitmap                   "progress_tools.gif")
        (tools.ButtonStyle              4)
        (tools.AttachLeft               True)
        (tools.AttachRight              True)
        (tools.AttachTop                True)
        (tools.AttachBottom             True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.Visible                       False)
        (.Layout
            (Grid (Rows 1) (Cols 1 0 0)
                whatsnew
                casestudies
                tools
            )
        )
    )
)
