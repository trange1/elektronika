!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  ps_cmd.res
! 
!  Command configuration dialog
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  16-Feb-99 I-03-02   JJE   $$1    Group submission
!  11-Mar-99           TWH          Chg proe_start -> proe
!  11-May-99 I-03-09   JJE   $$2    Group Submission
!  20-Oct-99           OTT/MYA      Add cdrs, 3dpaint
!  03-Nov-99 I-03-20   JJE   $$3    Group Submission
!  08-Dec-99 I-03-22+  JJE   $$4    Fix ilink cmd tab
!  07-Jan-99           MYA          Change pdm to pdmclient
!  12-Jan-00 I-03-26+  JJE   $$5    Group Submission
!  07-Feb-00           JJE          Fix button label
!  08-Feb-00           JJE          Add setup bitmap
!  09-Feb-00 I-03-26+  JJE   $$6    Group Submission
!  24-Oct-00 J-01-20+  JJE   $$7    Add rsd
!  04-Jan-01           TWH          Add License simplications
!  04-Jan-01 J-01-25   TWH   $$8    Add DebugLayout
!  19-Jan-01 J-01-26   TWH   $$9    Commentout DebugLayout awaiting NT fix
!  15-Feb-01 J-01-27   TWH   $$10   rework to support both license schemes
!  06-Aug-01 J-01-36   TWH   $$11   Chg License simplications
!  28-Nov-01 J-03-13   ott   $$12   Add conceptone
!  18-Feb-02 J-03-19   MAZ   $$13   Add CmdDesc1
!  24-Jun-02 J-03-28   TWH   $$14   Increase maxlen
!  10-Jul-02 J-03-29   ott   $$15   Change conceptone to concept
!  16-Jul-02 J-03-30   JJE   $$16   Make lic fields invisible SPR 963596
!  11-Nov-02 J-03-37   MAZ   $$17   Add CmdDesc2 
!  03-Dec-02           TWH          Fix tab order
!  06-Jan-03 J-03-40   ALG   $$18   Add AlwaysAbove, DefaultButton
!  02-Jun-03 K-01-07+  TWH   $$19   Fix AlwaysAbove
!  19-Apr-04 K-01-27   MAZ          Remove Cmd_proe
!  10-May-04 K-03-01   MAZ   $$20   Sub to K-03
!  04-Aug-05 K-03-30   TWH   $$21   FLEXlm -> FLEXnet
!  
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Dialog ps_cmd
    (Components
        (SubLayout                      CmdInfoLayout)
        (Tab                            CmdTypeTab
                                        Cmd_blank
                                        Cmd_rsd
                                        Cmd_ilink
                                        Cmd_cdrs
                                        Cmd_3dpaint
                                        Cmd_concept
                                        Cmd_pdmclient
                                        Cmd_profly
                                        Cmd_tkenv)
        (PHolder                        Cmd_blank)
        (PHolder                        Cmd_rsd)
        (PHolder                        Cmd_ilink)
        (PHolder                        Cmd_cdrs)
        (PHolder                        Cmd_3dpaint)
        (PHolder                        Cmd_concept)
        (PHolder                        Cmd_pdmclient)
        (PHolder                        Cmd_profly)
        (PHolder                        Cmd_tkenv)
        (Label                          Label19)
        (StdButton                      StdOK)
        (StdButton                      StdCancel)
    )

    (Resources
        (CmdTypeTab.Collapsable         True)
        (Cmd_blank.FileName             "cmdcfg_blank")
        (Cmd_blank.ResName              "cmdcfg_blank")
        (Cmd_rsd.FileName               "cmdcfg_rsd")
        (Cmd_rsd.ResName                "cmdcfg_rsd")
        (Cmd_ilink.FileName             "cmdcfg_ilink")
        (Cmd_ilink.ResName              "cmdcfg_ilink")
        (Cmd_cdrs.FileName              "cmdcfg_cdrs")
        (Cmd_cdrs.ResName               "cmdcfg_cdrs")
        (Cmd_3dpaint.FileName           "cmdcfg_3dpaint")
        (Cmd_3dpaint.ResName            "cmdcfg_3dpaint")
        (Cmd_concept.FileName           "cmdcfg_concept")
        (Cmd_concept.ResName            "cmdcfg_concept")
        (Cmd_pdmclient.FileName         "cmdcfg_pdm")
        (Cmd_pdmclient.ResName          "cmdcfg_pdm")
        (Cmd_profly.FileName            "cmdcfg_profly")
        (Cmd_profly.ResName             "cmdcfg_profly")
        (Cmd_tkenv.FileName             "cmdcfg_tkenv")
        (Cmd_tkenv.ResName              "cmdcfg_tkenv")
        (Label19.Label                  "Specify configuration options for this startup command")
        (Label19.AttachLeft             True)
        (Label19.AttachRight            True)
        (Label19.ForegroundColor        4)
        (Label19.TopOffset              5)
        (Label19.FontStyle              9)
        (StdOK.Label                    "&OK")
        (StdCancel.Label                "&Cancel")
        (.Bitmap                        "setup")
        (.Label                         "Command Configuration")
        (.DefaultButton                 "StdOK")
        (.AlwaysAbove                   "ptcsetup")
        (.Layout
            (Grid (Rows 1 1 1) (Cols 1)
                Label19
                CmdInfoLayout
                CmdTypeTab
            )
        )
    )
)

(Layout CmdInfoLayout
    (Components
        (Tab                            CmdInfo
                                        CmdInfo1
                                        CmdInfo2)
        (RadioGroup                     CmdInfoGrp)
        (Label                          CmdInfoGrpLab)
    )

    (Resources
        (CmdInfo.Collapsable            True)
        (CmdInfoGrp.AttachRight         False)
        (CmdInfoGrp.Names               "1"
                                        "2")
        (CmdInfoGrp.Labels              "No ConfigID"
                                        "ConfigID")
        (CmdInfoGrp.Alignment           1)
        (CmdInfoGrpLab.Label            "License Scheme:")
        (CmdInfoGrpLab.AttachRight      True)
        (CmdInfoGrpLab.Alignment        1)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1) (Cols 1)
                (Grid (Rows 1) (Cols 1 1)
                    CmdInfoGrpLab
                    CmdInfoGrp
                )
                CmdInfo
            )
        )
    )
)

(Layout CmdInfo1
    (Components
        (Label                          CmdName1Lab)
        (InputPanel                     CmdName1)
        (Label                          CmdDesc1Lab)
        (InputPanel                     CmdDesc1)
        (Label                          CmdType1Lab)
        (OptionMenu                     CmdType1)
        (Label                          CmdLTRLab)
        (InputPanel                     CmdLTR)
        (PushButton                     CmdLTRMod)
        (Label                          CmdLicExtLab)
        (InputPanel                     CmdLicExt)
        (PushButton                     CmdLicExtMod)
        (Label                          CmdLicFltLab)
        (InputPanel                     CmdLicFlt)
        (PushButton                     CmdLicFltMod)
    )

    (Resources
        (CmdName1Lab.Label              "Command Name")
        (CmdName1Lab.AttachRight        True)
        (CmdName1Lab.Alignment          0)
        (CmdDesc1Lab.Label              "Command Description")
        (CmdType1Lab.Label              "Command Type")
        (CmdType1Lab.AttachRight        True)
        (CmdType1Lab.Alignment          1)
        (CmdType1.Columns               10)
        (CmdLTRLab.Label                "License To Run")
        (CmdLTRLab.AttachRight          True)
        (CmdLTR.Visible                 False)
        (CmdLTR.MaxLen                  512)
        (CmdLTR.Editable                False)
        (CmdLTR.BackgroundColor         10)
        (CmdLTRMod.Label                "Edit")
        (CmdLTRMod.AttachLeft           True)
        (CmdLicExtLab.Label             "License Extensions")
        (CmdLicExtLab.AttachRight       True)
        (CmdLicExt.Visible              False)
        (CmdLicExt.MaxLen               256)
        (CmdLicExt.Editable             False)
        (CmdLicExt.BackgroundColor      10)
        (CmdLicExtMod.Label             "Edit")
        (CmdLicExtMod.AttachLeft        True)
        (CmdLicFltLab.Label             "Floating Options")
        (CmdLicFltLab.AttachRight       True)
        (CmdLicFlt.Visible              False)
        (CmdLicFlt.MaxLen               256)
        (CmdLicFlt.Editable             False)
        (CmdLicFltMod.Label             "Edit")
        (CmdLicFltMod.AttachLeft        True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1 1 1) (Cols 1 1)
                CmdName1Lab
                CmdName1
                CmdDesc1Lab
                CmdDesc1
                CmdType1Lab
                CmdType1
                (Grid (Rows 1 1 1) (Cols 1)
                    CmdLTRLab
                    CmdLicExtLab
                    CmdLicFltLab
                )
                (Grid (Rows 1 1 1) (Cols 0 1)
                    CmdLTR
                    CmdLTRMod
                    CmdLicExt
                    CmdLicExtMod
                    CmdLicFlt
                    CmdLicFltMod
                )
            )
        )
    )
)

(Layout CmdInfo2
    (Components
        (Label                          CmdName2Lab)
        (InputPanel                     CmdName2)
        (Label                          CmdDesc2Lab)
        (InputPanel                     CmdDesc2)
        (Label                          CmdType2Lab)
        (OptionMenu                     CmdType2)
        (Label                          CmdLicLab)
        (InputPanel                     CmdLic)
        (PushButton                     CmdLicMod)
    )

    (Resources
        (CmdName2Lab.Label              "Command Name")
        (CmdName2Lab.AttachRight        True)
        (CmdName2Lab.Alignment          0)
        (CmdDesc2Lab.Label              "Command Description")
        (CmdType2Lab.Label              "Command Type")
        (CmdType2Lab.AttachRight        True)
        (CmdType2Lab.Alignment          1)
        (CmdType2.Columns               10)
        (CmdLicLab.Label                "FLEXnet Licenses")
        (CmdLicLab.AttachRight          True)
        (CmdLicLab.Alignment            1)
        (CmdLic.MaxLen                  1024)
        (CmdLicMod.Label                "Modify")
        (CmdLicMod.AttachLeft           True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1 1 1) (Cols 1 1)
                CmdName2Lab
                CmdName2
                CmdDesc2Lab
                CmdDesc2
                CmdType2Lab
                CmdType2
                CmdLicLab
                (Grid (Rows 1) (Cols 1 1)
                    CmdLic
                    CmdLicMod
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
