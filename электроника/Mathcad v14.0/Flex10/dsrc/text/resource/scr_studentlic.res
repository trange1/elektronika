!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  Pro/Student License screen
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  11-Dec-02 J-03-40   MAZ   $$1    Created
!  21-Jan-03 J-03-40+  MAZ   $$2    Change HyperLink.Label to spec
!  27-Mar-03 J-03-42+  MAZ          Introduce Online Account hyperlink
!  07-Apr-03 K-01-04   MAZ   $$3    Update from J-03
!  26-May-04 K-01-27+  MAZ          SPR 1085537: rearrange student ui 
!  06-Jun-04 K-03-03   MAZ   $$4    Sub to K-03
!  20-Dec-04 K-03-19   MAZ   $$5    New screen layout
!  08-Apr-05 K-03-23   MAZ   $$6    Add onlineModeLab
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout scr_studentlic
    (Components
        (SubLayout                      scr_studentlic2)
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
        (TextArea.Value                 "In the area below, please specify the mode to attain the license for your special edition in order to complete the installation.")
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
                    scr_studentlic2
                    Label2
                )
                Label3
            )
        )
    )
)

(Layout scr_studentlic2
    (Components
        (InputPanel                     StudentLicFile)
        (Label                          StudentLicFileLab)
        (PushButton                     StudentLicFileBrowse)
        (Label                          Label5)
        (PushButton                     autoLicBttn)
        (Label                          Label6)
        (Label                          Label7)
        (Label                          Label8)
        (Label                          onlineModeLab)
    )

    (Resources
        (StudentLicFile.MaxLen          255)
        (StudentLicFile.AutoHighlight   True)
        (StudentLicFileLab.Label        "License File Path")
        (StudentLicFileLab.AttachLeft   True)
        (StudentLicFileLab.Alignment    0)
        (StudentLicFileBrowse.Bitmap    "UI dir open image")
        (StudentLicFileBrowse.AttachLeft True)
        (StudentLicFileBrowse.AttachRight True)
        (Label5.Label                   "A. Automatically generate license file (on-line mode)")
        (Label5.AttachLeft              True)
        (Label5.AttachRight             True)
        (Label5.Alignment               0)
        (autoLicBttn.Label              "Generate License File")
        (autoLicBttn.AttachLeft         True)
        (autoLicBttn.AttachRight        True)
        (autoLicBttn.AttachTop          True)
        (autoLicBttn.AttachBottom       True)
        (Label6.Label                   "B. Browse to local license file (off-line mode)")
        (Label6.AttachLeft              True)
        (Label6.AttachRight             True)
        (Label6.Alignment               0)
        (Label7.AttachLeft              True)
        (Label7.AttachRight             True)
        (Label7.AttachTop               True)
        (Label7.AttachBottom            True)
        (Label8.AttachLeft              True)
        (Label8.AttachRight             True)
        (Label8.AttachTop               True)
        (Label8.AttachBottom            True)
        (onlineModeLab.Label            "This mode requires an internet connection to ptc.com")
        (onlineModeLab.AttachLeft       True)
        (onlineModeLab.AttachRight      True)
        (onlineModeLab.Alignment        0)
        (.Label                         "License Configuration")
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
            (Grid (Rows 1 1 1 1 1) (Cols 1)
                Label5
                onlineModeLab
                (Grid (Rows 1) (Cols 1 1 1)
                    autoLicBttn
                    Label7
                    Label8
                )
                Label6
                (Grid (Rows 1) (Cols 1 1 1)
                    StudentLicFileLab
                    StudentLicFile
                    StudentLicFileBrowse
                )
            )
        )
    )
)
