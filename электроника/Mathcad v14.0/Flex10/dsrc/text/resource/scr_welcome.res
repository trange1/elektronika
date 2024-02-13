!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  scr_welcome.res
! 
!  ScreenWelcome
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  09-Dec-98           AW           Created
!  20-Jan-99           JJE          Add gifwindow
!  16-Feb-99 I-03-02   JJE   $$1    Group submission
!  26-Mar-99           JJE          Snazzy changes
!  15-Apr-99           JJE          Fix the sizing
!  04-May-99           JJE          Move the ProdGif here
!  11-May-99 I-03-09   JJE   $$2    Group Submission
!  13-Oct-99           JJE          Use ptcsetup image
!  13-Oct-99 I-03-17+  JJE   $$3    Group Submission
!  03-Nov-99           JJE          Change to a button
!  03-Nov-99 I-03-20   JJE   $$4    Group Submission
!  20-Dec-99           JJE          Add footnote lab
!  22-Dec-99 I-03-24+  JJE   $$5    Group Submission
!  04-May-01 J-01-32+  JJE   $$6    Take out the ptcsetup gif
!  16-May-01 J-01-32+  JJE   $$7    Take out msi footnote
!  25-May-01 J-01-33   ALG          Put FootnoteLab back for icemddn CD
!  29-May-01 J-01-33+  MAZ   $$8    Remove msi text from FootnoteLab
!  10-Jun-02 J-03-27   JJE   $$9    Get rid of cpuid button, make it a label
!  29-Apr-03 K-01-06   TWH   $$10   Rewrite
!  19-May-03 K-01-07   TWH/JJE $$11 touch up; add sidebanner
!  02-Jun-03 K-01-07+  JJE   $$12   Rework
!  25-Aug-03 K-01-13   TWH   $$13   New LHS image
!  21-Sep-05 K-01-42   JJE          Changes for ClickWrap
!  26-Sep-05 K-03-32   JJE   $$14   Submit to K-03
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout scr_welcome
    (Components
        (SubLayout                      HostinfoLayout)
        (Label                          Label2)
        (Tab                            MainWelcomeTab
                                        RegularLay
                                        LicAgreeLay)
    )

    (Resources
        (Label2.AttachLeft              True)
        (Label2.AttachRight             True)
        (Label2.AttachTop               True)
        (Label2.AttachBottom            True)
        (Label2.BackgroundColor         0)
        (MainWelcomeTab.BackgroundColor 0)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.ForegroundColor               15)
        (.BackgroundColor               0)
        (.Layout
            (Grid (Rows 1 0 0) (Cols 1)
                MainWelcomeTab
                Label2
                HostinfoLayout
            )
        )
    )
)

(Layout HostinfoLayout
    (Components
        (Label                          FootnoteLab)
        (Label                          CpuidLab)
    )

    (Resources
        (FootnoteLab.Label              "FootnoteLab AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")
        (FootnoteLab.Visible            False)
        (FootnoteLab.AttachLeft         True)
        (FootnoteLab.AttachRight        True)
        (FootnoteLab.Alignment          0)
        (FootnoteLab.ForegroundColor    15)
        (FootnoteLab.BackgroundColor    0)
        (FootnoteLab.LeftOffset         4)
        (CpuidLab.Label                 "Hostname: serpico.ptc.com
PTC HostID: 00-00-00-00-00-00")
        (CpuidLab.AttachLeft            True)
        (CpuidLab.Alignment             0)
        (CpuidLab.ForegroundColor       15)
        (CpuidLab.BackgroundColor       0)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.ForegroundColor               15)
        (.BackgroundColor               0)
        (.LeftOffset                    5)
        (.Layout
            (Grid (Rows 1 1) (Cols 1)
                FootnoteLab
                CpuidLab
            )
        )
    )
)

(Layout RegularLay
    (Components
        (Label                          Label1)
        (Tab                            MainProdTab
                                        CountryLay
                                        ProdLay)
    )

    (Resources
        (Label1.Bitmap                  "generic_welcome_lhs.gif")
        (Label1.AttachLeft              True)
        (Label1.AttachRight             True)
        (Label1.AttachTop               True)
        (Label1.Alignment               0)
        (Label1.Resizeable              True)
        (Label1.BackgroundColor         0)
        (MainProdTab.BackgroundColor    0)
        (.BackgroundColor               0)
        (.Layout
            (Grid (Rows 1) (Cols 0 1)
                Label1
                MainProdTab
            )
        )
    )
)

(Layout CountryLay
    (Components
        (OptionMenu                     CountryMenu)
        (Label                          CountryLab)
        (Label                          Label4)
        (Label                          Label5)
        (Label                          Label6)
    )

    (Resources
        (CountryMenu.Columns            12)
        (CountryMenu.VisibleRows        10)
        (CountryMenu.AttachRight        False)
        (CountryMenu.ForegroundColor    0)
        (CountryMenu.BackgroundColor    15)
        (CountryLab.Label               "Select your country:")
        (CountryLab.AttachLeft          True)
        (CountryLab.ForegroundColor     15)
        (CountryLab.BackgroundColor     0)
        (Label4.AttachTop               True)
        (Label4.AttachBottom            True)
        (Label4.TopOffset               20)
        (Label4.BottomOffset            20)
        (.BackgroundColor               0)
        (.Layout
            (Grid (Rows 1) (Cols 0 1)
                (Grid (Rows 0 0 0 1) (Cols 0)
                    Label4
                    CountryLab
                    CountryMenu
                    Label5
                )
                Label6
            )
        )
    )
)

(Layout ProdLay
    (Components
        (SashLayout                     WelcomeSash1)
    )

    (Resources
        (.BackgroundColor               0)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                WelcomeSash1
            )
        )
    )
)

(Sash WelcomeSash1
    (Components
        (SubLayout                      ProdLayout)
        (SubLayout                      SecondProdLayout)
    )

    (Resources
        (.Sensitive                     False)
        (.Orientation                   True)
        (.AttachBottom                  False)
        (.Resizeable                    True)
        (.BackgroundColor               0)
    )
)

(Layout ProdLayout
    (Components
        (ScrolledLayout                 ProdSubLayout)
    )

    (Resources
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.BackgroundColor               0)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                ProdSubLayout
            )
        )
    )
)

(Layout ProdSubLayout
    (Components
        (SubLayout                      TemplLayout1)
    )

    (Resources
        (.VisibleRows                   4)
        (.Decorated                     False)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.Resizeable                    True)
        (.BackgroundColor               0)
        (.FixedWidth                    False)
    )
)

(Layout TemplLayout1
    (Components
        (PushButton                     ProdButton)
    )

    (Resources
        (ProdButton.ButtonStyle         4)
        (ProdButton.AttachLeft          True)
        (ProdButton.AttachRight         True)
        (ProdButton.Resizeable          True)
        (ProdButton.ForegroundColor     15)
        (ProdButton.BackgroundColor     0)
        (ProdButton.TopOffset           2)
        (ProdButton.BottomOffset        2)
        (ProdButton.FontName            "Arial")
        (ProdButton.FontSize            14.000000)
        (.AttachLeft                    True)
        (.BackgroundColor               0)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                ProdButton
            )
        )
    )
)

(Layout SecondProdLayout
    (Components
        (ScrolledLayout                 Prod2SubLayout)
        (PushButton                     OpenSecondProd)
    )

    (Resources
        (OpenSecondProd.Label           "Other Products")
        (OpenSecondProd.ButtonStyle     4)
        (OpenSecondProd.AttachLeft      True)
        (OpenSecondProd.AttachRight     True)
        (OpenSecondProd.Resizeable      True)
        (OpenSecondProd.KeyboardInput   True)
        (OpenSecondProd.ForegroundColor 15)
        (OpenSecondProd.BackgroundColor 0)
        (OpenSecondProd.BottomOffset    3)
        (OpenSecondProd.ButtonAlignment 4411)
        (.Label                         "b")
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.BackgroundColor               0)
        (.Layout
            (Grid (Rows 0 1) (Cols 1)
                OpenSecondProd
                Prod2SubLayout
            )
        )
    )
)

(Layout Prod2SubLayout
    (Components
        (SubLayout                      TemplLayout2)
    )

    (Resources
        (.VisibleRows                   4)
        (.Decorated                     False)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.Resizeable                    True)
        (.BackgroundColor               0)
        (.FixedWidth                    False)
    )
)

(Layout TemplLayout2
    (Components
        (PushButton                     Prod2Button)
    )

    (Resources
        (Prod2Button.ButtonStyle        4)
        (Prod2Button.AttachLeft         True)
        (Prod2Button.AttachRight        True)
        (Prod2Button.Resizeable         True)
        (Prod2Button.ForegroundColor    15)
        (Prod2Button.BackgroundColor    0)
        (Prod2Button.TopOffset          2)
        (Prod2Button.BottomOffset       2)
        (Prod2Button.FontName           "Arial")
        (Prod2Button.FontSize           14.000000)
        (.AttachLeft                    True)
        (.BackgroundColor               0)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                Prod2Button
            )
        )
    )
)

(Layout LicAgreeLay
    (Components
        (TextArea                       LicAgreeTextArea)
        (Label                          Label3)
        (Label                          Label7)
        (Label                          Label8)
        (PushButton                     LicAgreeReg)
        (PushButton                     PrintLicAgree)
        (CheckButton                    AcceptBtn)
        (CheckButton                    DeclineBtn)
        (Label                          Label9)
    )

    (Resources
        (LicAgreeTextArea.Columns       38)
        (LicAgreeTextArea.MaxLen        50000)
        (LicAgreeTextArea.Wrap          True)
        (LicAgreeTextArea.ForegroundColor 0)
        (LicAgreeTextArea.BackgroundColor 15)
        (LicAgreeTextArea.ScrollBarsWhenNeeded True)
        (Label8.Label                   "Note: If Customer and PTC have signed a License Agreement previously (other than a Customer
Agreement for Windchill Products), the previous License Agreement shall govern Customer's
licensing and use of the Licensed Product and the terms and conditions of this Agreement
shall not apply. As used in this Agreement, \"you\" or \"your\" refer to Customer's representative
authorized to accept the terms of this Agreement on Customer's behalf.")
        (Label8.ForegroundColor         15)
        (Label8.BackgroundColor         0)
        (LicAgreeReg.Label              "License Agreement Regulations")
        (LicAgreeReg.Visible            False)
        (LicAgreeReg.ButtonStyle        4)
        (LicAgreeReg.AttachLeft         True)
        (LicAgreeReg.AttachTop          True)
        (LicAgreeReg.ForegroundColor    15)
        (LicAgreeReg.BackgroundColor    0)
        (LicAgreeReg.TopOffset          0)
        (PrintLicAgree.Label            "Printable Version")
        (PrintLicAgree.ButtonStyle      4)
        (PrintLicAgree.AttachRight      True)
        (PrintLicAgree.AttachTop        True)
        (PrintLicAgree.ForegroundColor  15)
        (PrintLicAgree.BackgroundColor  0)
        (PrintLicAgree.TopOffset        0)
        (AcceptBtn.Label                "I &Accept the Agreement Terms and Conditions")
        (AcceptBtn.AttachTop            True)
        (AcceptBtn.AttachBottom         True)
        (AcceptBtn.ForegroundColor      15)
        (AcceptBtn.BackgroundColor      0)
        (DeclineBtn.Label               "I &Decline the Agreement Terms and Conditions")
        (DeclineBtn.AttachTop           True)
        (DeclineBtn.AttachBottom        True)
        (DeclineBtn.ForegroundColor     15)
        (DeclineBtn.BackgroundColor     0)
        (Label9.Label                   "You must accept the license agreement to proceed")
        (Label9.ForegroundColor         15)
        (Label9.BackgroundColor         0)
        (.BackgroundColor               0)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 0 1 0 0 0 0) (Cols 1 1 1)
                (Pos 1 2)
                Label9
                (Pos 2 1)
                Label3
                LicAgreeTextArea
                Label7
                (Pos 3 2)
                (Grid (Rows 0) (Cols 1 1)
                    LicAgreeReg
                    PrintLicAgree
                )
                (Pos 4 2)
                Label8
                (Pos 5 2)
                AcceptBtn
                (Pos 6 2)
                DeclineBtn
            )
        )
    )
)
