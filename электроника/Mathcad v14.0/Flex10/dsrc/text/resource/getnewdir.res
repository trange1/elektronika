!----------------------------------------------------------------------
!
!  Dialog for creating new directory
!
!  25-Feb-99  I-03-04  dvs  $$1 created
!
!----------------------------------------------------------------------

(Dialog getnewdir
    (Components
        (SubLayout                      Layout1)
    )

    (Resources
        (.Label                         "New Directory")
        (.Focus                         "new_dir_input")
        (.DefaultButton                 "OK_button")
        (.Layout
            (Grid (Rows 1) (Cols 1)
                Layout1
            )
        )
    )
)

(Layout Layout1
    (Components
        (InputPanel                     new_dir_input)
        (PushButton                     Cancel_button)
        (PushButton                     OK_button)
        (Label                          current_dir_label)
        (Label                          new_dir_label)
        (Label                          cur_dir_value)
    )

    (Resources
        (new_dir_input.TopOffset        4)
        (new_dir_input.BottomOffset     4)
        (new_dir_input.AlwaysHasFocus   True)
        (Cancel_button.Label            "Cancel")
        (OK_button.Label                "OK")
        (current_dir_label.Label        "Current Directory:")
        (current_dir_label.AttachLeft   True)
        (current_dir_label.Alignment    0)
        (new_dir_label.Label            "New Directory:")
        (new_dir_label.AttachLeft       True)
        (new_dir_label.Alignment        0)
        (cur_dir_value.Label            "/...")
        (cur_dir_value.AttachLeft       True)
        (cur_dir_value.AttachRight      True)
        (cur_dir_value.Alignment        0)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1 1) (Cols 1 1)
                current_dir_label
                OK_button
                cur_dir_value
                Cancel_button
                (Grid (Rows 1) (Cols 1 1)
                    new_dir_label
                    new_dir_input
                )
            )
        )
    )
)
