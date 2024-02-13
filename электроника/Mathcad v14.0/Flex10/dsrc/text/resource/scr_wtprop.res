!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  Windchill properties screen
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  11-Mar-99           JJE          Created
!  30-Apr-99           JJE          Use image instead of Browse
!  11-May-99 I-03-09   JJE   $$1    Group Submission
!  17-Aug-99           JJE          Add servlet alias inputs
!  17-Aug-99 I-03-12+  JJE   $$2    Group Submission
!  19-Aug-99           JJE          Increase MaxLen
!  24-Aug-99 I-03-13   JJE   $$3    Group Submission
!  09-Sep-99           JJE          Add xsl stuff
!  13-Sep-99 I-03-14+  JJE   $$4    Group Submission
!  16-Sep-99           JJE          Change the xsl label
!  20-Sep-99           JJE          Use xslhost for ui tag
!  21-Sep-99 I-03-15   JJE   $$5    Group Submission
!  28-Sep-00           DAR          Removed 3 aliases renamed codebase
!  12-Oct-00 J-01-20+  MAZ   $$6    Rename CodebaseUrl to AppURL
!  23-Oct-00 J-01-20+  JJE   $$7    Make XSL input invisible
!  20-Apr-01 J-01-32+  DAR   $$8    Removed AppURLLab and AppURL
!  11-May-01 J-01-32+  MAZ   $$9    Use Java SDK label
!  22-Jan-02 J-01-41   MAZ   $$10   Make screen generic
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout scr_wtprop
    (Components
        (SubLayout                      scr_wtprop2)
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
        (TextArea.Value                 "In the fields below, specify the appropriate settings for your Windchill server.")
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
                    scr_wtprop2
                    Label2
                )
                Label3
            )
        )
    )
)

(Layout scr_wtprop2
    (Components
        (InputPanel                     Hostname)
        (Label                          HostnameLab)
        (InputPanel                     ServerId)
        (Label                          ServerIdLab)
        (InputPanel                     XSLHost)
        (Label                          XSLHostLab)
        (InputPanel                     JvmHomeDir)
        (Label                          JvmHomeDirLab)
        (PushButton                     JvmHomeDirBrowse)
        (InputPanel                     JvmCommand)
        (Label                          JvmCommandLab)
        (PushButton                     JvmCommandBrowse)
    )

    (Resources
        (Hostname.MaxLen                255)
        (Hostname.AutoHighlight         True)
        (HostnameLab.Label              "Fully Qualified Hostname")
        (HostnameLab.AttachRight        True)
        (HostnameLab.Alignment          1)
        (ServerId.MaxLen                255)
        (ServerId.AutoHighlight         True)
        (ServerIdLab.Label              "Unique Server ID")
        (ServerIdLab.AttachRight        True)
        (ServerIdLab.Alignment          1)
        (XSLHost.Visible                False)
        (XSLHost.MaxLen                 255)
        (XSLHost.AutoHighlight          True)
        (XSLHostLab.Label               "XSL Processor Server Hostname")
        (XSLHostLab.Visible             False)
        (XSLHostLab.AttachRight         True)
        (XSLHostLab.Alignment           1)
        (JvmHomeDir.MaxLen              255)
        (JvmHomeDir.AutoHighlight       True)
        (JvmHomeDirLab.Label            "Java SDK Home Directory")
        (JvmHomeDirLab.AttachRight      True)
        (JvmHomeDirLab.Alignment        1)
        (JvmHomeDirBrowse.Bitmap        "UI dir open image")
        (JvmHomeDirBrowse.AttachLeft    True)
        (JvmHomeDirBrowse.AttachRight   True)
        (JvmHomeDirBrowse.LeftOffset    0)
        (JvmCommand.MaxLen              255)
        (JvmCommand.AutoHighlight       True)
        (JvmCommandLab.Label            "Java Execution Command")
        (JvmCommandLab.AttachRight      True)
        (JvmCommandLab.Alignment        1)
        (JvmCommandBrowse.Bitmap        "UI dir open image")
        (JvmCommandBrowse.AttachLeft    True)
        (JvmCommandBrowse.AttachRight   True)
        (JvmCommandBrowse.LeftOffset    0)
        (.Label                         "Configuration Properties")
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
            (Grid (Rows 1 1 1 1 1) (Cols 1 1 0)
                HostnameLab
                Hostname
                (Pos 2 1)
                ServerIdLab
                ServerId
                (Pos 3 1)
                XSLHostLab
                XSLHost
                (Pos 4 1)
                JvmHomeDirLab
                JvmHomeDir
                JvmHomeDirBrowse
                JvmCommandLab
                JvmCommand
                JvmCommandBrowse
            )
        )
    )
)
