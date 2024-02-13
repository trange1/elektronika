!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  scr_iascfg.res
! 
!  Intralink application server config screen
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  08-Jan-01 J-01-25   TWH   $$1    Created
!  19-Mar-01 J-01-26+  TWH   $$2    Modify component names
!  20-Nov-01 J-01-39+  TWH   $$3    hide license components
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout scr_iascfg
    (Components
        (SubLayout                      scr_iascfg2)
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
        (TextArea.AttachTop             False)
        (TextArea.AttachBottom          False)
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
                scr_iascfg2
                Label1
            )
        )
    )
)

(Layout scr_iascfg2
    (Components
        (InputPanel                     CommPort)
        (Label                          CommPortLab)
        (Label                          FeatureLab)
        (InputPanel                     Feature)
        (Label                          LogFileLab)
        (InputPanel                     LogFile)
        (PushButton                     LogFileBrowse)
        (PushButton                     FeatureModify)
        (Label                          TimeoutLab)
        (InputPanel                     Timeout)
    )

    (Resources
        (CommPort.MaxLen                256)
        (CommPort.Integer               8081)
        (CommPort.MinInteger            1)
        (CommPort.InputType             2)
        (CommPort.AutoHighlight         True)
        (CommPortLab.Label              "Communication port number")
        (CommPortLab.AttachRight        True)
        (CommPortLab.Alignment          1)
        (FeatureLab.Label               "License feature name")
        (FeatureLab.AttachRight         True)
        (FeatureLab.Alignment           1)
        (FeatureLab.Visible             False)
        (Feature.AutoHighlight          True)
        (Feature.Visible                False)
        (LogFileLab.Label               "File to store server log files")
        (LogFileLab.AttachRight         True)
        (LogFileLab.Alignment           1)
        (LogFile.MaxLen                 256)
        (LogFileBrowse.Bitmap           "UI dir open image")
        (LogFileBrowse.AttachLeft       True)
        (LogFileBrowse.AttachRight      True)
        (LogFileBrowse.LeftOffset       0)
        (FeatureModify.Label            "Modify")
        (FeatureModify.Visible          False)
        (TimeoutLab.Label               "Idle Timeout (minutes)")
        (TimeoutLab.AttachRight         True)
        (TimeoutLab.Alignment           1)
        (Timeout.Integer                60)
        (Timeout.MinInteger             0)
        (Timeout.InputType              2)
        (.Label                         "Application Server Settings")
        (.Decorated                     True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1 1 1) (Cols 1 1 0)
                FeatureLab
                Feature
                FeatureModify
                CommPortLab
                CommPort
                (Pos 3 1)
                TimeoutLab
                Timeout
                (Pos 4 1)
                LogFileLab
                LogFile
                LogFileBrowse
            )
        )
    )
)
