!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  cmdcfg_blank.res
! 
!  Command configuration, blank
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  16-Feb-99 I-03-02   JJE   $$1    Group submission
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout cmdcfg_blank
    (Components
        (SubLayout                      blank_1)
        (SubLayout                      blank_2)
    )

    (Resources
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1) (Cols 1)
                blank_1
                blank_2
            )
        )
    )
)

(Layout blank_1
    (Components
        (Label                          LabelInvisible)
    )
    (Resources
        (LabelInvisible.Visible         False)
        (.Label                         "Locate Other Installation Directories (Optional)")
! (.Decorated  : USE True once visible components are added.
        (.Decorated                     False)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                LabelInvisible
            )
        )
    )
)

(Layout blank_2
    (Components
        (Label                          LabelInvisible2)
    )
    (Resources
        (LabelInvisible2.Visible         False)
        (.Label                         "Optional Inputs")
! (.Decorated  : USE True once visible components are added.
        (.Decorated                     False)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                LabelInvisible2
            )
        )
    )
)

