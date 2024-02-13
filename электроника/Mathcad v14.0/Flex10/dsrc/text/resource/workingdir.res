!----------------------------------------------------------------------
! 05-Dec-97  H-03-32 xw      $$1 Created.
! 15-Sep-98  I-01-20 SCL     $$2 Set .KeyboardInput for tool-style buttons
!----------------------------------------------------------------------
(Dialog workingdir
    (Components
        (PushButton                     workingdir_pb)
    )

    (Resources
        (workingdir_pb.Bitmap           "wrking_dir")
	(workingdir_pb.ButtonStyle      Mixed)
	(workingdir_pb.KeyboardInput    True)
        (workingdir_pb.AttachLeft       True)
        (workingdir_pb.AttachRight      True)
        (workingdir_pb.AttachTop        True)
        (workingdir_pb.AttachBottom     True)
        (workingdir_pb.TopOffset        0)
        (workingdir_pb.BottomOffset     0)
        (workingdir_pb.LeftOffset       0)
        (workingdir_pb.RightOffset      0)
	(workingdir_pb.HelpText         "Working Directory")
        (.Layout
            (Grid (Rows 1) (Cols 1)
                workingdir_pb
            )
        )
    )
)
