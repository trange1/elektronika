!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  PAS properties screen
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  15-Mar-00           TWH          Created.
!  17-Mar-00 I-03-28+  JJE   $$1    Group Submission
!  06-Jun-00 I-03-28+  TWH   $$2    Order True before False for RadioGroup
!  13-Sep-00 J-01-18   TWH   $$3    Hide RevisionMap
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout scr_pasprop
    (Components
        (SubLayout                      scr_pasprop2)
        (TextArea                       TextArea)
        (Label                          Label2)
        (Label                          Label1)
        (Label                          Label3)
        (Label                          Label4)
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
            (Grid (Rows 1) (Cols 1 0 1)
                Label1
                (Grid (Rows 1 0 0 1) (Cols 0)
                    Label4
                    TextArea
                    scr_pasprop2
                    Label2
                )
                Label3
            )
        )
    )
)

(Layout scr_pasprop2
    (Components
        (InputPanel                     Hostname)
        (Label                          HostnameLab)
        (InputPanel                     WebUrl)
        (Label                          WebUrlLab)
        (InputPanel                     Servlet)
        (Label                          ServletLab)
        (InputPanel                     Port)
        (Label                          PortLab)
        (Label                          RevisionMapLab)
        (RadioGroup                     RevisionMap)
        (RadioGroup                     LogFile)
        (Label                          LogFileLab)
    )

    (Resources
        (Hostname.MaxLen                255)
        (Hostname.AutoHighlight         True)
        (HostnameLab.Label              "Fully Qualified Hostname")
        (HostnameLab.AttachRight        True)
        (HostnameLab.Alignment          1)
        (WebUrl.MaxLen                  255)
        (WebUrl.AutoHighlight           True)
        (WebUrl.Visible                 False)
        (WebUrlLab.Label                "Web server alias")
        (WebUrlLab.AttachRight          True)
        (WebUrlLab.Alignment            1)
        (WebUrlLab.Visible              False)
        (Servlet.MaxLen                 255)
        (Servlet.AutoHighlight          True)
        (Servlet.Visible                False)
        (ServletLab.Label               "Servlet engine alias")
        (ServletLab.AttachRight         True)
        (ServletLab.Alignment           1)
        (ServletLab.Visible             False)
        (Port.MaxLen                    255)
        (Port.Integer                   1099)
        (Port.InputType                 2)
        (Port.AutoHighlight             True)
        (PortLab.Label                  "Port number")
        (PortLab.AttachRight            True)
        (PortLab.Alignment              1)
        (RevisionMapLab.Label           "Revision mapping ?")
        (RevisionMapLab.AttachRight     True)
        (RevisionMapLab.Alignment       1)
        (RevisionMapLab.Visible         False)
        (RevisionMap.Names              "1"
                                        "0")
        (RevisionMap.Labels             "True"
                                        "False")
        (RevisionMap.Visible            False)
        (LogFile.Names                  "1"
                                        "0")
        (LogFile.Labels                 "True"
                                        "False")
        (LogFileLab.Label               "Logfile ?")
        (LogFileLab.AttachRight         True)
        (LogFileLab.Alignment           1)
        (.Label                         "PAS Configuration Properties")
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
            (Grid (Rows 1 1 1 1 1 1) (Cols 1 1)
                HostnameLab
                Hostname
                WebUrlLab
                WebUrl
                ServletLab
                Servlet
                PortLab
                Port
                RevisionMapLab
                RevisionMap
                LogFileLab
                LogFile
            )
        )
    )
)
