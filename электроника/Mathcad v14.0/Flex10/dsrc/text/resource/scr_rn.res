!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  RosettaNet properties screen
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  18-Oct-00 J-01-20   TWH   $$1    Created
!  25-Apr-01           DAR          Replaced prefix & extension with StartDate & StorageSize
!  09-May-01 J-01-32+  MAZ   $$2    Use SDK instead of JVM
!  04-Jun-01 J-01-33+  MAZ   $$3    Fix SPR 875526, set storage to 5 Mb
!  10-Dec-01 J-03-14   MAZ   $$4    Update for PartsLink 6.2
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout scr_rn
    (Components
        (TextArea                       TextArea)
        (Label                          Label2)
        (Label                          Label1)
        (Label                          Label3)
        (Label                          Label4)
        (SubLayout                      scr_rn2)
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
            (Grid (Rows 1 1) (Cols 1 0 1)
                Label1
                (Grid (Rows 1 1 1 1) (Cols 0)
                    Label4
                    TextArea
                    scr_rn2
                )
                Label3
                (Pos 2 2)
                Label2
            )
        )
    )
)

(Layout scr_rn2
    (Components
        (SubLayout                      scr_rn_gateway)
    )

    (Resources
        (.Layout
            (Grid (Rows 1) (Cols 1)
                scr_rn_gateway
            )
        )
    )
)

(Layout scr_rn_gateway
    (Components
        (Label                          HTTPPortLab)
        (Label                          DUNSLab)
        (InputPanel                     HTTPPort)
        (InputPanel                     DUNS)
    )

    (Resources
        (HTTPPortLab.Label              "Port Number")
        (HTTPPortLab.AttachRight        True)
        (HTTPPortLab.Alignment          1)
        (DUNSLab.Label                  "DUNS Number")
        (DUNSLab.AttachRight            True)
        (DUNSLab.Alignment              1)
        (HTTPPort.MinInteger            1)
        (HTTPPort.MaxInteger            65535)
        (HTTPPort.InputType             2)
        (DUNS.MaxLen                    9)
        (DUNS.MinInteger                100000000)
        (DUNS.MaxInteger                999999999)
        (DUNS.InputType                 2)
        (.Label                         "Gateway")
        (.Decorated                     True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1) (Cols 1 1)
                HTTPPortLab
                HTTPPort
                DUNSLab
                DUNS
            )
        )
    )
)
