!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  lpcfg_csd.res
! 
!  Lpcfg Conference Server 
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  24-Apr-02 J-03-24   MAZ   $$1    Created 
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout lpcfg_csd
    (Components
        (SubLayout                      CsdSubLayout)
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
                    CsdSubLayout
                    Label5
                )
                Label4
            )
        )
    )
)

(Layout CsdSubLayout
    (Components
        (InputPanel                     cshost)
        (Label                          Label1)
        (Label                          Label6)
        (Label                          Label7)
    )

    (Resources
        (cshost.MaxLen                  255)
        (cshost.AttachLeft              False)
        (cshost.AttachRight             False)
        (cshost.TopOffset               5)
        (cshost.BottomOffset            5)
        (cshost.LeftOffset              5)
        (cshost.RightOffset             5)
        (Label1.Label                   "Hostname")
        (Label1.TopOffset               5)
        (Label1.BottomOffset            5)
        (Label1.LeftOffset              5)
        (Label1.RightOffset             5)
        (.Label                         "Conference Server Settings")
        (.Decorated                     True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.Layout
            (Grid (Rows 1 0) (Cols 1 1)
                Label6
                Label7
                Label1
                cshost
            )
        )
    )
)
