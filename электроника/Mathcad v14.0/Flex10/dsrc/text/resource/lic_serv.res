!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  lic_serv.res
! 
!  License server input
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  16-Feb-99 I-03-02   JJE   $$1    Group submission
!  25-Mar-99           JJE          Add some breathing space
!  30-Apr-99           JJE          Use image instead of Browse
!  05-May-99           JJE          Increase size of text areas
!  11-May-99 I-03-09   JJE   $$2    Group Submission
!  14-May-99           TWH          use "Locked license file"
!  07-Jun-99 I-03-10   JJE   $$3    Group Submission
!  11-Nov-99           JJE          Fix tab order of triad screen
!  16-Nov-99 I-03-21   JJE   $$4    Group Submission
!  01-Mar-00           MYA          Set Maxlen of FilePathInput to 260
!  28-Mar-00 I-03-28+  TWH   $$5    Group Submission
!  03-Jan-03 J-03-40   ALG   $$6    Rearrange comps
!  29-Apr-03 K-01-06   TWH   $$7    Set Focus
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout lic_serv
    (Components
        (RadioGroup                     ServTypeGroup)
        (Tab                            ServTypeTab
                                        SingleServLayout
                                        TriadServLayout
                                        LicFileLayout)
    )

    (Resources
        (ServTypeGroup.Orientation      True)
        (ServTypeGroup.AttachLeft       False)
        (ServTypeGroup.AttachRight      False)
        (ServTypeGroup.AttachTop        False)
        (ServTypeGroup.Names            "1"
                                        "2"
                                        "3")
        (ServTypeGroup.Labels           "Single license server"
                                        "Triad license server (fault tolerant)"
                                        "Locked license file (no server running)")
        (ServTypeTab.AttachLeft         False)
        (ServTypeTab.AttachRight        False)
        (ServTypeTab.AttachBottom       False)
        (.Label                         "Simple")
        (.Focus                         "HostnameInput")
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1) (Cols 1)
                ServTypeGroup
                ServTypeTab
            )
        )
    )
)

(Layout SingleServLayout
    (Components
        (InputPanel                     HostnameInput)
        (InputPanel                     PortInput)
        (Label                          Label1)
        (Label                          Label2)
        (Label                          Label3)
        (Label                          FillerLabel1)
    )

    (Resources
        (HostnameInput.Columns          7)
        (HostnameInput.MaxLen           128)
        (PortInput.Columns              6)
        (Label1.Label                   "License Server")
        (Label1.AttachTop               True)
        (Label1.AttachBottom            True)
        (Label2.Label                   "Hostname")
        (Label2.AttachBottom            True)
        (Label2.BottomOffset            0)
        (Label3.Label                   "Port")
        (Label3.AttachBottom            True)
        (Label3.BottomOffset            0)
        (FillerLabel1.AttachLeft        True)
        (FillerLabel1.AttachRight       True)
        (FillerLabel1.AttachTop         True)
        (FillerLabel1.AttachBottom      True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1) (Cols 1)
                (Grid (Rows 1 0) (Cols 1 1 1)
                    (Pos 1 2)
                    Label2
                    Label3
                    Label1
                    HostnameInput
                    PortInput
                )
                FillerLabel1
            )
        )
    )
)

(Layout TriadServLayout
    (Components
        (InputPanel                     TriadHostInput1)
        (InputPanel                     TriadPortInput1)
        (InputPanel                     TriadHostInput2)
        (InputPanel                     TriadPortInput2)
        (InputPanel                     TriadHostInput3)
        (InputPanel                     TriadPortInput3)
        (Label                          Label4)
        (Label                          Label5)
        (Label                          Label6)
        (Label                          Label7)
        (Label                          Label8)
    )

    (Resources
        (TriadHostInput1.Columns        7)
        (TriadHostInput1.MaxLen         128)
        (TriadPortInput1.Columns        6)
        (TriadHostInput2.Columns        7)
        (TriadHostInput2.MaxLen         128)
        (TriadPortInput2.Columns        6)
        (TriadHostInput3.Columns        7)
        (TriadHostInput3.MaxLen         128)
        (TriadPortInput3.Columns        6)
        (Label4.Label                   "Triad partner 1")
        (Label5.Label                   "Hostname")
        (Label5.AttachBottom            True)
        (Label5.BottomOffset            0)
        (Label6.Label                   "Port")
        (Label6.AttachBottom            True)
        (Label6.BottomOffset            0)
        (Label7.Label                   "Triad partner 2")
        (Label8.Label                   "Triad partner 3")
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1 1 1) (Cols 1 1 1)
                (Pos 1 2)
                Label5
                Label6
                Label4
                TriadHostInput1
                TriadPortInput1
                Label7
                TriadHostInput2
                TriadPortInput2
                Label8
                TriadHostInput3
                TriadPortInput3
            )
        )
    )
)

(Layout LicFileLayout
    (Components
        (InputPanel                     FilePathInput)
        (PushButton                     FileBrowse)
        (Label                          Label9)
        (Label                          FillerLabel2)
    )

    (Resources
        (FilePathInput.MaxLen           260)
        (FileBrowse.Bitmap              "UI dir open image")
        (FileBrowse.AttachLeft          True)
        (FileBrowse.AttachRight         True)
        (FileBrowse.AttachTop           True)
        (FileBrowse.AttachBottom        True)
        (FileBrowse.LeftOffset          0)
        (Label9.Label                   "License file path")
        (Label9.AttachLeft              True)
        (Label9.AttachBottom            True)
        (Label9.Alignment               0)
        (Label9.BottomOffset            0)
        (FillerLabel2.AttachLeft        True)
        (FillerLabel2.AttachRight       True)
        (FillerLabel2.AttachTop         True)
        (FillerLabel2.AttachBottom      True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1) (Cols 1)
                (Grid (Rows 1 0) (Cols 1 0)
                    Label9
                    (Pos 2 1)
                    FilePathInput
                    FileBrowse
                )
                FillerLabel2
            )
        )
    )
)
