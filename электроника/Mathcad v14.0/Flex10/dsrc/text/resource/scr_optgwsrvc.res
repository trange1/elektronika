!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  scr_optgwsrvc.res
! 
!  Optegra Gateway Service properties screen
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  18-Apr-00           MAZ          Created
!  26-Apr-00 I-03-28+  JJE          Group Submission
!  02-May-00           MAZ          SPR 821397, rm browse btns and change labels
!  05-May-00 I-03-28+  JJE   $$1    Group Submission
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout scr_optgwsrvc
    (Components
        (SubLayout                      scr_optgwsrvc2)
        (TextArea                       TextArea)
        (Label                          Label1)
    )

    (Resources
        (TextArea.Rows                  8)
        (TextArea.Columns               25)
        (TextArea.MaxLen                200)
        (TextArea.Editable              False)
        (TextArea.Decorated             False)
        (TextArea.AttachLeft            False)
        (TextArea.AttachRight           False)
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
            (Grid (Rows 0 0 1) (Cols 1)
                TextArea
                scr_optgwsrvc2
                Label1
            )
        )
    )
)

(Layout scr_optgwsrvc2
    (Components
        (InputPanel                     LogFile)
        (Label                          LogFileLab)
        (InputPanel                     CabinetPath)
        (Label                          CabinetPathLab)
    )

    (Resources
        (LogFile.MaxLen                 255)
        (LogFile.AutoHighlight          True)
        (LogFileLab.Label               "Trace Filename")
        (LogFileLab.AttachRight         True)
        (LogFileLab.Alignment           1)
        (CabinetPath.MaxLen             255)
        (CabinetPath.AutoHighlight      True)
        (CabinetPathLab.Label           "Windchill Cabinet/Folder Name")
        (CabinetPathLab.AttachRight     True)
        (CabinetPathLab.Alignment       1)
        (.Label                         "Optegra Gateway Service Settings")
        (.Decorated                     True)
        (.AttachTop                     True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1) (Cols 1 1)
                LogFileLab
                LogFile
                CabinetPathLab
                CabinetPath
            )
        )
    )
)
