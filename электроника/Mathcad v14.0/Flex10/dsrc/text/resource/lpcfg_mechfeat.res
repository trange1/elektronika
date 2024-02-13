!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  lpcfg_mechfeat.res
! 
!  Lpcfg, mechfeat
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  16-Feb-99 I-03-02   JJE   $$1    Group submission
!  23-Mar-99           JJE          Tweaks
!  11-May-99 I-03-09   JJE   $$2    Group Submission
!  27-Jul-02 J-03-30   JJE   $$3    Rm 'Interfaces' input
!  19-May-03 K-01-07   TWH   $$4    Hide Edit buttons
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout lpcfg_mechfeat
    (Components
        (SubLayout                      MechfeatSubLayout)
        (Label                          Label15)
    )

    (Resources
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 0 1) (Cols 1)
                MechfeatSubLayout
                Label15
            )
        )
    )
)

(Layout MechfeatSubLayout
    (Components
        (Label                          StructUILab)
        (Label                          StructEngLab)
        (Label                          MotionUILab)
        (Label                          MotionEngLab)
        (Label                          ThermalUILab)
        (Label                          ThermalEngLab)
        (Label                          EqRuntimeLab)
        (Label                          TireModelLab)
        (InputPanel                     StructUI)
        (InputPanel                     StructEng)
        (InputPanel                     MotionUI)
        (InputPanel                     MotionEng)
        (InputPanel                     ThermalUI)
        (InputPanel                     ThermalEng)
        (InputPanel                     EqRuntime)
        (InputPanel                     TireModel)
        (PushButton                     StructUIModify)
        (PushButton                     StructEngModify)
        (PushButton                     MotionUIModify)
        (PushButton                     MotionEngModify)
        (PushButton                     ThermalUIModify)
        (PushButton                     ThermalEngModify)
        (PushButton                     EqRuntimeModify)
        (PushButton                     TireModelModify)
        (Label                          Label10)
        (Label                          Label11)
        (Separator                      Separator2)
        (Separator                      Separator3)
        (Separator                      Separator4)
    )

    (Resources
        (StructUILab.Label              "Structure UI")
        (StructUILab.AttachRight        True)
        (StructEngLab.Label             "Structure Engine")
        (StructEngLab.AttachRight       True)
        (MotionUILab.Label              "Motion UI")
        (MotionUILab.AttachRight        True)
        (MotionEngLab.Label             "Motion Engine")
        (MotionEngLab.AttachRight       True)
        (ThermalUILab.Label             "Thermal UI")
        (ThermalUILab.AttachRight       True)
        (ThermalEngLab.Label            "Thermal Engine")
        (ThermalEngLab.AttachRight      True)
        (EqRuntimeLab.Label             "Equations Runtime")
        (EqRuntimeLab.AttachRight       True)
        (TireModelLab.Label             "Tire Model")
        (TireModelLab.AttachRight       True)
        (StructUIModify.Label           "Modify")
        (StructUIModify.Visible         False)
        (StructEngModify.Label          "Modify")
        (StructEngModify.Visible        False)
        (MotionUIModify.Label           "Modify")
        (MotionUIModify.Visible         False)
        (MotionEngModify.Label          "Modify")
        (MotionEngModify.Visible        False)
        (ThermalUIModify.Label          "Modify")
        (ThermalUIModify.Visible        False)
        (ThermalEngModify.Label         "Modify")
        (ThermalEngModify.Visible       False)
        (EqRuntimeModify.Label          "Modify")
        (EqRuntimeModify.Visible        False)
        (TireModelModify.Label          "Modify")
        (TireModelModify.Visible        False)
        (Label10.Label                  "Mechanica Module")
        (Label10.AttachRight            True)
        (Label11.Label                  "Licenses associated with the module")
        (Label11.AttachLeft             True)
        (Separator2.TopOffset           0)
        (Separator2.BottomOffset        0)
        (Separator2.LeftOffset          0)
        (Separator2.RightOffset         0)
        (Separator3.TopOffset           0)
        (Separator3.BottomOffset        0)
        (Separator3.LeftOffset          0)
        (Separator3.RightOffset         0)
        (Separator4.TopOffset           0)
        (Separator4.BottomOffset        0)
        (Separator4.LeftOffset          0)
        (Separator4.RightOffset         0)
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
            (Grid (Rows 1 1 1 1 1 1 1 1 1 1) (Cols 0 1 0)
                Label10
                Label11
                (Pos 2 1)
                Separator2
                Separator3
                Separator4
                StructUILab
                StructUI
                StructUIModify
                StructEngLab
                StructEng
                StructEngModify
                MotionUILab
                MotionUI
                MotionUIModify
                MotionEngLab
                MotionEng
                MotionEngModify
                ThermalUILab
                ThermalUI
                ThermalUIModify
                ThermalEngLab
                ThermalEng
                ThermalEngModify
                EqRuntimeLab
                EqRuntime
                EqRuntimeModify
                TireModelLab
                TireModel
                TireModelModify
            )
        )
    )
)
