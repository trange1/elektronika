!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  servlets properties screen
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  21-Mar-00           MAZ          Created
!  28-Mar-00 I-03-28+  JJE   $$1    Group Submission
!  07-Apr-00           MAZ          Add NES 3.6
!  10-Apr-00 I-03-28+  JJE   $$2    Group Submission
!  13-Apr-00           MAZ          Rearrange components
!  19-Apr-00 I-03-28+  JJE          Group Submission
!  05-May-00           MAZ          Change server home to https dir
!  05-May-00 I-03-28+  JJE   $$3    Group Submission
!  10-Oct-00 J-01-20+  DAR   $$4    Add JRrun3.0,Tomcat3.1,Apache,removed NES3.6
!  26-Oct-00 J-01-20+  MAZ   $$5    Modify the ServerHomeLab label
!  31-Jan-01 J-01-32+  DAR   $$6    SPR 864677 Chgd ver # Tomcat and Apache add IIS 5.0
!  23-Oct-01 J-01-38+  MAZ          Rm version numbers (SPR 904975)
!  31-Oct-01 J-03-12   MAZ   $$7    Update from J-01
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout scr_servlet
    (Components
        (SubLayout                      scr_servlet2)
        (TextArea                       TextArea)
        (Label                          Label2)
        (Label                          Label1)
        (Label                          Label3)
        (Label                          Label4)
        (SubLayout                      webserver_layout)
    )

    (Resources
        (TextArea.Rows                  3)
        (TextArea.Columns               25)
        (TextArea.MaxLen                200)
        (TextArea.Editable              False)
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
            (Grid (Rows 1) (Cols 1 1 1)
                Label1
                (Grid (Rows 1 1 1 1 1) (Cols 1)
                    Label4
                    TextArea
                    scr_servlet2
                    webserver_layout
                    Label2
                )
                Label3
            )
        )
    )
)

(Layout scr_servlet2
    (Components
        (Label                          EngineTypeLab)
        (OptionMenu                     ServletType)
        (InputPanel                     EngineDir)
        (Label                          EngineDirLab)
        (PushButton                     EngineDirBrowse)
    )

    (Resources
        (EngineTypeLab.Label            "Servlet Engine Type")
        (EngineTypeLab.AttachRight      True)
        (ServletType.Editable           True)
        (ServletType.VisibleRows        3)
        (ServletType.Names              "jrun"
                                        "tomcat"
                                        "other")
        (ServletType.Labels             "JRun"
                                        "Tomcat"
                                        "Other / Don't auto-configure")
        (EngineDir.MaxLen               255)
        (EngineDir.AutoHighlight        True)
        (EngineDirLab.Label             "Servlet Engine Home Directory")
        (EngineDirLab.AttachRight       True)
        (EngineDirLab.Alignment         1)
        (EngineDirBrowse.Bitmap         "UI dir open image")
        (EngineDirBrowse.AttachLeft     True)
        (EngineDirBrowse.AttachRight    True)
        (EngineDirBrowse.LeftOffset     0)
        (.Label                         "Servlet Engine Configuration")
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
            (Grid (Rows 1 1) (Cols 1 1)
                EngineTypeLab
                ServletType
                EngineDirLab
                (Grid (Rows 1) (Cols 1 0)
                    EngineDir
                    EngineDirBrowse
                )
            )
        )
    )
)

(Layout webserver_layout
    (Components
        (Label                          WebServerLab)
        (InputPanel                     WebServer)
        (Label                          PortLab)
        (InputPanel                     Port)
        (Label                          ServerTypeLab)
        (OptionMenu                     ServerType)
        (Label                          ServerHomeLab)
        (InputPanel                     ServerHome)
        (PushButton                     ServerHomeBrowse)
        (CheckButton                    StopServer)
    )

    (Resources
        (WebServerLab.Label             "Web Server Network Address")
        (WebServerLab.AttachRight       True)
        (WebServerLab.Alignment         1)
        (WebServer.MaxLen               255)
        (WebServer.LeftOffset           10)
        (WebServer.RightOffset          7)
        (WebServer.AutoHighlight        True)
        (PortLab.Label                  "Web Server Port Number")
        (PortLab.AttachRight            True)
        (PortLab.Alignment              1)
        (Port.MaxLen                    255)
        (Port.Integer                   80)
        (Port.MinInteger                0)
        (Port.MaxInteger                999999)
        (Port.MinColumns                0)
        (Port.LeftOffset                10)
        (Port.RightOffset               7)
        (Port.InputType                 2)
        (Port.AutoHighlight             True)
        (ServerTypeLab.Label            "Web Server Type")
        (ServerTypeLab.AttachRight      True)
        (ServerType.MaxLen              64)
        (ServerType.Editable            True)
        (ServerType.Names               "apache"
                                        "iis4"
                                        "iplanet"
                                        "other")
        (ServerType.Labels              "Apache"
                                        "Internet Information Server"
                                        "iPlanet"
                                        "Other")
        (ServerType.LeftOffset          10)
        (ServerType.RightOffset         5)
        (ServerHomeLab.Label            "https Directory Path")
        (ServerHomeLab.AttachRight      True)
        (ServerHomeLab.Alignment        0)
        (ServerHomeLab.Resizeable       True)
        (ServerHomeLab.TruncateLabel    False)
        (ServerHome.MaxLen              255)
        (ServerHome.LeftOffset          10)
        (ServerHome.RightOffset         5)
        (ServerHomeBrowse.Bitmap        "UI dir open image")
        (ServerHomeBrowse.AttachLeft    True)
        (ServerHomeBrowse.AttachRight   True)
        (ServerHomeBrowse.LeftOffset    1)
        (ServerHomeBrowse.RightOffset   5)
        (StopServer.Label               "Stop/Start the server to complete configuration")
        (StopServer.Set                 True)
        (StopServer.AttachLeft          True)
        (StopServer.AttachRight         True)
        (StopServer.LeftOffset          8)
        (.Label                         "Web Server Information")
        (.Decorated                     True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.TopOffset                     15)
        (.Layout
            (Grid (Rows 1 1 1 1 1 1) (Cols 1 1)
                WebServerLab
                WebServer
                (Pos 3 1)
                PortLab
                Port
                ServerTypeLab
                ServerType
                ServerHomeLab
                (Grid (Rows 1) (Cols 1 0)
                    ServerHome
                    ServerHomeBrowse
                )
                (Pos 6 2)
                StopServer
            )
        )
    )
)
