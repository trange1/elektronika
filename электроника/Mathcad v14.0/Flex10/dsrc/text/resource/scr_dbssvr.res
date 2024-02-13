!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  scr_dbssvr.res
! 
!  The Data Server screen
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  24-Feb-00 I-03-27+  TWH   $$1    Group Submission
!  04-Mar-02 J-01-42+  TWH   $$2    MS_SS support
!  16-Apr-04 K-01-26+  TWH   $$3    Re-do layout for K-01
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout scr_dbssvr
    (Components
        (SubLayout                      scr_dbssvr3)
        (Label                          Label7)
        (SubLayout                      Layout7)
    )

    (Resources
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 0 0 1) (Cols 1)
                scr_dbssvr3
                Layout7
                Label7
            )
        )
    )
)

(Layout scr_dbssvr3
    (Components
        (TextArea                       TextArea)
    )

    (Resources
        (TextArea.Rows                  3)
        (TextArea.Columns               25)
        (TextArea.MaxLen                300)
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

(Layout Layout7
    (Components
        (Label                          Label6)
        (InputPanel                     Hostname)
        (SubLayout                      Layout_MS)
        (SubLayout                      Layout_SS)
    )

    (Resources
        (Label6.Label                   "Data Server Hostname")
        (Label6.AttachLeft              True)
        (Label6.Alignment               0)
        (Hostname.Columns               20)
        (Hostname.BottomOffset          5)
        (Hostname.LeftOffset            10)
        (.TopOffset                     10)
        (.Layout
            (Grid (Rows 1 1) (Cols 1 1)
                Label6
                Hostname
                Layout_MS
                Layout_SS
            )
        )
    )
)

(Layout Layout_MS
    (Components
        (Label                          Label5)
    )

    (Resources
        (Label5.Label                   "Server Type:")
        (.AttachLeft                    True)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                Label5
            )
        )
    )
)

(Layout Layout_SS
    (Components
        (RadioGroup                     MS_SS_Radio)
    )

    (Resources
        (MS_SS_Radio.Names              "MS"
                                        "SS")
        (MS_SS_Radio.Labels             "Multi-Site"
                                        "Single-Site")
        (MS_SS_Radio.Alignment          2)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.LeftOffset                    10)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                MS_SS_Radio
            )
        )
    )
)
