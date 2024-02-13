!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  scr_winupdate.res
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  29-Apr-03 K-01-06   TWH   $$1    Created.
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout scr_winupdate
    (Components
        (Label                          Label2)
        (Label                          Label3)
        (SubLayout                      Layout1)
        (Label                          Label7)
        (Label                          Label8)
    )

    (Resources
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.Layout
            (Grid (Rows 1 0 1) (Cols 1 0 1)
                (Pos 1 2)
                Label7
                (Pos 2 1)
                Label2
                Layout1
                Label3
                (Pos 3 2)
                Label8
            )
        )
    )
)

(Layout Layout1
    (Components
        (Label                          Label1)
        (Label                          Datecode)
        (Label                          Label5)
        (Label                          ProductLab)
        (OptionMenu                     OptionMenu1)
    )

    (Resources
        (Label1.Label                   "Datecode:")
        (Label1.AttachRight             True)
        (Label1.Alignment               1)
        (Label1.RightOffset             3)
        (Datecode.AttachLeft            True)
        (Datecode.Alignment             0)
        (Datecode.LeftOffset            3)
        (Label5.Label                   "Previous Install Locations:")
        (Label5.AttachRight             True)
        (Label5.RightOffset             3)
        (ProductLab.AttachLeft          True)
        (ProductLab.AttachRight         True)
        (OptionMenu1.LeftOffset         3)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.Layout
            (Grid (Rows 1 1) (Cols 1)
                ProductLab
                (Grid (Rows 1 1) (Cols 1 1)
                    Label1
                    Datecode
                    Label5
                    OptionMenu1
                )
            )
        )
    )
)
