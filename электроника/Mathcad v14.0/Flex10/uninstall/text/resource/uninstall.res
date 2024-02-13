!==========================================================================
!
!  File Name:  uninstall.res
!
!  Date      Release     Name    Ver.    Comments
!  --------- ---------   -----   -----   ----------------------------------
!  26-Aug-98 H-03-54     TWH     $$1     Created.
!  12-Mar-01 J-01-29     MAZ     $$2     Use setup bitmap (SPR 811663)
!  06-May-02 J-01-45     ALG     $$3     SPR 945372: Spc btwn Username/InstDate
!  18-Oct-02             ALG             Move instdateLab to its own row
!  18-Oct-02 J-03-36     ALG     $$4     Set TextArea1.MaxLen to 1000
!
!==========================================================================

(Dialog uninstall
    (Components
        (SubLayout                      Layout1)
        (StdButton                      StdButton1)
        (StdButton                      StdButton2)
    )

    (Resources
        (StdButton1.Label               "Uninstall")
        (StdButton2.Label               "Cancel")
        (.Bitmap                        "setup")
        (.Label                         "PTC Uninstall")
        (.DefaultButton                 "StdButton1")
        (.Layout
            (Grid (Rows 1) (Cols 1)
                Layout1
            )
        )
    )
)

(Layout Layout1
    (Components
        (SubLayout                      Layout2)
        (TextArea                       TextArea1)
    )

    (Resources
        (TextArea1.Rows                 12)
        (TextArea1.Columns              30)
        (TextArea1.MaxLen               1000)
        (TextArea1.Editable             False)
        (TextArea1.Wrap                 True)
        (TextArea1.BackgroundColor      15)
        (TextArea1.ScrollBarPosition    6)
        (TextArea1.CaretVisible         False)
        (.Layout
            (Grid (Rows 1 1) (Cols 1)
                Layout2
                TextArea1
            )
        )
    )
)

(Layout Layout2
    (Components
        (SubLayout                      Row1Layout)
        (SubLayout                      Row2Layout)
        (SubLayout                      Row3Layout)
    )

    (Resources
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.Layout
            (Grid (Rows 1 1 1) (Cols 1)
                Row1Layout
                Row2Layout
                Row3Layout
            )
        )
    )
)

(Layout Row1Layout
    (Components
        (Label                          productLab)
        (Label                          releaseLab)
        (Label                          datecodeLab)
    )

    (Resources
        (productLab.AttachLeft          True)
        (productLab.AttachRight         True)
        (productLab.AttachTop           True)
        (productLab.AttachBottom        True)
        (productLab.Alignment           0)
        (productLab.TopOffset           5)
        (productLab.LeftOffset          5)
        (productLab.RightOffset         5)
        (releaseLab.AttachLeft          True)
        (releaseLab.AttachRight         True)
        (releaseLab.AttachTop           True)
        (releaseLab.AttachBottom        True)
        (releaseLab.TopOffset           5)
        (releaseLab.LeftOffset          5)
        (releaseLab.RightOffset         5)
        (datecodeLab.AttachLeft         True)
        (datecodeLab.AttachRight        True)
        (datecodeLab.AttachTop          True)
        (datecodeLab.AttachBottom       True)
        (datecodeLab.Alignment          1)
        (datecodeLab.TopOffset          5)
        (datecodeLab.LeftOffset         5)
        (datecodeLab.RightOffset        5)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.Layout
            (Grid (Rows 1) (Cols 1 1 1)
                productLab
                releaseLab
                datecodeLab
            )
        )
    )
)

(Layout Row2Layout
    (Components
        (Label                          ownerLab)
    )

    (Resources
        (ownerLab.AttachLeft            True)
        (ownerLab.AttachRight           True)
        (ownerLab.AttachTop             True)
        (ownerLab.AttachBottom          True)
        (ownerLab.Alignment             0)
        (ownerLab.TopOffset             5)
        (ownerLab.LeftOffset            5)
        (ownerLab.RightOffset           5)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                ownerLab
            )
        )
    )
)

(Layout Row3Layout
    (Components
        (Label                          instdateLab)
    )

    (Resources
        (instdateLab.AttachLeft         True)
        (instdateLab.AttachRight        True)
        (instdateLab.AttachTop          True)
        (instdateLab.AttachBottom       True)
        (instdateLab.Alignment          0)
        (instdateLab.TopOffset          5)
        (instdateLab.BottomOffset       5)
        (instdateLab.LeftOffset         5)
        (instdateLab.RightOffset        5)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                instdateLab
            )
        )
    )
)
