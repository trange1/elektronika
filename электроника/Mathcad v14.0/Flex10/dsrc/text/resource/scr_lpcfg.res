!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  scr_lpcfg.res
! 
!  Lpcfg
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  04-Jan-98           JJE          Created.
!  16-Feb-99 I-03-02   JJE   $$1    Group submission
!  04-Mar-99           TWH          Add TextArea; Cosmetic chgs
!  04-May-99           JJE          Adjust textarea
!  11-May-99 I-03-09   JJE   $$2    Group Submission
!  16-Jan-03 J-03-41   ALG   $$3    Set TextArea.BottomOffset to 5
!  09-Jun-03 K-01-08   TWH   $$4    Add instructions layout
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout scr_lpcfg
    (Components
        (SubLayout                      scr_lpcfg2)
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
            (Grid (Rows 1) (Cols 1)
                scr_lpcfg2
            )
        )
    )
)

(Layout scr_lpcfg2
    (Components
        (SubLayout                      L1)
        (Label                          Label3)
        (ScrolledLayout                 LLayout)
    )

    (Resources
        (Label3.Columns                 10)
        (Label3.AttachLeft              True)
        (Label3.AttachRight             True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1) (Cols 1)
                L1
                (Grid (Rows 1) (Cols 0 1)
                    Label3
                    LLayout
                )
            )
        )
    )
)

(Layout L1
    (Components
        (TextArea                       TextArea)
    )

    (Resources
        (TextArea.Rows                  3)
        (TextArea.Columns               25)
        (TextArea.MaxLen                200)
        (TextArea.Editable              False)
        (TextArea.Decorated             False)
        (TextArea.Wrap                  True)
        (TextArea.BottomOffset          5)
        (TextArea.ScrollBarPosition     6)
        (TextArea.CaretVisible          False)
        (TextArea.ScrollBarsWhenNeeded  True)
        (.Label                         "Instructions")
        (.Decorated                     True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                TextArea
            )
        )
    )
)

(Layout LLayout
    (Components
        (CheckButton                    LCB)
    )

    (Resources
        (LCB.AttachLeft                 True)
        (LCB.AttachRight                True)
        (LCB.Alignment                  2)
        (LCB.LeftOffset                 0)
        (LCB.RightOffset                0)
        (LCB.TruncateLabel              False)
        (.VisibleRows                   14)
        (.Decorated                     False)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
    )
)
