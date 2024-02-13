!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  lpcfg_ms_ss.res
! 
!  Lpcfg, MS_SS 
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  04-Mar-02 J-01-42+  TWH   $$1    Created
!  16-Apr-04 K-01-26+  TWH   $$2    Re-do for K-01 layout
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout lpcfg_ms_ss
    (Components
        (SubLayout                      lpcfg_ms_ss2)
        (RadioGroup                     MS_SS_Radio)
        (Label                          Label5)
    )

    (Resources
        (MS_SS_Radio.Orientation        True)
        (MS_SS_Radio.AttachLeft         False)
        (MS_SS_Radio.AttachRight        False)
        (MS_SS_Radio.AttachTop          False)
        (MS_SS_Radio.AttachBottom       False)
        (MS_SS_Radio.Names              "MS"
                                        "SS")
        (MS_SS_Radio.Labels             "Multi-Site"
                                        "Single-Site")
        (MS_SS_Radio.Alignment          2)
        (MS_SS_Radio.TopOffset          10)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 0 0 1) (Cols 1)
                lpcfg_ms_ss2
                MS_SS_Radio
                Label5
            )
        )
    )
)

(Layout lpcfg_ms_ss2
    (Components
        (TextArea                       TextArea)
    )

    (Resources
        (TextArea.Rows                  3)
        (TextArea.Columns               25)
        (TextArea.MaxLen                512)
        (TextArea.Editable              False)
        (TextArea.Decorated             False)
        (TextArea.Wrap                  True)
        (TextArea.MinRows               5)
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
