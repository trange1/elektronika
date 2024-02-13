!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
!
! chg_cd.res
!
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  14-Aug-00 J-01-15   MYA   $$1    Created
!  23-Mar-01 J-01-30   TWH   $$2    .Bitmap = "setup"
!  30-Sep-02 J-03-35   JJE   $$3    Default button is OK
!  01-Mar-04 K-01-24   TWH          NakedWindow for NT cd chg listener
!  01-Mar-04 K-01-24   TWH   $$4    Add AlwaysAbove
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Dialog chg_cd
    (Components
        (StdButton                      StdOk)
        (StdButton                      StdCancel)
        (SubLayout                      Layout1)
    )

    (Resources
        (StdOk.Label                    "Ok")
        (StdCancel.Label                "Cancel")
        (.Bitmap                        "setup")
        (.Label                         "Insert a new CD")
        (.DefaultButton                 "StdOk")
        (.AlwaysAbove                   "ptcsetup")
        (.Layout
            (Grid (Rows 1) (Cols 1)
                Layout1
            )
        )
    )
)

(Layout Layout1
    (Components
        (Label                          ChgCDText)
        (InputPanel                     DevicePath)
        (PushButton                     DevicePathBrowse)
        (NakedWindow                    listener)
    )

    (Resources
        (ChgCDText.Label                "PTC/Setup can not find the required CD from this path. Either
the CDROM is not responding or the CD you inserted is incorrect.
Input a correct path to the CD and press OK to retry or Cancel
to abort PTC/Setup.")
        (ChgCDText.Columns              50)
        (ChgCDText.AttachLeft           True)
        (ChgCDText.AttachRight          True)
        (ChgCDText.AttachTop            True)
        (ChgCDText.AttachBottom         True)
        (ChgCDText.Alignment            0)
        (ChgCDText.Resizeable           True)
        (ChgCDText.TopOffset            10)
        (ChgCDText.BottomOffset         10)
        (ChgCDText.LeftOffset           10)
        (ChgCDText.RightOffset          10)
        (DevicePath.Columns             10)
        (DevicePath.MaxLen              260)
        (DevicePath.AttachTop           True)
        (DevicePath.AttachBottom        True)
        (DevicePath.TopOffset           10)
        (DevicePath.BottomOffset        10)
        (DevicePath.LeftOffset          10)
        (DevicePath.RightOffset         10)
        (DevicePathBrowse.Label         "Browse")
        (DevicePathBrowse.AttachRight   True)
        (DevicePathBrowse.RightOffset   10)
        (listener.Visible               False)
        (.Layout
            (Grid (Rows 1 1 1) (Cols 1 1)
                ChgCDText
                (Pos 2 1)
                DevicePath
                DevicePathBrowse
                listener
            )
        )
    )
)

