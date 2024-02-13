!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
!
!  fwoptdlg.res
!
!  Feature Wizard, Option Selection Dialog
!
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  16-Apr-99           TWH          Created.
!  11-May-99 I-03-09   JJE   $$1    Group Submission
!  07-Feb-00           JJE          Fix button labels
!  08-Feb-00           JJE          Add setup bitmap
!  09-Feb-00 I-03-26+  JJE   $$2    Group Submission
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Dialog fwoptdlg
    (Components
        (SubLayout                      Layout2)
        (SubLayout                      Layout3)
    )

    (Resources
        (.Bitmap                        "setup")
        (.Label                         "Select Floating Options")
        (.Layout
            (Grid (Rows 1 1) (Cols 1)
                Layout2
                Layout3
            )
        )
    )
)

(Layout Layout2
    (Components
        (TextArea                       TextArea2)
        (List                           OptionList)
    )

    (Resources
        (TextArea2.Rows                 1)
        (TextArea2.Columns              17)
        (TextArea2.Editable             False)
        (TextArea2.Decorated            False)
        (TextArea2.ScrollBarPosition    6)
        (TextArea2.CaretVisible         False)
        (TextArea2.ScrollBarsWhenNeeded True)
        (OptionList.SelectionPolicy     2)
        (OptionList.VisibleRows         16)
        (OptionList.TabStops            3)
        (OptionList.ListType            Mixed)
        (OptionList.ScrollBarPosition   6)
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
                TextArea2
                OptionList
            )
        )
    )
)

(Layout Layout3
    (Components
        (PushButton                     OkButton)
        (PushButton                     CancelBtn)
    )

    (Resources
        (OkButton.Label                 "&OK")
        (OkButton.AttachLeft            True)
        (OkButton.TopOffset             5)
        (OkButton.BottomOffset          5)
        (CancelBtn.Label                "&Cancel")
        (CancelBtn.AttachRight          True)
        (CancelBtn.TopOffset            5)
        (CancelBtn.BottomOffset         5)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1) (Cols 1 1)
                OkButton
                CancelBtn
            )
        )
    )
)
