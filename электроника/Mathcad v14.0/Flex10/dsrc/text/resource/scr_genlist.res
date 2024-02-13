!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  scr_genlist.res
! 
!  The genlist screen
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  09-Dec-98           AW           Created.
!  16-Feb-99 I-03-02   JJE   $$1    Group submission
!  19-Feb-99           TWH          Add AEDinfo, TA.Wrap
!  03-Mar-99           TWH          Add MaxLen and Rows to TA
!  23-Mar-99           JJE          Tweaks
!  01-Apr-99           MYA          Add rows  
!  04-May-99           JJE          Adjustments
!  11-May-99 I-03-09   JJE   $$2    Group Submission
!  10-Nov-00           JJE          Change visible rows to 11 from 10
!  10-Nov-00 J-01-20+  JJE   $$3    Group Submission
!  23-Jan-01           JJE          Change spacing for longer cmd names
!  23-Jan-01 J-01-26+  JJE   $$4    Group Submission
!  01-Apr-02 J-03-22   JJE   $$5    Make list bigger
!  16-Jan-03 J-03-41   ALG   $$6    Fix offsets of text area, buttons
!  09-Jun-03 K-01-08   TWH   $$7    Add instructions layout
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout scr_genlist
    (Components
        (SubLayout                      scr_genlist2)
        (Label                          Label1)
        (Label                          Label2)
        (Label                          Label3)
        (Label                          Label5)
        (SubLayout                      scr_genlist3)
    )

    (Resources
        (Label1.TopOffset               20)
        (Label1.BottomOffset            20)
        (Label2.LeftOffset              20)
        (Label3.RightOffset             20)
        (Label5.TopOffset               20)
        (Label5.BottomOffset            20)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.Layout
            (Grid (Rows 1) (Cols 1 1 1)
                Label2
                (Grid (Rows 1 1 1 1) (Cols 1)
                    Label5
                    scr_genlist3
                    scr_genlist2
                    Label1
                )
                Label3
            )
        )
    )
)

(Layout scr_genlist2
    (Components
        (List                           GenList)
        (PushButton                     AEDadd)
        (PushButton                     AEDedit)
        (PushButton                     AEDdel)
        (PushButton                     AEDinfo)
        (Label                          Label4)
    )

    (Resources
        (GenList.VisibleRows            11)
        (GenList.TabStops               12)
        (GenList.ListType               True)
        (GenList.MinRows                11)
        (GenList.DefaultColumnWidth     0)
        (AEDadd.Label                   "Add")
        (AEDadd.AttachLeft              True)
        (AEDadd.AttachRight             True)
        (AEDadd.BottomOffset            0)
        (AEDedit.Label                  "Edit")
        (AEDedit.AttachLeft             True)
        (AEDedit.AttachRight            True)
        (AEDedit.TopOffset              5)
        (AEDedit.BottomOffset           0)
        (AEDdel.Label                   "Delete")
        (AEDdel.AttachLeft              True)
        (AEDdel.AttachRight             True)
        (AEDdel.TopOffset               5)
        (AEDinfo.Label                  "Info")
        (AEDinfo.AttachLeft             True)
        (AEDinfo.AttachRight            True)
        (.Label                         "Advanced")
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1) (Cols 1 0)
                GenList
                (Grid (Rows 0 0 0 1 0) (Cols 0)
                    AEDadd
                    AEDedit
                    AEDdel
                    Label4
                    AEDinfo
                )
            )
        )
    )
)

(Layout scr_genlist3
    (Components
        (TextArea                       GenListTextArea)
    )

    (Resources
        (GenListTextArea.Rows           3)
        (GenListTextArea.Columns        27)
        (GenListTextArea.MaxLen         512)
        (GenListTextArea.Editable       False)
        (GenListTextArea.Decorated      False)
        (GenListTextArea.Wrap           True)
        (GenListTextArea.BottomOffset   5)
        (GenListTextArea.ScrollBarPosition 6)
        (GenListTextArea.CaretVisible   False)
        (GenListTextArea.ScrollBarsWhenNeeded True)
        (.Label                         "Instructions")
        (.Decorated                     True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                GenListTextArea
            )
        )
    )
)
