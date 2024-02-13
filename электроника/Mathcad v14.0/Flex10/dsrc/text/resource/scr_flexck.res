!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  scr_flexck.res
! 
!  ScreenProgress
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  23-Apr-99           TWH          Created.
!  30-Apr-99           TWH          Add modify/check btns
!  11-May-99 I-03-09   JJE   $$1    Group Submission
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout scr_flexck
    (Components
        (SubLayout                      CheckLayout)
        (SubLayout                      CheckLayout2)
        (Label                          Label7)
        (Label                          Label8)
        (Label                          Label9)
        (TextArea                       TextArea)
        (SubLayout                      CheckLayout3)
    )

    (Resources
        (TextArea.MaxLen                200)
        (TextArea.Editable              False)
        (TextArea.Decorated             False)
        (TextArea.Wrap                  True)
        (TextArea.ScrollBarPosition     6)
        (TextArea.CaretVisible          False)
        (TextArea.ScrollBarsWhenNeeded  True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1) (Cols 1 1 1)
                Label8
                (Grid (Rows 1 1 1) (Cols 1)
                    TextArea
                    (Grid (Rows 1) (Cols 1 1 1)
                        CheckLayout
                        CheckLayout3
                        CheckLayout2
                    )
                    Label7
                )
                Label9
            )
        )
    )
)

(Layout CheckLayout
    (Components
        (ScrolledLayout                 ValidLayout)
    )

    (Resources
        (.Label                         "Valid Licenses")
        (.Decorated                     True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                ValidLayout
            )
        )
    )
)

(Layout ValidLayout
    (Components
        (Label                          ValidLabel)
    )

    (Resources
        (ValidLabel.Label               "Some")
        (ValidLabel.Columns             11)
        (ValidLabel.AttachLeft          True)
        (ValidLabel.AttachRight         True)
        (ValidLabel.Alignment           0)
        (ValidLabel.SymbolNames         "CHK"
                                        "X")
        (ValidLabel.SymbolImages        "check"
                                        "x")
        (ValidLabel.TruncateLabel       False)
        (.VisibleRows                   12)
        (.Decorated                     False)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
    )
)

(Layout CheckLayout2
    (Components
        (ScrolledLayout                 InvalidLayout)
    )

    (Resources
        (.Label                         "Invalid Licenses")
        (.Decorated                     True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                InvalidLayout
            )
        )
    )
)

(Layout InvalidLayout
    (Components
        (Label                          InvalidLabel)
    )

    (Resources
        (InvalidLabel.Label             "Some")
        (InvalidLabel.Columns           11)
        (InvalidLabel.AttachLeft        True)
        (InvalidLabel.AttachRight       True)
        (InvalidLabel.Alignment         0)
        (InvalidLabel.ForegroundColor   9)
        (InvalidLabel.SymbolNames       "CHK"
                                        "X")
        (InvalidLabel.SymbolImages      "check"
                                        "x")
        (InvalidLabel.TruncateLabel     False)
        (.VisibleRows                   12)
        (.Decorated                     False)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
    )
)

(Layout CheckLayout3
    (Components
        (PushButton                     FixBtn)
        (PushButton                     CheckBtn)
    )

    (Resources
        (FixBtn.Label                   "Modify...")
        (FixBtn.AttachLeft              True)
        (FixBtn.AttachRight             True)
        (FixBtn.AttachTop               True)
        (FixBtn.AttachBottom            True)
        (FixBtn.TopOffset               5)
        (CheckBtn.Label                 "ReCheck")
        (CheckBtn.AttachTop             True)
        (CheckBtn.TopOffset             5)
        (.AttachTop                     True)
        (.Layout
            (Grid (Rows 1 1) (Cols 1)
                FixBtn
                CheckBtn
            )
        )
    )
)
