!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  scr_oracle_edition.res
! 
!  Screen, Oracle Edition 
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  06-May-02 J-01-44+  MAZ   $$1    Group submission
!  20-May-02 J-01-45+  MAZ   $$2    Add Oracle Version Radio Group
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout scr_oracle_edition
    (Components
        (SubLayout                      OracleEd)
        (Label                          Label1)
        (Label                          Label3)
        (Label                          Label4)
        (TextArea                       TextArea)
        (Label                          Label2)
        (SubLayout                      DbVer)
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
                Label1
                (Grid (Rows 1 1 1 1 1) (Cols 0)
                    Label2
                    TextArea
                    DbVer
                    OracleEd
                    Label4
                )
                Label3
            )
        )
    )
)

(Layout OracleEd
    (Components
        (RadioGroup                     OracleEdition)
    )

    (Resources
        (OracleEdition.Orientation      True)
        (OracleEdition.ItemHelpText     "OEE"
                                        "OSE")
        (OracleEdition.AttachTop        False)
        (OracleEdition.AttachBottom     False)
        (OracleEdition.Names            "oee"
                                        "ose")
        (OracleEdition.Labels           "Oracle Enterprise Edition"
                                        "Oracle Standard Edition")
        (OracleEdition.TopOffset        5)
        (OracleEdition.BottomOffset     5)
        (OracleEdition.LeftOffset       5)
        (OracleEdition.RightOffset      5)
        (.Label                         "Oracle Edition Setting")
        (.Focus                         "TextArea")
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
            (Grid (Rows 1) (Cols 1)
                OracleEdition
            )
        )
    )
)

(Layout DbVer
    (Components
        (RadioGroup                     DbVersion)
    )

    (Resources
        (DbVersion.Orientation          True)
        (DbVersion.AttachTop            False)
        (DbVersion.AttachBottom         False)
        (DbVersion.Names                "8i"
                                        "9i")
        (DbVersion.Labels               "Oracle8i"
                                        "Oracle9i")
        (DbVersion.TopOffset            5)
        (DbVersion.BottomOffset         5)
        (DbVersion.LeftOffset           5)
        (DbVersion.RightOffset          5)
        (.Label                         "Oracle Database Version")
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
            (Grid (Rows 1) (Cols 1)
                DbVersion
            )
        )
    )
)
