!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  scr_ieopt.res
! 
!  IE optegra gateway screen
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  17-Apr-00           MAZ          Created
!  26-Apr-00 I-03-28+  JJE          Group Submission
!  05-May-00           MAZ          Rm ie.prop comps and change Labels
!  05-May-00 I-03-28+  JJE   $$1    Group Submission
!  26-Oct-00           TWH          make scr_ieopt3 label generic
!  26-Oct-00 J-01-20+  TWH   $$2    Group Submission
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout scr_ieopt
    (Components
        (SubLayout                      scr_ieopt2)
        (TextArea                       TextArea)
        (SubLayout                      scr_ieopt3)
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
            (Grid (Rows 0 0 1 1) (Cols 1)
                TextArea
                scr_ieopt2
                scr_ieopt3
                Label1
            )
        )
    )
)

(Layout scr_ieopt2
    (Components
        (InputPanel                     TempRoot)
        (Label                          TempRootLab)
        (InputPanel                     TaskRoot)
        (Label                          TaskRootLab)
        (PushButton                     TempRootBrowse)
        (PushButton                     TaskRootBrowse)
    )

    (Resources
        (TempRoot.MaxLen                255)
        (TempRoot.AutoHighlight         True)
        (TempRootLab.Label              "Template Processor HTML Directory")
        (TempRootLab.AttachRight        True)
        (TempRootLab.Alignment          1)
        (TaskRoot.MaxLen                255)
        (TaskRoot.AutoHighlight         True)
        (TaskRootLab.Label              "Task Processor XML Directory")
        (TaskRootLab.AttachRight        True)
        (TaskRootLab.Alignment          1)
        (TempRootBrowse.Bitmap          "UI dir open image")
        (TaskRootBrowse.Bitmap          "UI dir open image")
        (.Label                         "Windchill Info*Engine Server Settings")
        (.Decorated                     True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.TopOffset                     5)
        (.BottomOffset                  10)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1) (Cols 1 1 1)
                TempRootLab
                TempRoot
                TempRootBrowse
                TaskRootLab
                TaskRoot
                TaskRootBrowse
            )
        )
    )
)

(Layout scr_ieopt3
    (Components
        (Label                          AdapterHostLab)
        (InputPanel                     AdapterHost)
        (Label                          AdapterPortLab)
        (InputPanel                     AdapterPort)
    )

    (Resources
        (AdapterHostLab.Label           "Adapter Host")
        (AdapterHost.MaxLen             255)
        (AdapterPortLab.Label           "Adapter Port")
        (AdapterPort.MinInteger         0)
        (AdapterPort.MaxInteger         90000)
        (AdapterPort.InputType          2)
        (.Label                         "Info*Engine Adapter Settings")
        (.Decorated                     True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.TopOffset                     10)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1) (Cols 1 1)
                AdapterHostLab
                AdapterHost
                AdapterPortLab
                AdapterPort
            )
        )
    )
)
