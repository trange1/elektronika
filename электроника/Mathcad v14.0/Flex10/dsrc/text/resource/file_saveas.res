!----------------------------------------------------------------------------
!
!  Date      Release Name  Ver.  Comments
! ---------- ------- ----- ----- --------------------------------------------
! 20-May-97  H-03-10  KMG  $$1  Submitted.
! 21-May-97  H-03-12  KMG  $$2  Changed Dialog name
! 05-Jun-97  H-03-14  KMG  $$3  Use external sub layouts
! 19-Jun-97  H-03-15  KMG  $$4  Removed FileName/ResName from sub layouts
! 03-Jun-97  H-03-16  KMG  $$5  Use external sublayout for model selection
! 10-Jul-97  H-03-16+ KMG  $$6  specify mdl sublayout here to handle lib
!                                closure prob without tripping on a UI bug
! 19-Aug-97  H-03-19+ dxu  $$7  icon position adjustment.
! 07-Aug-97  H-03-20  KMG  $$8  Support for Backup
! 07-Sep-97  H-03-21  KMG  $$9  Fixed length of Input panel (32+1+3)
! 14-Oct-97  H-03-27  KMG  $$10 Added PCF name label
! 04-Dec-97  H-03-32  KMG  $$11 Inputpanel has enough room for full path
! 08-Jan-98  H-03-36  hmt  $$12 CascadeButton style to "tool"
! 30-Jul-99  I-03-13  HMR  $$13 Removed OptionsButton
! 21-Oct-99  I-03-19  aap  $$14 .RememberSize is FALSE
! 09-Oct-00  J-01-20  pmu  $$15 updated dialog label
! 14-Jan-02  J-03-17  aap  $$16 add pholder, tabs
! 28-Jan-02  J-03-18  HMR  $$17 Fixed layout of type/name labels.
! 06-Aug-02  J-03-31  HMR  $$18 Added lay_ask_secondary.
! 08-Nov-02  J-03-37  JJE  $$19 Tweak the layout to fix some misalignment
! 19-Feb-03  K-01-01  Moti $$20 Moved Cascade Button info to selobj_sublay .
! 15-Apr-03  K-01-05  aap  $$21 Updates for file save.
! 14-Jun-04  K-03-05  aap  $$22 Add category.
!----------------------------------------------------------------------------

(Dialog file_saveas
    (Components
        (Separator                      Separator)
        (PushButton                     OK)
        (PushButton                     Cancel)
        (Tab                            type_tab
                                        type
                                        no_type)
        (Tab                            navigation_tab
                                        nav_full
                                        nav_empty)
        (Tab                            tab_appspace
                                        lay_no_appspace
                                        lay_ask_secondary
                                        ph_appspace)
        (PHolder                        ph_appspace)
        (SubLayout                      lay_name_type)
    )

    (Resources
        (Separator.TopOffset            8)
        (Separator.BottomOffset         0)
        (Separator.LeftOffset           0)
        (Separator.RightOffset          0)
        (OK.Label                       "OK")
        (OK.TopOffset                   4)
        (OK.BottomOffset                4)
        (OK.LeftOffset                  4)
        (OK.RightOffset                 0)
        (Cancel.Label                   "Cancel")
        (Cancel.TopOffset               4)
        (Cancel.BottomOffset            4)
        (Cancel.LeftOffset              2)
        (Cancel.RightOffset             2)
        (type_tab.Collapsable           True)
        (type_tab.TopOffset             0)
        (type_tab.BottomOffset          0)
        (type_tab.LeftOffset            4)
        (type_tab.RightOffset           4)
        (navigation_tab.Collapsable     True)
        (navigation_tab.TopOffset       0)
        (navigation_tab.BottomOffset    0)
        (navigation_tab.LeftOffset      0)
        (navigation_tab.RightOffset     0)
        (tab_appspace.Collapsable       True)
        (tab_appspace.TopOffset         0)
        (tab_appspace.BottomOffset      0)
        (tab_appspace.LeftOffset        4)
        (tab_appspace.RightOffset       4)
        (.Label                         "Save a Copy")
        (.StartLocation                 5)
        (.TopOffset                     10)
        (.BottomOffset                  10)
        (.LeftOffset                    10)
        (.RightOffset                   10)
        (.DefaultButton                 "OK")
        (.RememberSize                  False)
        (.Layout
            (Grid (Rows 1 0 0 0 0 0) (Cols 1)
                navigation_tab
                lay_name_type
                type_tab
                tab_appspace
                Separator
                (Grid (Rows 0) (Cols 1 1)
                    OK
                    Cancel
                )
            )
        )
    )
)

(Layout type
    (Components
        (OptionMenu                     type_option)
        (Tab                            type_tab_labels
                                        llab_type
                                        llab_ph1
                                        llab_ph2)
    )

    (Resources
        (type_option.VisibleRows        12)
        (type_option.Names              "a"
                                        "b")
        (type_option.Labels             "IGES"
                                        "VRML")
        (type_option.TopOffset          2)
        (type_option.LeftOffset         2)
        (type_tab_labels.TopOffset      0)
        (type_tab_labels.BottomOffset   0)
        (type_tab_labels.LeftOffset     0)
        (type_tab_labels.RightOffset    0)
        (.TopOffset                     0)
        (.BottomOffset                  0)
        (.LeftOffset                    0)
        (.RightOffset                   0)
        (.Layout
            (Grid (Rows 1) (Cols 0 1)
                type_tab_labels
                type_option
            )
        )
    )
)

(Layout llab_type
    (Components
        (Label                          lab_type)
    )

    (Resources
        (lab_type.Label                 "Type")
        (lab_type.AttachLeft            True)
        (lab_type.Alignment             0)
        (lab_type.TopOffset             2)
        (lab_type.BottomOffset          0)
        (lab_type.LeftOffset            0)
        (lab_type.RightOffset           0)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                lab_type
            )
        )
    )
)

(Layout llab_ph1
    (Components
        (Label                          lab_ph1)
    )

    (Resources
        (lab_ph1.Label                  "Model Name")
        (lab_ph1.AttachLeft             True)
        (lab_ph1.Alignment              0)
        (lab_ph1.TopOffset              0)
        (lab_ph1.BottomOffset           0)
        (lab_ph1.LeftOffset             0)
        (lab_ph1.RightOffset            0)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                lab_ph1
            )
        )
    )
)

(Layout llab_ph2
    (Components
        (Label                          lab_ph2)
    )

    (Resources
        (lab_ph2.Label                  "New Name")
        (lab_ph2.AttachLeft             True)
        (lab_ph2.Alignment              0)
        (lab_ph2.TopOffset              0)
        (lab_ph2.BottomOffset           0)
        (lab_ph2.LeftOffset             0)
        (lab_ph2.RightOffset            0)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                lab_ph2
            )
        )
    )
)

(Layout no_type
    (Components
        (Label                          lab_empty1)
    )

    (Resources
        (lab_empty1.Bitmap              "empty")
        (lab_empty1.TopOffset           0)
        (lab_empty1.BottomOffset        0)
        (lab_empty1.LeftOffset          0)
        (lab_empty1.RightOffset         0)
        (.TopOffset                     0)
        (.BottomOffset                  0)
        (.LeftOffset                    0)
        (.RightOffset                   0)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                lab_empty1
            )
        )
    )
)

(Layout nav_full
    (Components
        (SubLayout                      path_lay)
        (SubLayout                      list)
    )

    (Resources
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.TopOffset                     2)
        (.BottomOffset                  2)
        (.LeftOffset                    4)
        (.RightOffset                   4)
        (.Layout
            (Grid (Rows 0 1) (Cols 1)
                path_lay
                list
            )
        )
    )
)

(Layout path_lay
    (Components
        (SubLayout                      ph_path)
        (PHolder                        ph_path)
    )

    (Resources
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.TopOffset                     8)
        (.BottomOffset                  0)
        (.LeftOffset                    4)
        (.RightOffset                   2)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                ph_path
            )
        )
    )
)

(Layout list
    (Components
        (SubLayout                      ph_list)
        (PHolder                        ph_list)
    )

    (Resources
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.TopOffset                     2)
        (.BottomOffset                  2)
        (.LeftOffset                    4)
        (.RightOffset                   4)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                ph_list
            )
        )
    )
)

(Layout nav_empty
    (Components
        (Label                          Label1)
    )

    (Resources
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.TopOffset                     2)
        (.BottomOffset                  2)
        (.LeftOffset                    4)
        (.RightOffset                   4)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                Label1
            )
        )
    )
)

(Layout lay_no_appspace
    (Components
        (Label                          invis_two)
    )

    (Resources
        (invis_two.Visible              False)
        (.Layout
            (Grid (Rows 0) (Cols 1)
                invis_two
            )
        )
    )
)

(Layout lay_ask_secondary
    (Components
        (CheckButton                    check_is_secondary)
        (OptionMenu                     opt_category)
        (Tab                            tab_label_category
                                        Layout1
                                        Layout2
                                        Layout3)
    )

    (Resources
        (check_is_secondary.Label       "Placeholder label for secondary")
        (check_is_secondary.AttachLeft  True)
        (check_is_secondary.Resizeable  True)
        (check_is_secondary.TopOffset   2)
        (check_is_secondary.LeftOffset  2)
        (opt_category.HelpText          "Select a category for the object to be saved.")
        (opt_category.TopOffset         2)
        (opt_category.LeftOffset        2)
        (tab_label_category.TopOffset   0)
        (tab_label_category.BottomOffset 0)
        (tab_label_category.LeftOffset  0)
        (tab_label_category.RightOffset 0)
        (.Layout
            (Grid (Rows 1 0) (Cols 0 1)
                tab_label_category
                opt_category
                (Pos 2 2)
                check_is_secondary
            )
        )
    )
)

(Layout Layout1
    (Components
        (Label                          lab_category)
    )

    (Resources
        (lab_category.Label             "Category")
        (lab_category.AttachLeft        True)
        (lab_category.Alignment         0)
        (lab_category.TopOffset         2)
        (lab_category.BottomOffset      0)
        (lab_category.LeftOffset        0)
        (lab_category.RightOffset       0)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                lab_category
            )
        )
    )
)

(Layout Layout2
    (Components
        (Label                          Label4)
    )

    (Resources
        (Label4.Label                   "Model Name")
        (Label4.AttachLeft              True)
        (Label4.Alignment               0)
        (Label4.TopOffset               0)
        (Label4.BottomOffset            0)
        (Label4.LeftOffset              0)
        (Label4.RightOffset             0)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                Label4
            )
        )
    )
)

(Layout Layout3
    (Components
        (Label                          Label5)
    )

    (Resources
        (Label5.Label                   "New Name")
        (Label5.AttachLeft              True)
        (Label5.Alignment               0)
        (Label5.TopOffset               0)
        (Label5.BottomOffset            0)
        (Label5.LeftOffset              0)
        (Label5.RightOffset             0)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                Label5
            )
        )
    )
)

(Layout lay_name_type
    (Components
        (Tab                            name_label
                                        namelab
                                        no_namelab)
        (SubLayout                      model_input)
        (Tab                            new_name_label
                                        newname_lab
                                        backup_name_labels
                                        pcf_name_labels
                                        no_newname_lab
                                        save_to_label)
        (InputPanel                     Inputname)
    )

    (Resources
        (name_label.TopOffset           0)
        (name_label.BottomOffset        0)
        (name_label.LeftOffset          4)
        (name_label.RightOffset         0)
        (new_name_label.TopOffset       2)
        (new_name_label.BottomOffset    0)
        (new_name_label.LeftOffset      4)
        (new_name_label.RightOffset     0)
        (Inputname.MaxLen               255)
        (Inputname.Value                "part007")
        (Inputname.TopOffset            2)
        (Inputname.BottomOffset         0)
        (Inputname.LeftOffset           0)
        (Inputname.RightOffset          4)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.TopOffset                     0)
        (.BottomOffset                  0)
        (.LeftOffset                    0)
        (.RightOffset                   0)
        (.Layout
            (Grid (Rows 0 1) (Cols 0 1)
                name_label
                model_input
                new_name_label
                Inputname
            )
        )
    )
)

(Layout namelab
    (Components
        (Tab                            namelab_tab_labels
                                        llab_name
                                        llab_ph5
                                        llab_ph6)
    )

    (Resources
        (.Layout
            (Grid (Rows 1) (Cols 1)
                namelab_tab_labels
            )
        )
    )
)

(Layout llab_name
    (Components
        (Label                          lab_name)
    )

    (Resources
        (lab_name.Label                 "Model Name")
        (lab_name.AttachLeft            True)
        (lab_name.Alignment             0)
        (lab_name.TopOffset             0)
        (lab_name.BottomOffset          0)
        (lab_name.LeftOffset            0)
        (lab_name.RightOffset           2)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                lab_name
            )
        )
    )
)

(Layout llab_ph5
    (Components
        (Label                          lab_ph5)
    )

    (Resources
        (lab_ph5.Label                  "New Name")
        (lab_ph5.AttachLeft             True)
        (lab_ph5.Alignment              0)
        (lab_ph5.TopOffset              0)
        (lab_ph5.BottomOffset           0)
        (lab_ph5.LeftOffset             0)
        (lab_ph5.RightOffset            2)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                lab_ph5
            )
        )
    )
)

(Layout llab_ph6
    (Components
        (Label                          lab_ph6)
    )

    (Resources
        (lab_ph6.Label                  "Type")
        (lab_ph6.AttachLeft             True)
        (lab_ph6.Alignment              0)
        (lab_ph6.TopOffset              0)
        (lab_ph6.BottomOffset           0)
        (lab_ph6.LeftOffset             0)
        (lab_ph6.RightOffset            2)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                lab_ph6
            )
        )
    )
)

(Layout no_namelab
    (Components
        (Label                          lab_empty3)
    )

    (Resources
        (lab_empty3.Bitmap              "empty")
        (lab_empty3.AttachLeft          True)
        (lab_empty3.Alignment           0)
        (lab_empty3.TopOffset           0)
        (lab_empty3.BottomOffset        0)
        (lab_empty3.LeftOffset          0)
        (lab_empty3.RightOffset         0)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                lab_empty3
            )
        )
    )
)

(Layout model_input
    (Components
        (SubLayout                      ph_model)
        (PHolder                        ph_model)
    )

    (Resources
        (ph_model.FileName              "selobj_sublay")
        (ph_model.ResName               "selobj_sublay")
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachBottom                  True)
        (.TopOffset                     0)
        (.BottomOffset                  0)
        (.LeftOffset                    0)
        (.RightOffset                   4)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                ph_model
            )
        )
    )
)

(Layout newname_lab
    (Components
        (Label                          lab_newname)
    )

    (Resources
        (lab_newname.Label              "New Name")
        (lab_newname.AttachLeft         True)
        (lab_newname.Alignment          0)
        (lab_newname.TopOffset          0)
        (lab_newname.BottomOffset       0)
        (lab_newname.LeftOffset         0)
        (lab_newname.RightOffset        2)
        (.TopOffset                     0)
        (.BottomOffset                  0)
        (.LeftOffset                    0)
        (.RightOffset                   0)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                lab_newname
            )
        )
    )
)

(Layout backup_name_labels
    (Components
        (Label                          lab_backup)
    )

    (Resources
        (lab_backup.Label               "Backup To")
        (lab_backup.AttachLeft          True)
        (lab_backup.Alignment           0)
        (.TopOffset                     0)
        (.BottomOffset                  0)
        (.LeftOffset                    0)
        (.RightOffset                   0)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                lab_backup
            )
        )
    )
)

(Layout pcf_name_labels
    (Components
        (Label                          label_pcf)
    )

    (Resources
        (label_pcf.Label                "PCF name")
        (label_pcf.AttachLeft           True)
        (label_pcf.Alignment            0)
        (.TopOffset                     0)
        (.BottomOffset                  0)
        (.LeftOffset                    0)
        (.RightOffset                   0)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                label_pcf
            )
        )
    )
)

(Layout no_newname_lab
    (Components
        (Label                          lab_empty2)
    )

    (Resources
        (lab_empty2.Bitmap              "empty")
        (lab_empty2.AttachLeft          True)
        (lab_empty2.Alignment           0)
        (lab_empty2.TopOffset           0)
        (lab_empty2.BottomOffset        0)
        (lab_empty2.LeftOffset          0)
        (lab_empty2.RightOffset         0)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                lab_empty2
            )
        )
    )
)

(Layout save_to_label
    (Components
        (Label                          lab_save_to)
    )

    (Resources
        (lab_save_to.Label              "Save To")
        (lab_save_to.AttachLeft         True)
        (lab_save_to.Alignment          0)
        (.TopOffset                     0)
        (.BottomOffset                  0)
        (.LeftOffset                    0)
        (.RightOffset                   0)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                lab_save_to
            )
        )
    )
)
