!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  WPC properties screen
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  09-Sep-99           JJE          Created
!  13-Sep-99           JJE          Add field for java class name
!  13-Sep-99 I-03-14+  JJE   $$1    Group Submission
!  21-Sep-99           JJE          Unknown
!  21-Sep-99 I-03-15   JJE   $$2    Group Submission
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout scr_wpcfg
    (Components
        (SubLayout                      scr_wpcfg2)
        (TextArea                       TextArea)
        (Label                          Label2)
        (Label                          Label1)
        (Label                          Label3)
        (Label                          Label4)
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
                (Grid (Rows 1 0 0 1) (Cols 0)
                    Label4
                    TextArea
                    scr_wpcfg2
                    Label2
                )
                Label3
            )
        )
    )
)

(Layout scr_wpcfg2
    (Components
        (InputPanel                     JavaClassPart)
        (Label                          JavaClassPartLab)
        (InputPanel                     OrdGenAlias)
        (Label                          OrdGenAliasLab)
    )

    (Resources
        (JavaClassPart.MaxLen           255)
        (JavaClassPart.AutoHighlight    True)
        (JavaClassPartLab.Label         "Java class name for variant parts")
        (JavaClassPartLab.AttachRight   True)
        (JavaClassPartLab.Alignment     1)
        (OrdGenAlias.MaxLen             255)
        (OrdGenAlias.AutoHighlight      True)
        (OrdGenAliasLab.Label           "Order Generator Alias")
        (OrdGenAliasLab.AttachRight     True)
        (OrdGenAliasLab.Alignment       1)
        (.Label                         "Windchill Product Configurator Properties")
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
            (Grid (Rows 1 1 ) (Cols 1 1)
                JavaClassPartLab
                JavaClassPart
                OrdGenAliasLab
                OrdGenAlias
            )
        )
    )
)
