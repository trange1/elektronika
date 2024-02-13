!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  scr_pdmport.res
! 
!  Webpub properties screen
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  28-Jun-99           MYA          Created
!  17-Aug-99 I-03-12+  JJE   $$1    Group Submission
!  29-Mar-01           ALG          Set PortNumber to Int type
!  29-Mar-01 J-01-30+  ALG   $$2    Add PortNumberLab
!  18-Jul-01 J-01-35   TWH   $$3    Add PdmServerLp layout
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout scr_pdmport
    (Components
        (SubLayout                      scr_pdmport2)
        (TextArea                       TextArea)
        (Label                          Label1)
    )

    (Resources
        (TextArea.Rows                  8)
        (TextArea.Columns               25)
        (TextArea.MaxLen                200)
        (TextArea.Editable              False)
        (TextArea.Decorated             False)
        (TextArea.AttachLeft            False)
        (TextArea.AttachRight           False)
        (TextArea.Wrap                  True)
        (TextArea.ScrollBarPosition     6)
        (TextArea.CaretVisible          False)
        (TextArea.ScrollBarsWhenNeeded  True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 0 0 1) (Cols 1)
                TextArea
                scr_pdmport2
                Label1
            )
        )
    )
)

(Layout scr_pdmport2
    (Components
        (SubLayout                      PortLayout)
        (SubLayout                      LPLayout)
    )

    (Resources
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.Alignment                     2)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1) (Cols 1)
                LPLayout
                PortLayout
            )
        )
    )
)

(Layout PortLayout
    (Components
        (InputPanel                     PortNumber)
    )

    (Resources
        (PortNumber.MaxLen              20)
        (PortNumber.AttachRight         False)
        (PortNumber.InputType           2)
        (.Label                         "PDM Server Port Number")
        (.Decorated                     True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                PortNumber
            )
        )
    )
)

(Layout LPLayout
    (Components
        (InputPanel                     PdmServerLp)
        (PushButton                     PdmServerLpBrowse)
    )

    (Resources
        (PdmServerLpBrowse.Label        "Browse")
        (.Label                         "PDM Server on <name>")
        (.Decorated                     True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.Layout
            (Grid (Rows 1) (Cols 1 1)
                PdmServerLp
                PdmServerLpBrowse
            )
        )
    )
)
