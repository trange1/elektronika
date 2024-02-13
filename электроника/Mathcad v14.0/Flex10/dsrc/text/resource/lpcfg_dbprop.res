!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  lpcfg_dbprop.res
! 
!  Windchill Oracle properties screen
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  23-Mar-99           JJE          Created
!  11-May-99 I-03-09   JJE     1    Group Submission
!  19-Aug-99           JJE          Remove the hostname field 
!                                   Add OracleHome
!  24-Aug-99 I-03-13   JJE     2    Group Submission
!  16-Sep-99           JJE          Reorder some elements
!  21-Sep-99 I-03-15   JJE     3    Group Submission
!  08-Mar-00           JJE          Move from scr_ to lpcfg_
!  17-Mar-00 I-03-28+  JJE   $$1    Group Submission
!  12-May-00           JJE          Change label of ora
!  15-May-00 I-03-28+  JJE   $$2    Group Submission
!  01-Feb-02 J-01-42   MAZ   $$3    Remove Oracle Home field (SPR 907377)
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout lpcfg_dbprop
    (Components
        (SubLayout                      lpcfg_dbprop2)
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
                lpcfg_dbprop2
                Label1
            )
        )
    )
)

(Layout lpcfg_dbprop2
    (Components
        (InputPanel                     UserName)
        (Label                          UserNameLab)
        (InputPanel                     UserPass)
        (Label                          UserPassLab)
        (InputPanel                     ServiceName)
        (Label                          ServiceNameLab)
    )

    (Resources
        (UserName.MaxLen                255)
        (UserName.AutoHighlight         True)
        (UserNameLab.Label              "Windchill Database Username")
        (UserNameLab.AttachRight        True)
        (UserNameLab.Alignment          1)
        (UserPass.MaxLen                255)
        (UserPass.Password              True)
        (UserPass.AutoHighlight         True)
        (UserPassLab.Label              "Windchill Database User Password")
        (UserPassLab.AttachRight        True)
        (UserPassLab.Alignment          1)
        (ServiceName.MaxLen             255)
        (ServiceName.AutoHighlight      True)
        (ServiceNameLab.Label           "Oracle Database JDBC Connection")
        (ServiceNameLab.AttachRight     True)
        (ServiceNameLab.Alignment       1)
        (.Label                         "Oracle Database Settings")
        (.Decorated                     True)
        (.AttachTop                     True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1 1) (Cols 1 1)
                UserNameLab
                UserName
                UserPassLab
                UserPass
                ServiceNameLab
                ServiceName
            )
        )
    )
)
