!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  app_mgr_command.res
! 
!  Appmgr configuration, command selection dialog
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  16-Feb-99 I-03-02   JJE   $$1    Group submission
!  30-Apr-99           JJE          Use image instead of Browse
!  11-May-99 I-03-09   JJE   $$2    Group Submission
!  08-Feb-00           JJE          Add setup bitmap
!  09-Feb-00 I-03-26+  JJE   $$3    Group Submission
!  12-Feb-01 J-01-26+  TWH   $$4    Inc. MaxLen values
!  08-Nov-02           ALG          Set CmdType.VisibleRows to 6
!  08-Nov-02 J-03-37   ALG   $$5    Set .Focus and .DefaultButton
!  07-Oct-03 K-01-16   TWH   $$6    Chg Pro/MECHANICA to MECHANICA
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Dialog app_mgr_command
    (Components
        (OptionMenu                     CmdType)
        (InputPanel                     CmdLabel)
        (InputPanel                     CmdLine)
        (PushButton                     CmdLineBrowse)
        (StdButton                      StdOK)
        (StdButton                      StdCancel)
        (Label                          CmdTypeLab)
        (Label                          CmdLabelLab)
        (Label                          CmdLineLab)
    )

    (Resources
        (CmdType.Editable               True)
        (CmdType.Value                  "Pro/ENGINEER")
        (CmdType.VisibleRows            6)
        (CmdType.Names                  "1"
                                        "2"
                                        "3"
                                        "4"
                                        "5"
                                        "6")
        (CmdType.Labels                 "Pro/ENGINEER"
                                        "Pro/INTRALINK"
                                        "MECHANICA"
                                        "Pro/FLY-THROUGH"
                                        "Other Application"
                                        "Sub Folder")
        (CmdLabel.MaxLen                64)
        (CmdLine.MaxLen                 260)
        (CmdLineBrowse.Bitmap           "UI dir open image")
        (CmdLineBrowse.AttachLeft       True)
        (StdOK.Label                    "&OK")
        (StdCancel.Label                "&Cancel")
        (CmdTypeLab.Label               "Type")
        (CmdTypeLab.AttachRight         True)
        (CmdTypeLab.Alignment           1)
        (CmdLabelLab.Label              "Label")
        (CmdLabelLab.AttachRight        True)
        (CmdLabelLab.Alignment          1)
        (CmdLineLab.Label               "Command line")
        (CmdLineLab.AttachRight         True)
        (CmdLineLab.Alignment           1)
        (.Bitmap                        "setup")
        (.Label                         "Application Manager Configuration")
        (.Focus                         "CmdLabel")
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.DefaultButton                 "StdOK")
        (.Layout
            (Grid (Rows 1 1 1) (Cols 1 1 1)
                CmdTypeLab
                CmdType
                (Pos 2 1)
                CmdLabelLab
                CmdLabel
                (Pos 3 1)
                CmdLineLab
                CmdLine
                CmdLineBrowse
            )
        )
    )
)
