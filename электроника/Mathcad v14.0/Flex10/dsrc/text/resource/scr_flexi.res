!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  scr_flexi.res
! 
!  The flexi screen
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!                      TWH          Created
!  11-May-99 I-03-09   JJE   $$1    Group Submission
!  21-Jan-00           JJE          More text rows
!  26-Jan-00 I-03-26+  JJE   $$2    Group Submission
!  20-Jul-00           TWH          Rm Radio choice 2 (FW)
!  20-Jul-00 J-01-12+  JJE   $$3    Group Submission
!  28-Mar-02 J-03-22   JJE   $$4    Rearrange a bit
!  16-Jan-03 J-03-41   ALG   $$5    Set FileInput.MaxLen to 255
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout scr_flexi
    (Components
        (SubLayout                      scr_flexi2)
        (TextArea                       TextArea)
        (Label                          Label1)
        (Label                          Label2)
        (Label                          Label3)
        (Label                          Label4)
    )

    (Resources
        (TextArea.Rows                  11)
        (TextArea.Columns               25)
        (TextArea.MaxLen                300)
        (TextArea.Editable              False)
        (TextArea.Decorated             False)
        (TextArea.Wrap                  True)
        (TextArea.TopOffset             10)
        (TextArea.ScrollBarPosition     6)
        (TextArea.CaretVisible          False)
        (TextArea.ScrollBarsWhenNeeded  True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 0 0 1) (Cols 1 0 1)
                (Pos 1 2)
                Label4
                (Pos 2 2)
                TextArea
                (Pos 3 1)
                Label1
                scr_flexi2
                Label2
                (Pos 4 2)
                Label3
            )
        )
    )
)

(Layout scr_flexi2
    (Components
        (RadioGroup                     RadioGroup1)
        (Label                          FileLab)
        (InputPanel                     FileInput)
        (PushButton                     FileBrowse)
    )

    (Resources
        (RadioGroup1.Orientation        True)
        (RadioGroup1.Names              "1"
                                        "3")
        (RadioGroup1.Labels             "Import license information from disk."
                                        "Manually enter license information using a text editor")
        (FileLab.Label                  "License file path")
        (FileLab.AttachLeft             True)
        (FileLab.AttachRight            True)
        (FileLab.Alignment              1)
        (FileInput.MaxLen               255)
        (FileBrowse.Bitmap              "UI dir open image")
        (FileBrowse.AttachLeft          True)
        (FileBrowse.AttachRight         True)
        (FileBrowse.LeftOffset          0)
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
            (Grid (Rows 0 0) (Cols 1)
                (Grid (Rows 0) (Cols 1 1 0)
                    FileLab
                    FileInput
                    FileBrowse
                )
                RadioGroup1
            )
        )
    )
)
