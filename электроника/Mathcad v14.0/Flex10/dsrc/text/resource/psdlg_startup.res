!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  psdlg_startup.res
! 
!  psdlg_startup UI dialog
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  23-Aug-00 J-01-15   JJE   $$1    Group Submission
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Dialog psdlg_startup
    (Components
        (GifWindow                      StartupGif)
        (ProgressBar                    StartupProgress)
        (Label                          StartupLab)
    )

    (Resources
        (StartupGif.Decorated           False)
        (StartupGif.AttachTop           True)
        (StartupGif.TopOffset           10)
        (StartupGif.LeftOffset          10)
        (StartupGif.RightOffset         10)
        (StartupGif.GifImage            "ptcsetup_sm.gif")
        (StartupProgress.AttachLeft     True)
        (StartupProgress.AttachRight    True)
        (StartupProgress.Integer        0)
        (StartupProgress.MinInteger     0)
        (StartupProgress.MaxInteger     100)
        (StartupProgress.BottomOffset   10)
        (StartupProgress.LeftOffset     10)
        (StartupProgress.RightOffset    10)
        (StartupLab.Label               "Initializing PTC.Setup, please wait...")
        (StartupLab.AttachLeft          True)
        (StartupLab.AttachRight         True)
        (StartupLab.AttachTop           True)
        (StartupLab.AttachBottom        True)
        (StartupLab.TopOffset           5)
        (StartupLab.BottomOffset        5)
        (StartupLab.LeftOffset          10)
        (StartupLab.RightOffset         10)
        (.Label                         "Initializing PTC.Setup")
        (.DialogStyle                   6)
        (.Resizeable                    False)
        (.TitleBar                      False)
        (.Layout
            (Grid (Rows 0 1 1) (Cols 1)
                StartupGif
                StartupLab
                StartupProgress
            )
        )
    )
)
