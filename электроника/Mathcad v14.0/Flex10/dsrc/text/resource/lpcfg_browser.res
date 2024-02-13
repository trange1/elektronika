!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  lpcfg_browser.res
! 
!  Lpcfg, browser location
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  16-Feb-99 I-03-02   JJE   $$1    Group submission
!  03-Mar-99           TWH          Add TextArea, some cosmetics
!  23-Mar-99           JJE          Tweaks
!  30-Apr-99           JJE          Use image instead of Browse
!  11-May-99 I-03-09   JJE   $$2    Group Submission
!  10-Jan-00           MYA          expand maxlen of Browser
!  12-Jan-00 I-03-26+  JJE   $$3    Group Submission
!  15-Nov-02 J-03-38   MAZ   $$4    SPR 989219: Make Browser an InputPanel
!  16-Jan-03 J-03-41   ALG   $$5    SPR 998334: Set Browser.MaxLen to 255
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout lpcfg_browser
    (Components
        (SubLayout                      BrowserSubLayout)
        (Label                          Label2)
        (Label                          Label4)
        (Label                          Label5)
        (TextArea                       TextArea)
        (Label                          Label3)
    )

    (Resources
        (TextArea.Rows                  3)
        (TextArea.Columns               25)
        (TextArea.MaxLen                512)
        (TextArea.Editable              False)
        (TextArea.Decorated             False)
        (TextArea.Wrap                  True)
        (TextArea.ScrollBarPosition     6)
        (TextArea.CaretVisible          False)
        (TextArea.ScrollBarsWhenNeeded  True)
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
                Label2
                (Grid (Rows 1 0 0 1) (Cols 0)
                    Label3
                    TextArea
                    BrowserSubLayout
                    Label5
                )
                Label4
            )
        )
    )
)

(Layout BrowserSubLayout
    (Components
        (Label                          Label1)
        (PushButton                     BrowserBrowse)
        (InputPanel                     Browser)
    )

    (Resources
        (Label1.Label                   "Default web browser path")
        (Label1.AttachLeft              True)
        (Label1.AttachBottom            True)
        (Label1.BottomOffset            0)
        (BrowserBrowse.Bitmap           "UI dir open image")
        (BrowserBrowse.AttachLeft       True)
        (BrowserBrowse.AttachRight      True)
        (BrowserBrowse.LeftOffset       0)
        (Browser.MaxLen                 255)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1) (Cols 1 0)
                Label1
                (Pos 2 1)
                Browser
                BrowserBrowse
            )
        )
    )
)
