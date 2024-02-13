!----------------------------------------------------------------------
!
! Button "New Directory" (for dialogs like Save As ...)
!
! 25-Feb-99  I-03-04  dvs  $$1  created
! 24-Jan-02  J-03-18  HMR  $$2  Flattened button.
!
!----------------------------------------------------------------------

(Dialog newdirectory
    (Components
        (PushButton                     newdirectory_pb)
    )

    (Resources
        (newdirectory_pb.Bitmap           "new_dir")
        (newdirectory_pb.ButtonStyle      3)
        (newdirectory_pb.KeyboardInput    True)
        (newdirectory_pb.AttachLeft       True)
        (newdirectory_pb.AttachRight      True)
        (newdirectory_pb.AttachTop        True)
        (newdirectory_pb.AttachBottom     True)
        (newdirectory_pb.TopOffset        0)
        (newdirectory_pb.BottomOffset     0)
        (newdirectory_pb.LeftOffset       0)
        (newdirectory_pb.RightOffset      0)
        (newdirectory_pb.HelpText         "New Directory")
        (.Layout
            (Grid (Rows 1) (Cols 1)
                newdirectory_pb
            )
        )
    )
)
