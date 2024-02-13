!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  ps.res
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  16-Feb-99 I-03-02   JJE   $$1    Group submission
!  04-Mar-99           TWH          Add ScreenFlexIntro, ScreenFlexFW
!  15-Mar-99           MYA          Add Pholder ScreenAppMgr
!  12-Mar-99           JJE          Add ScreenWtProp
!  24-Mar-99           JJE          Add DbProp and IlGate
!  26-Mar-99           JJE          Snazzy changes
!  01-Apr-99           MYA          Chg Res for LpcfgMechfeat       
!  16-Apr-99           MYA          Add ScreenWebPub 
!  23-Apr-99           TWH          Add ScreenFlexCk
!  30-Apr-99           TWH          Add LpcfgFlexCfg
!  07-May-99           MPY          Add LpcfgMechI, LpcfgAppmgr
!  11-May-99 I-03-09   JJE   $$2    Group Submission
!  25-May-99           TWH          Add LpcfgWeblink
!  07-Jun-99 I-03-10   JJE   $$3    Group Submission
!  09-Sep-99           JJE          Add ScreenWpcfg
!  13-Sep-99 I-03-14+  JJE   $$4    Group Submission
!  21-Sep-99           JJE          Unknown
!  21-Sep-99 I-03-15   JJE   $$5    Group Submission
!  18-Oct-99           JJE          Add erb prop screen
!  22-Oct-99 I-03-18+  JJE   $$6    Group Submission
!  22-Nov-99           MYA          Add pdm
!  23-Nov-99 I-03-22   JJE   $$7    Group Submission
!  03-Nov-99           JJE          Add licagree
!  07-Dec-99 I-03-23   JJE   $$8    Group Submission
!  11-Jan-99           JJE          Add Msi Screen
!  12-Jan-00 I-03-26+  JJE   $$9    Group Submission
!  08-Feb-00           JJE          Add setup bitmap
!  09-Feb-00 I-03-26+  JJE          Group Submission
!  14-Feb-00           TWH          Add ScreenVault,Dbssvr,Migrate
!  14-Feb-00           TWH          Add ScreenDataserver,LpcfgOrapwd
!  24-Feb-00 I-03-27+  TWH   $$10   Group Submission
!  10-Mar-00           TWH          Add ScreenPasProp
!  17-Mar-00 I-03-28+  JJE   $$11   Group Submission
!  15-Mar-00           MAZ          Add three IE screens
!  20-Mar-00           JJE          Add LpcfgDcadCmd
!  21-Mar-00           MAZ          Add ScreenServlet
!  28-Mar-00           TWH          Drop ScreenFlexFW
!  28-Mar-00 I-03-28+  TWH   $$12   Group Submission
!  10-Apr-00 I-03-28+  TWH   $$13   Add ScreenJava, LpcfgOraprops
!  10-Apr-00 I-03-28+  JJE          Group Submission
!  17-Apr-00           MYA          Add ScreenNetscape
!  18-Apr-00           JJE          Add ScreenMakeJar
!  19-Apr-00 I-03-28+  JJE          Group Submission
!  19-Apr-00           MAZ          Add ScreenIEOpt, ScreenOptGWSrvc, ScreenOptIEAdpt
!  26-Apr-00 I-03-28+  JJE   $$14   Group Submission
!  20-Sep-00 J-01-19   MAZ   $$15   Add 5.1 panels LpcfgOptIEWeb & LpcfgOptWGS
!  10-Oct-00           MAZ          Add LpcfgWGS
!  18-Oct-00           TWH          Add 5.1 screens RosettaNet, RNadptr
!  10-Oct-00           JJE          Add ScreenWSConfig
!  18-Oct-00 J-01-20   JJE   $$16   Group Submission
!  17-Nov-00           JJE          Set F1 to launch the help system
!  30-Nov-00 J-01-22   JJE   $$17   Group Submission
!  04-Jan-01 J-01-25   TWH   $$18   Add DebugLayout
!  19-Jan-01 J-01-26   TWH   $$19   Hide DebugLayout awaiting UI fix for NT
!  01-Mar-01 J-01-26+  TWH   $$20   Add iascfg
!  21-Mar-01 J-01-30   MAZ   $$21   Add ScreenLDAP
!  13-Apr-01 J-01-32+  MAZ   $$22   Drop ScreenIEServer & WGS lpcfgs
!  25-May-01 J-01-33+  ALG   $$23   Add ScreenOrga
!  06-Nov-01 J-01-39   MAZ   $$24   Add ScreenDbProp
!  10-Dec-01 J-03-14   MAZ   $$25   Add ScreenUDDI and ScreenPartsLink
!  12-Feb-02 J-03-19   JJE   $$26   Use embedded html component
!  18-Mar-02           TWH          Add LpcfgMS_SS
!  18-Mar-02 J-03-21   JJE   $$27   Add sash and enable resize
!  24-Apr-02 J-03-24   MAZ   $$28   Add LpcfgConfServer
!  01-May-02 J-03-25   MAZ   $$29   Add LpcfgRNProp and ScreenOracleEdition
!  15-Jul-02 J-03-29   MAZ   $$30   Add ScreenWcOCU and ScreenRNProp
!  14-Nov-02 J-03-37+  JJE   $$31   Make next and back regular buttons
!  12-Nov-02 J-03-40   MAZ   $$32   Add ScreenStudentLic
!  04-Mar-03 K-01-04   TWH          Move main dialog into ptcsetup.res
!  04-Mar-03 K-01-06   TWH   $$33   This is now just the splash dialog
!  02-Jun-03 K-01-07+  TWH          Chg splash gif name
!  02-Jun-03 K-01-07+  TWH   $$34   Chg to App starting cursor
!  23-Jun-03 K-01-09   TWH   $$35   Set resizeable false
!  25-Aug-03 K-01-13   TWH   $$36   fix image names
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Dialog ps
    (Components
        (SubLayout                      Layout1)
        (CascadeButton                  CascadeButton2
                                        MenuPane3)
    )

    (Resources
        (CascadeButton2.Selected_image  "cascade_select_item")
        (CascadeButton2.Unselected_image "cascade_select_item")
        (.Label                         "PTC.Setup")
        (.DialogStyle                   4)
        (.Resizeable                    False)
        (.Cursor                        "UI app starting cursor image")
        (.TitleBar                      False)
        (.TitleBarImage                 "PTC small logo image")
        (.AlwaysOnTop                   True)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                Layout1
            )
        )
    )
)

(Layout Layout1
    (Components
        (Label                          Label1)
        (Label                          Label2)
        (ProgressBar                    ProgressBar1)
    )

    (Resources
        (Label1.Bitmap                  "ptcsetup_splash.gif")
        (Label1.AttachLeft              True)
        (Label1.AttachRight             True)
        (Label1.AttachTop               True)
        (Label1.AttachBottom            True)
        (Label2.Label                   "Initializing PTC.Setup ...")
        (Label2.Visible                 False)
        (Label2.AttachLeft              True)
        (Label2.AttachTop               True)
        (Label2.AttachBottom            True)
        (Label2.Alignment               0)
        (Label2.Resizeable              True)
        (Label2.ForegroundColor         12)
        (Label2.BottomOffset            3)
        (Label2.LeftOffset              5)
        (Label2.TruncateLabel           False)
        (ProgressBar1.ProgressStyle     0)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.Alignment                     2)
        (.BottomOffset                  5)
        (.Layout
            (Grid (Rows 1 0) (Cols 1 1)
                Label1
                (Pos 2 1)
                ProgressBar1
                Label2
            )
        )
    )
)

(MenuPane MenuPane3
    (Components
        (Label                          DoNotDeleteCascade)
    )

    (Resources
        (DoNotDeleteCascade.AttachLeft  True)
        (DoNotDeleteCascade.AttachRight True)
        (DoNotDeleteCascade.AttachTop   True)
        (DoNotDeleteCascade.AttachBottom True)
        (DoNotDeleteCascade.BackgroundColor 0)
    )
)
