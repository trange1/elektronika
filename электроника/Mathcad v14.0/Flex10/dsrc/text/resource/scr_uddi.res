!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  UDDI properties screen
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  27-Nov-01 J-03-14   MAZ   $$1    Created
!  10-Jan-02 J-01-41   MAZ          Increase field size
!  07-Mar-02 J-01-43   MAZ   $$2    Submit to J-03-21
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout scr_uddi
    (Components
        (TextArea                       TextArea)
        (Label                          Label2)
        (Label                          Label1)
        (Label                          Label3)
        (Label                          Label4)
        (SubLayout                      scr_uddi2)
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
                    scr_uddi2
                )
                Label3
                (Pos 2 2)
                Label2
            )
        )
    )
)

(Layout scr_uddi2
    (Components
        (SubLayout                      scr_uddi_pub)
        (SubLayout                      scr_uddi_op)
    )

    (Resources
        (.Layout
            (Grid (Rows 1 1) (Cols 1)
                scr_uddi_op
                scr_uddi_pub
            )
        )
    )
)

(Layout scr_uddi_pub
    (Components
        (Label                          ServiceKeyLab)
        (Label                          DescLab)
        (InputPanel                     ServiceKey)
        (InputPanel                     ProdDesc)
    )

    (Resources
        (ServiceKeyLab.Label            "Service Key")
        (ServiceKeyLab.AttachRight      True)
        (ServiceKeyLab.Alignment        1)
        (DescLab.Label                  "Product Catalog Description")
        (DescLab.AttachRight            True)
        (DescLab.Alignment              1)
        (ServiceKey.MaxLen              128)
        (ServiceKey.MinInteger          1)
        (ServiceKey.MaxInteger          65535)
        (ProdDesc.MaxLen                128)
        (ProdDesc.MinInteger            100000000)
        (ProdDesc.MaxInteger            999999999)
        (.Label                         "PTC PartsLink Publishing Information")
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
                ServiceKeyLab
                ServiceKey
                DescLab
                ProdDesc
            )
        )
    )
)

(Layout scr_uddi_op
    (Components
        (Label                          OperatorLab)
        (InputPanel                     BusinessKey)
        (OptionMenu                     OperatorMenu)
        (Label                          IDLab)
        (Label                          BusinessKeyLab)
        (InputPanel                     UserID)
        (InputPanel                     Password)
        (Label                          PasswordLab)
    )

    (Resources
        (OperatorLab.Label              "Operator")
        (OperatorLab.AttachRight        True)
        (OperatorLab.Alignment          1)
        (BusinessKey.MaxLen             128)
        (BusinessKey.MinInteger         1)
        (BusinessKey.MaxInteger         1024)
        (OperatorMenu.Editable          True)
        (OperatorMenu.VisibleRows       2)
        (OperatorMenu.DefaultHelpText   "16")
        (IDLab.Label                    "User ID")
        (IDLab.AttachRight              True)
        (IDLab.Alignment                1)
        (BusinessKeyLab.Label           "Business Key")
        (BusinessKeyLab.AttachRight     True)
        (BusinessKeyLab.Alignment       1)
        (Password.Password              True)
        (PasswordLab.Label              "Password")
        (PasswordLab.AttachRight        True)
        (PasswordLab.Alignment          1)
        (.Label                         "UDDI Business Registry")
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
            (Grid (Rows 1 1 1 1) (Cols 1 1)
                OperatorLab
                OperatorMenu
                BusinessKeyLab
                BusinessKey
                IDLab
                UserID
                PasswordLab
                Password
            )
        )
    )
)
