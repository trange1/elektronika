!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  scr_licagree.res
! 
!  Standard License Agreement screen
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  03-Dec-99           JJE          Created
!  07-Dec-99 I-03-23   JJE   $$1    Group Submission
!  15-Feb-01 J-01-26+  TWH   $$2    change label
!  25-Apr-05 K-03-23   MAZ   $$3    Chg ACCEPT/Decline strings
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout scr_licagree
    (Components
        (TextArea                       LicAgreement)
        (RadioGroup                     RadioLicAcc)
        (Label                          AccLab)
    )

    (Resources
        (LicAgreement.MaxLen            32767)
        (LicAgreement.Editable          False)
        (LicAgreement.Wrap              True)
        (LicAgreement.ScrollBarPosition 6)
        (LicAgreement.CaretVisible      False)
        (LicAgreement.ScrollBarsWhenNeeded True)
        (RadioLicAcc.Orientation        True)
        (RadioLicAcc.AttachLeft         False)
        (RadioLicAcc.AttachRight        False)
        (RadioLicAcc.Names              "yes"
                                        "no")
        (RadioLicAcc.Labels             "I &ACCEPT the Agreement Terms and Conditions"
                                        "I &Decline the Agreement Terms and Conditions")
        (AccLab.Label                   "You must accept the following license agreement to proceed.")
        (AccLab.AttachLeft              True)
        (AccLab.AttachRight             True)
        (AccLab.AttachTop               True)
        (AccLab.AttachBottom            True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 0 1 0) (Cols 1)
                AccLab
                LicAgreement
                RadioLicAcc
            )
        )
    )
)
