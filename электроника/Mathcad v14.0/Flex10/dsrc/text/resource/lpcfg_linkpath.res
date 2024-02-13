!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  lpcfg_linkpath.res
! 
!  Lpcfg, linkpath
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  16-Feb-99 I-03-02   JJE   $$1    Group submission
!  04-Mar-99           TWH          Add TextArea; Cosmetic changes
!  23-Mar-99           JJE          Tweaks
!  30-Apr-99           JJE          Use image instead of Browse
!  11-May-99 I-03-09   JJE   $$2    Group Submission
!  10-Jan-00           MYA          Expand maxlen of linkpath
!  12-Jan-00 I-03-26+  JJE   $$3    Group Submission
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout lpcfg_linkpath
    (Components
        (SubLayout                      LinkpathSubLayout)
        (Label                          Label2)
        (Label                          Label4)
        (Label                          Label5)
        (TextArea                       TextArea)
        (Label                          Label3)
    )

    (Resources
        (TextArea.Rows                  3)
        (TextArea.Columns               25)
        (TextArea.MaxLen                200)
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
                    LinkpathSubLayout
                    Label5
                )
                Label4
            )
        )
    )
)

(Layout LinkpathSubLayout
    (Components
        (InputPanel                     Linkpath)
        (Label                          Label1)
        (PushButton                     LinkpathBrowse)
    )

    (Resources
        (Linkpath.MaxLen                255)
        (Linkpath.BottomOffset          5)
        (Linkpath.LeftOffset            5)
        (Label1.Label                   "Location for command links")
        (Label1.AttachLeft              True)
        (Label1.AttachBottom            True)
        (Label1.TopOffset               5)
        (Label1.BottomOffset            2)
        (Label1.LeftOffset              5)
        (LinkpathBrowse.Bitmap          "UI dir open image")
        (LinkpathBrowse.AttachLeft      True)
        (LinkpathBrowse.AttachRight     True)
        (LinkpathBrowse.BottomOffset    5)
        (LinkpathBrowse.LeftOffset      4)
        (LinkpathBrowse.RightOffset     5)
        (.Decorated                     True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.Layout
            (Grid (Rows 1 0) (Cols 1 0)
                Label1
                (Pos 2 1)
                Linkpath
                LinkpathBrowse
            )
        )
    )
)
