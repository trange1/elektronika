!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
!
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  29-Apr-03 K-01-06   TWH   $$1    Created.
!  19-May-03 K-01-07   TWH   $$2    Change exit label
!  02-Jun-03 K-01-07+  TWH          Drop max btn
!  02-Jun-03 K-01-07+  TWH          Chg menu labels for screen prod
!  02-Jun-03 K-01-07+  JJE   $$3    layout fixes
!  29-Jul-03 K-01-11   TWH   $$4    Mneumonics
!  22-Aug-03 K-01-13   MAZ          Add Help buttons
!  25-Aug-03 K-01-13   TWH          fix SymbolImage names
!  25-Aug-03 K-01-13   TWH   $$5    Tweak banner image components
!  08-Oct-03           MAZ          Make NextBtn Resizeable
!  27-Oct-03 K-01-17   JJE   $$6    Don't spec FontName on Banner_ScreenLabSm
!  14-Apr-05 K-03-23   MAZ   $$7    SPR 1139662: Fix ups buttons alignment
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Dialog ptcsetup
    (Components
        (SubLayout                      Layout4)
        (Label                          Image_Label)
        (SubLayout                      TopLayout)
    )

    (Resources
        (Image_Label.Bitmap             "sample_top_banner.gif")
        (Image_Label.Visible            False)
        (Image_Label.AttachLeft         True)
        (Image_Label.AttachRight        True)
        (Image_Label.AttachTop          True)
        (.Label                         "PTC.Setup")
        (.MinimizeButton                True)
        (.Layout
            (Grid (Rows 0 0 1) (Cols 1)
                TopLayout
                Image_Label
                Layout4
            )
        )
    )
)

(Layout Layout4
    (Components
        (Label                          HelpText)
        (PushButton                     BackBtn)
        (PushButton                     NextBtn)
        (PushButton                     ExitBtn)
        (SubLayout                      MainLayout)
        (SubLayout                      HelpLayout)
        (CascadeButton                  HelpCascadeBtn
                                        MenuPane1)
    )

    (Resources
        (HelpText.AttachRight           True)
        (HelpText.Alignment             0)
        (HelpText.Resizeable            True)
        (HelpText.TopOffset             0)
        (HelpText.BottomOffset          0)
        (HelpText.LeftOffset            0)
        (HelpText.RightOffset           0)
        (BackBtn.Label                  "< Back")
        (BackBtn.Sensitive              False)
        (BackBtn.AttachRight            True)
        (BackBtn.TopOffset              5)
        (BackBtn.BottomOffset           5)
        (BackBtn.RightOffset            5)
        (NextBtn.Label                  "Next >")
        (NextBtn.AttachRight            True)
        (NextBtn.Resizeable             True)
        (NextBtn.TopOffset              5)
        (NextBtn.BottomOffset           5)
        (NextBtn.RightOffset            5)
        (ExitBtn.Label                  "Exit")
        (ExitBtn.AttachRight            True)
        (ExitBtn.KeyboardInput          True)
        (ExitBtn.TopOffset              5)
        (ExitBtn.BottomOffset           5)
        (ExitBtn.RightOffset            5)
        (HelpCascadeBtn.Label           "Help")
        (HelpCascadeBtn.ButtonStyle     3)
        (HelpCascadeBtn.AttachLeft      True)
        (HelpCascadeBtn.TopOffset       5)
        (HelpCascadeBtn.BottomOffset    5)
        (HelpCascadeBtn.LeftOffset      5)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.Layout
            (Grid (Rows 1) (Cols 1 0)
                (Grid (Rows 1 0) (Cols 1)
                    MainLayout
                    (Grid (Rows 0) (Cols 1 1 0 0 0)
                        HelpCascadeBtn
                        HelpText
                        BackBtn
                        NextBtn
                        ExitBtn
                    )
                )
                HelpLayout
            )
        )
    )
)

(Layout MainLayout
    (Components
        (Tab                            ScreensTab
                                        ScreenWelcome
                                        ScreenStudentLic
                                        ScreenLicAgree
                                        ScreenOracleEdition
                                        ScreenProd
                                        ScreenProdFlex
                                        ScreenMsi
                                        ScreenJava
                                        ScreenLicList
                                        ScreenWindows
                                        ScreenDftCmds
                                        ScreenCmdList
                                        ScreenFlexIntro
                                        ScreenFlexCk
                                        ScreenWtProp
                                        ScreenLDAP
                                        ScreenServlet
                                        ScreenIEService
                                        ScreenOptGWSrvc
                                        ScreenOptIEAdpt
                                        ScreenIEOpt
                                        ScreenWpcfg
                                        ScreenErbProp
                                        ScreenIlGate
                                        ScreenCabinet
                                        ScreenLpcfg
                                        ScreenProgress
                                        ScreenAppMgr
                                        ScreenWebPub
                                        ScreenPdmSrvList
                                        ScreenPdmDBList
                                        ScreenPdmPort
                                        ScreenVault
                                        ScreenDbssvr
                                        ScreenMigrate
                                        ScreenDataserver
                                        ScreenWcOCU
                                        ScreenIascfg
                                        ScreenPasProp
                                        ScreenNetscape
                                        ScreenWSConfig
                                        ScreenMakeJar
                                        ScreenRosettaNet
                                        ScreenUDDI
                                        ScreenPartsLink
                                        ScreenRNadptr
                                        ScreenOrga
                                        ScreenRNProp
                                        ScreenDbProp
                                        LpcfgCmdList
                                        LpcfgInterOpt
                                        LpcfgDbProp
                                        LpcfgRNProp
                                        LpcfgOptIEWeb
                                        LpcfgReplication
                                        LpcfgIEBroker
                                        LpcfgLinkpath
                                        LpcfgConfServer
                                        LpcfgOle
                                        LpcfgOraprops
                                        LpcfgOrapwd
                                        LpcfgMS_SS
                                        LpcfgRbm
                                        LpcfgMechfeat
                                        LpcfgMechI
                                        LpcfgDcadCmd
                                        LpcfgProHelp
                                        LpcfgBrowser
                                        LpcfgFlexCfg
                                        LpcfgAppmgr
                                        LpcfgWeblink)
        (PHolder                        ScreenWelcome)
        (PHolder                        ScreenStudentLic)
        (PHolder                        ScreenLicAgree)
        (PHolder                        ScreenOracleEdition)
        (PHolder                        ScreenProd)
        (PHolder                        ScreenProdFlex)
        (PHolder                        ScreenMsi)
        (PHolder                        ScreenJava)
        (PHolder                        ScreenLicList)
        (PHolder                        ScreenWindows)
        (PHolder                        ScreenDftCmds)
        (PHolder                        ScreenCmdList)
        (PHolder                        ScreenFlexIntro)
        (PHolder                        ScreenFlexCk)
        (PHolder                        ScreenWtProp)
        (PHolder                        ScreenLDAP)
        (PHolder                        ScreenServlet)
        (PHolder                        ScreenIEService)
        (PHolder                        ScreenOptGWSrvc)
        (PHolder                        ScreenOptIEAdpt)
        (PHolder                        ScreenIEOpt)
        (PHolder                        ScreenWpcfg)
        (PHolder                        ScreenErbProp)
        (PHolder                        ScreenIlGate)
        (PHolder                        ScreenCabinet)
        (PHolder                        ScreenLpcfg)
        (PHolder                        ScreenProgress)
        (PHolder                        ScreenAppMgr)
        (PHolder                        ScreenWebPub)
        (PHolder                        ScreenPdmSrvList)
        (PHolder                        ScreenPdmDBList)
        (PHolder                        ScreenPdmPort)
        (PHolder                        ScreenVault)
        (PHolder                        ScreenDbssvr)
        (PHolder                        ScreenMigrate)
        (PHolder                        ScreenDataserver)
        (PHolder                        ScreenWcOCU)
        (PHolder                        ScreenIascfg)
        (PHolder                        ScreenPasProp)
        (PHolder                        ScreenNetscape)
        (PHolder                        ScreenWSConfig)
        (PHolder                        ScreenMakeJar)
        (PHolder                        ScreenRosettaNet)
        (PHolder                        ScreenUDDI)
        (PHolder                        ScreenPartsLink)
        (PHolder                        ScreenRNadptr)
        (PHolder                        ScreenOrga)
        (PHolder                        ScreenRNProp)
        (PHolder                        ScreenDbProp)
        (PHolder                        LpcfgCmdList)
        (PHolder                        LpcfgInterOpt)
        (PHolder                        LpcfgDbProp)
        (PHolder                        LpcfgRNProp)
        (PHolder                        LpcfgOptIEWeb)
        (PHolder                        LpcfgReplication)
        (PHolder                        LpcfgIEBroker)
        (PHolder                        LpcfgLinkpath)
        (PHolder                        LpcfgConfServer)
        (PHolder                        LpcfgOle)
        (PHolder                        LpcfgOraprops)
        (PHolder                        LpcfgOrapwd)
        (PHolder                        LpcfgMS_SS)
        (PHolder                        LpcfgRbm)
        (PHolder                        LpcfgMechfeat)
        (PHolder                        LpcfgMechI)
        (PHolder                        LpcfgDcadCmd)
        (PHolder                        LpcfgProHelp)
        (PHolder                        LpcfgBrowser)
        (PHolder                        LpcfgFlexCfg)
        (PHolder                        LpcfgAppmgr)
        (PHolder                        LpcfgWeblink)
    )

    (Resources
        (ScreenWelcome.FileName         "scr_welcome")
        (ScreenWelcome.ResName          "scr_welcome")
        (ScreenStudentLic.FileName      "scr_studentlic")
        (ScreenStudentLic.ResName       "scr_studentlic")
        (ScreenLicAgree.FileName        "scr_licagree")
        (ScreenLicAgree.ResName         "scr_licagree")
        (ScreenOracleEdition.FileName   "scr_oracle_edition")
        (ScreenOracleEdition.ResName    "scr_oracle_edition")
        (ScreenProd.FileName            "scr_prod")
        (ScreenProd.ResName             "scr_prod")
        (ScreenProdFlex.FileName        "scr_prodflex")
        (ScreenProdFlex.ResName         "scr_prodflex")
        (ScreenMsi.FileName             "scr_msi")
        (ScreenMsi.ResName              "scr_msi")
        (ScreenJava.FileName            "scr_java")
        (ScreenJava.ResName             "scr_java")
        (ScreenLicList.FileName         "scr_liclst")
        (ScreenLicList.ResName          "scr_liclst")
        (ScreenWindows.FileName         "scr_windows")
        (ScreenWindows.ResName          "scr_windows")
        (ScreenDftCmds.FileName         "scr_dftcmds")
        (ScreenDftCmds.ResName          "scr_dftcmds")
        (ScreenCmdList.FileName         "scr_genlist")
        (ScreenCmdList.ResName          "scr_genlist")
        (ScreenFlexIntro.FileName       "scr_flexi")
        (ScreenFlexIntro.ResName        "scr_flexi")
        (ScreenFlexCk.FileName          "scr_flexck")
        (ScreenFlexCk.ResName           "scr_flexck")
        (ScreenWtProp.FileName          "scr_wtprop")
        (ScreenWtProp.ResName           "scr_wtprop")
        (ScreenLDAP.FileName            "scr_ldapdir")
        (ScreenLDAP.ResName             "scr_ldapdir")
        (ScreenServlet.FileName         "scr_servlet")
        (ScreenServlet.ResName          "scr_servlet")
        (ScreenIEService.FileName       "scr_ieservice")
        (ScreenIEService.ResName        "scr_ieservice")
        (ScreenOptGWSrvc.FileName       "scr_optgwsrvc")
        (ScreenOptGWSrvc.ResName        "scr_optgwsrvc")
        (ScreenOptIEAdpt.FileName       "scr_optieadpt")
        (ScreenOptIEAdpt.ResName        "scr_optieadpt")
        (ScreenIEOpt.FileName           "scr_ieopt")
        (ScreenIEOpt.ResName            "scr_ieopt")
        (ScreenWpcfg.FileName           "scr_wpcfg")
        (ScreenWpcfg.ResName            "scr_wpcfg")
        (ScreenErbProp.FileName         "scr_erbprop")
        (ScreenErbProp.ResName          "scr_erbprop")
        (ScreenIlGate.FileName          "scr_ilgate")
        (ScreenIlGate.ResName           "scr_ilgate")
        (ScreenCabinet.FileName         "scr_doccab")
        (ScreenCabinet.ResName          "scr_doccab")
        (ScreenLpcfg.FileName           "scr_lpcfg")
        (ScreenLpcfg.ResName            "scr_lpcfg")
        (ScreenProgress.FileName        "scr_progress")
        (ScreenProgress.ResName         "scr_progress")
        (ScreenAppMgr.FileName          "scr_appmgr")
        (ScreenAppMgr.ResName           "scr_appmgr")
        (ScreenWebPub.FileName          "scr_webpub")
        (ScreenWebPub.ResName           "scr_webpub")
        (ScreenPdmSrvList.FileName      "scr_genlist")
        (ScreenPdmSrvList.ResName       "scr_genlist")
        (ScreenPdmDBList.FileName       "scr_genlist")
        (ScreenPdmDBList.ResName        "scr_genlist")
        (ScreenPdmPort.FileName         "scr_pdmport")
        (ScreenPdmPort.ResName          "scr_pdmport")
        (ScreenVault.FileName           "scr_vault")
        (ScreenVault.ResName            "scr_vault")
        (ScreenDbssvr.FileName          "scr_dbssvr")
        (ScreenDbssvr.ResName           "scr_dbssvr")
        (ScreenMigrate.FileName         "scr_migrate")
        (ScreenMigrate.ResName          "scr_migrate")
        (ScreenDataserver.FileName      "scr_dataserver")
        (ScreenDataserver.ResName       "scr_dataserver")
        (ScreenWcOCU.FileName           "scr_wcocu")
        (ScreenWcOCU.ResName            "scr_wcocu")
        (ScreenIascfg.FileName          "scr_iascfg")
        (ScreenIascfg.ResName           "scr_iascfg")
        (ScreenPasProp.FileName         "scr_pasprop")
        (ScreenPasProp.ResName          "scr_pasprop")
        (ScreenNetscape.FileName        "scr_netscape")
        (ScreenNetscape.ResName         "scr_netscape")
        (ScreenWSConfig.FileName        "scr_wsconfig")
        (ScreenWSConfig.ResName         "scr_wsconfig")
        (ScreenMakeJar.FileName         "scr_makejar")
        (ScreenMakeJar.ResName          "scr_makejar")
        (ScreenRosettaNet.FileName      "scr_rn")
        (ScreenRosettaNet.ResName       "scr_rn")
        (ScreenUDDI.FileName            "scr_uddi")
        (ScreenUDDI.ResName             "scr_uddi")
        (ScreenPartsLink.FileName       "scr_partslink")
        (ScreenPartsLink.ResName        "scr_partslink")
        (ScreenRNadptr.FileName         "scr_rn_adptr")
        (ScreenRNadptr.ResName          "scr_rn_adptr")
        (ScreenOrga.FileName            "scr_orga")
        (ScreenOrga.ResName             "scr_orga")
        (ScreenRNProp.FileName          "scr_rn_prop")
        (ScreenRNProp.ResName           "scr_rn_prop")
        (ScreenDbProp.FileName          "scr_dbprop")
        (ScreenDbProp.ResName           "scr_dbprop")
        (LpcfgCmdList.FileName          "lpcfg_cmdlist")
        (LpcfgCmdList.ResName           "lpcfg_cmdlist")
        (LpcfgInterOpt.FileName         "lpcfg_interop")
        (LpcfgInterOpt.ResName          "lpcfg_interop")
        (LpcfgDbProp.FileName           "lpcfg_dbprop")
        (LpcfgDbProp.ResName            "lpcfg_dbprop")
        (LpcfgRNProp.FileName           "lpcfg_sply_rn")
        (LpcfgRNProp.ResName            "lpcfg_sply_rn")
        (LpcfgOptIEWeb.FileName         "lpcfg_optieweb")
        (LpcfgOptIEWeb.ResName          "lpcfg_optieweb")
        (LpcfgReplication.FileName      "lpcfg_replication")
        (LpcfgReplication.ResName       "lpcfg_replication")
        (LpcfgIEBroker.FileName         "lpcfg_iebroker")
        (LpcfgIEBroker.ResName          "lpcfg_iebroker")
        (LpcfgLinkpath.FileName         "lpcfg_linkpath")
        (LpcfgLinkpath.ResName          "lpcfg_linkpath")
        (LpcfgConfServer.FileName       "lpcfg_csd")
        (LpcfgConfServer.ResName        "lpcfg_csd")
        (LpcfgOle.FileName              "lpcfg_ole")
        (LpcfgOle.ResName               "lpcfg_ole")
        (LpcfgOraprops.FileName         "lpcfg_oraprop")
        (LpcfgOraprops.ResName          "lpcfg_oraprop")
        (LpcfgOrapwd.FileName           "lpcfg_orapwd")
        (LpcfgOrapwd.ResName            "lpcfg_orapwd")
        (LpcfgMS_SS.FileName            "lpcfg_ms_ss")
        (LpcfgMS_SS.ResName             "lpcfg_ms_ss")
        (LpcfgRbm.FileName              "lpcfg_rbm")
        (LpcfgRbm.ResName               "lpcfg_rbm")
        (LpcfgMechfeat.FileName         "scr_genlist")
        (LpcfgMechfeat.ResName          "scr_genlist")
        (LpcfgMechI.FileName            "lpcfg_mechi")
        (LpcfgMechI.ResName             "lpcfg_mechi")
        (LpcfgDcadCmd.FileName          "lpcfg_dcad")
        (LpcfgDcadCmd.ResName           "lpcfg_dcad")
        (LpcfgProHelp.FileName          "scr_genlist")
        (LpcfgProHelp.ResName           "scr_genlist")
        (LpcfgBrowser.FileName          "lpcfg_browser")
        (LpcfgBrowser.ResName           "lpcfg_browser")
        (LpcfgFlexCfg.FileName          "lpcfg_flex")
        (LpcfgFlexCfg.ResName           "lpcfg_flex")
        (LpcfgAppmgr.FileName           "lpcfg_appmgr")
        (LpcfgAppmgr.ResName            "lpcfg_appmgr")
        (LpcfgWeblink.FileName          "lpcfg_weblink")
        (LpcfgWeblink.ResName           "lpcfg_weblink")
        (.Label                         "Install Product(s)")
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.Alignment                     1)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                ScreensTab
            )
        )
    )
)

(Layout HelpLayout
    (Components
        (HTMLWindow                     SetupHelp)
    )

    (Resources
        (SetupHelp.Columns              12)
        (SetupHelp.Decorated            False)
        (.Visible                       False)
        (.Mapped                        False)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.Alignment                     1)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                SetupHelp
            )
        )
    )
)

(MenuPane MenuPane1
    (Components
        (PushButton                     RTFBtn)
        (PushButton                     InstallGuideBtn)
        (PushButton                     CustomerSupportBtn)
    )

    (Resources
        (RTFBtn.Label                   "Read this First")
        (RTFBtn.ButtonStyle             4)
        (InstallGuideBtn.Label          "Installation Guide")
        (InstallGuideBtn.ButtonStyle    4)
        (CustomerSupportBtn.Label       "Services and Support")
        (CustomerSupportBtn.ButtonStyle 4)
    )
)

(Layout TopLayout
    (Components
        (Label                          JustBlack)
        (Label                          Banner_ScreenLabSm)
        (Label                          Label1)
        (Label                          PTCLogoLab)
    )

    (Resources
        (JustBlack.AttachLeft           True)
        (JustBlack.AttachRight          True)
        (JustBlack.AttachTop            True)
        (JustBlack.AttachBottom         True)
        (JustBlack.BackgroundColor      0)
        (Banner_ScreenLabSm.Label       "Define Installation Components")
        (Banner_ScreenLabSm.AttachLeft  True)
        (Banner_ScreenLabSm.AttachRight True)
        (Banner_ScreenLabSm.AttachTop   True)
        (Banner_ScreenLabSm.AttachBottom True)
        (Banner_ScreenLabSm.Alignment   1)
        (Banner_ScreenLabSm.ForegroundColor 15)
        (Banner_ScreenLabSm.BackgroundColor 0)
        (Banner_ScreenLabSm.BottomOffset 10)
        (Banner_ScreenLabSm.RightOffset 20)
        (Banner_ScreenLabSm.FontSize    10.000000)
        (Label1.Bitmap                  "generic_banner_welcome.gif")
        (PTCLogoLab.Bitmap              "bnr_b.gif")
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.BackgroundColor               0)
        (.Layout
            (Grid (Rows 1) (Cols 0 1)
                Label1
                (Grid (Rows 1 0) (Cols 1)
                    (Grid (Rows 1) (Cols 1 0)
                        JustBlack
                        PTCLogoLab
                    )
                    Banner_ScreenLabSm
                )
            )
        )
    )
)

(Layout DebugLayout
    (Components
        (Menu                           DebugPopup)
    )

    (Resources
        (.Visible                       False)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                DebugPopup
            )
        )
    )
)

(MenuPane DebugPopup
    (Components
        (PushButton                     LogicDump)
        (PushButton                     LogicCompare)
        (PushButton                     UI_Info)
    )

    (Resources
        (LogicDump.AcceleratorCode      1245184)
        (LogicCompare.AcceleratorCode   1310720)
        (UI_Info.AcceleratorCode        1376256)
    )
)

(MenuPane Feature_Popup
    (Components
        (PushButton                     item)
        (PushButton                     all)
        (Separator                      Separator1)
        (PushButton                     none)
    )

    (Resources
        (item.Label                     "<A>  &Install this feature")
        (item.SymbolNames               "A")
        (item.SymbolImages              "ps_select_item")
        (all.Label                      "<A>  Install &all sub-features")
        (all.SymbolNames                "A")
        (all.SymbolImages               "ps_select_all")
        (Separator1.TopOffset           0)
        (Separator1.BottomOffset        0)
        (Separator1.LeftOffset          0)
        (Separator1.RightOffset         0)
        (none.Label                     "<A>  Do &not install this feature")
        (none.SymbolNames               "A")
        (none.SymbolImages              "ps_unavailable")
    )
)

(MenuPane FeatSht_Popup
    (Components
        (PushButton                     item_2)
        (Separator                      Separator2)
        (PushButton                     none_2)
    )

    (Resources
        (item_2.Label                   "<A>  &Install this feature")
        (item_2.SymbolNames             "A")
        (item_2.SymbolImages            "ps_select_item")
        (Separator2.TopOffset           0)
        (Separator2.BottomOffset        0)
        (Separator2.LeftOffset          0)
        (Separator2.RightOffset         0)
        (none_2.Label                   "<A>  Do &not install this feature")
        (none_2.SymbolNames             "A")
        (none_2.SymbolImages            "ps_unavailable")
    )
)

(MenuPane DFeature_all
    (Components
        (PushButton                     all_d)
    )

    (Resources
        (all_d.Label                    "<A>  &All sub-features are already installed")
        (all_d.Sensitive                False)
        (all_d.SymbolNames              "A")
        (all_d.SymbolImages             "ps_disabled_all")
        (.Sensitive                     False)
        (.PopupWhenInsen                1)
    )
)

(MenuPane DFeature_item
    (Components
        (PushButton                     item_d)
    )

    (Resources
        (item_d.Label                   "<A>  &Feature is already installed")
        (item_d.Sensitive               False)
        (item_d.SymbolNames             "A")
        (item_d.SymbolImages            "ps_disabled_item")
        (.Sensitive                     False)
    )
)

(MenuPane DFeature_some
    (Components
        (PushButton                     all_d_2)
        (Separator                      Separator4)
        (PushButton                     none_3)
    )

    (Resources
        (all_d_2.Label                  "<A>  &Some sub-features are already installed")
        (all_d_2.Sensitive              False)
        (all_d_2.SymbolNames            "A")
        (all_d_2.SymbolImages           "ps_disabled_all")
        (Separator4.TopOffset           0)
        (Separator4.BottomOffset        0)
        (Separator4.LeftOffset          0)
        (Separator4.RightOffset         0)
        (none_3.Label                   "<A>  Some sub-features will be &unavailable")
        (none_3.SymbolNames             "A")
        (none_3.SymbolImages            "ps_unavailable")
    )
)
