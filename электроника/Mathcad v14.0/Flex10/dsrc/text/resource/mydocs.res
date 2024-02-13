!----------------------------------------------------------------------
! 15-Apr-03  K-01-05 aap     $$1 Created.
! 09-May-03  K-01-07 aap     $$2 Use icon.
!----------------------------------------------------------------------
(Dialog mydocs
    (Components
        (PushButton                     mydocs_pb)
    )

    (Resources
        (mydocs_pb.Bitmap           "my_documents")
	(mydocs_pb.ButtonStyle      Mixed)
	(mydocs_pb.KeyboardInput    True)
        (mydocs_pb.AttachLeft       True)
        (mydocs_pb.AttachRight      True)
        (mydocs_pb.AttachTop        True)
        (mydocs_pb.AttachBottom     True)
        (mydocs_pb.TopOffset        0)
        (mydocs_pb.BottomOffset     0)
        (mydocs_pb.LeftOffset       0)
        (mydocs_pb.RightOffset      0)
	(mydocs_pb.HelpText         "My Documents")
        (.Layout
            (Grid (Rows 1) (Cols 1)
                mydocs_pb
            )
        )
    )
)
