!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  Windchill Info*Engine properties screen
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  09-Mar-00           MAZ          Created
!  28-Mar-00 I-03-28+  JJE   $$1    Group Submission
!  07-Apr-00           MAZ          Rm JVM items
!  10-Apr-00 I-03-28+  JJE   $$2    Group Submission
!  12-Apr-00           JJE          Include Windchill in I*E name
!  13-Apr-00 I-03-28+  JJE   $$3    Group Submission
!  12-Apr-01           DAR          Added Application URL
!  20-Apr-01 J-01-32+  DAR   $$4    Removed NSPortLab and NSPort
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout scr_ieservice
    (Components
        (SubLayout                      scr_ieservice1)
        (SubLayout                      scr_ieservice2)
        (TextArea                       TextArea)
        (Label                          Label2)
        (Label                          Label1)
        (Label                          Label3)
        (Label                          Label4)
        (SubLayout                      scr_ieservice_logs)
    )

    (Resources
        (TextArea.Rows                  3)
        (TextArea.Columns               25)
        (TextArea.MaxLen                200)
        (TextArea.Editable              False)
        (TextArea.Value                 "Specify the Windchill Info*Engine servlet name, naming service and logging options.")
        (TextArea.Decorated             False)
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
            (Grid (Rows 1 1) (Cols 1 0 1)
                Label1
                (Grid (Rows 1 1 1 1 1) (Cols 0)
                    Label4
                    TextArea
                    scr_ieservice1
                    scr_ieservice2
                    scr_ieservice_logs
                )
                Label3
                (Pos 2 2)
                Label2
            )
        )
    )
)

(Layout scr_ieservice1
    (Components
        (Label                          AppURLLab)
        (InputPanel                     AppURL)
    )

    (Resources
        (AppURLLab.Label                "Application URL")
        (AppURLLab.AttachRight          True)
        (AppURLLab.Alignment            1)
        (AppURL.MaxLen                  255)
        (AppURL.Value                   "Windchill")
        (AppURL.AutoHighlight           True)
        (.Label                         "Windchill Info*Engine Servlet Configuration")
        (.Decorated                     True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1) (Cols 1 0)
                AppURLLab
                AppURL
            )
        )
    )
)

(Layout scr_ieservice2
    (Components
        (InputPanel                     Hostname)
        (Label                          HostnameLab)
        (InputPanel                     TempProcPort)
        (Label                          TempProcPortLab)
        (InputPanel                     TaskProcPort)
        (Label                          TaskProcPortLab)
    )

    (Resources
        (Hostname.MaxLen                255)
        (Hostname.AutoHighlight         True)
        (HostnameLab.Label              "Fully Qualified Host Name")
        (HostnameLab.AttachLeft         True)
        (HostnameLab.AttachRight        True)
        (HostnameLab.Alignment          1)
        (TempProcPort.MaxLen            255)
        (TempProcPort.MinInteger        0)
        (TempProcPort.MaxInteger        99999999)
        (TempProcPort.InputType         2)
        (TempProcPort.AutoHighlight     True)
        (TempProcPortLab.Label          "Template Processor Port")
        (TempProcPortLab.AttachRight    True)
        (TempProcPortLab.Alignment      1)
        (TaskProcPort.MaxLen            255)
        (TaskProcPort.MinInteger        0)
        (TaskProcPort.MaxInteger        99999999)
        (TaskProcPort.InputType         2)
        (TaskProcPort.AutoHighlight     True)
        (TaskProcPortLab.Label          "Task Processor Port")
        (TaskProcPortLab.AttachRight    True)
        (TaskProcPortLab.Alignment      1)
        (.Label                         "Windchill Info*Engine Configuration Properties")
        (.Decorated                     True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1 1) (Cols 1 1)
                HostnameLab
                Hostname
                TempProcPortLab
                TempProcPort
                TaskProcPortLab
                TaskProcPort
            )
        )
    )
)

(Layout scr_ieservice_logs
    (Components
        (Label                          LogDirLab)
        (InputPanel                     LogDir)
        (PushButton                     LogDirBrowse)
        (CheckButton                    LogLevel)
    )

    (Resources
        (LogDirLab.Label                "Logs Directory")
        (LogDirLab.AttachRight          True)
        (LogDirLab.Alignment            1)
        (LogDir.MaxLen                  255)
        (LogDir.AutoHighlight           True)
        (LogDirBrowse.Bitmap            "UI dir open image")
        (LogDirBrowse.AttachLeft        True)
        (LogDirBrowse.AttachRight       True)
        (LogDirBrowse.LeftOffset        0)
        (LogLevel.Label                 "Activate All Logging Options?")
        (LogLevel.AttachLeft            True)
        (LogLevel.AttachRight           True)
        (.Label                         "Windchill Info*Engine Logging Options")
        (.Decorated                     True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1) (Cols 1 0)
                LogDirLab
                (Grid (Rows 1) (Cols 0 0)
                    LogDir
                    LogDirBrowse
                )
                (Pos 2 2)
                LogLevel
            )
        )
    )
)
