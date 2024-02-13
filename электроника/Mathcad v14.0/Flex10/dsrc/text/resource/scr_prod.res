!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
!
!  scr_prod.res
! 
!  Screen Prod
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  16-Feb-99 I-03-02   JJE   $$1    Group submission
!  12-Mar-99           JJE          Tweaks
!  22-Mar-99           JJE          Set maxlen of Loadpoint
!  04-May-99           JJE          Redo the layout
!  11-May-99 I-03-09   JJE   $$2    Group Submission
!  12-Aug-99           JJE          No hyphen in subcomponent
!  17-Aug-99 I-03-12+  JJE   $$3    Group Submission
!  11-Nov-99           JJE          Add 2 chinese locales
!  16-Nov-99 I-03-21   JJE   $$4    Group Submission
!  09-Dec-99           JJE          Make desc uneditable
!  15-Dec-99 I-03-24   JJE   $$5    Group Submission
!  17-Dec-99           JJE          Add hp700 for mech
!  22-Dec-99 I-03-24+  JJE   $$6    Group Submission
!  15-Aug-00           TWH          Add hpux11_pa32 for intralink
!  16-Aug-00 I-03-32+  TWH   $$7    Group Submission
!  04-Jan-01 J-01-25   TWH   $$8    Add sun4_solaris_64/ia_64nt plat
!  11-Jan-01 J-01-25+  TWH   $$9    Fix ia64_nt name
!  16-Mar-01 I-03-38+  TWH   $$10   resizeable space avail labels 813485
!  05-Jun-01 J-01-33+  TWH   $$11   Add hpux_pa64
!  20-Feb-02 J-03-19+  TWH   $$12   Add sgi_elf4
!  30-SEP-02 J-03-34   MTP   $$13   Add i486_linux
!  31-Oct-02 J-03-35   JJE   $$14   Set CompDescTA.MaxLen
!  29-Apr-03 K-01-06   TWH   $$15   Rewrite
!  14-May-03 K-01-07   JJE   $$16   Update layout
!  02-Jun-03 K-01-07+  TWH   $$17   Fix loadpoint MaxLen
!  12-Mar-04 K-01-25   MAZ   $$18   Increase CompDescTA.MaxLen to 512
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout scr_prod
    (Components
        (SubLayout                      LpLayout)
        (SubLayout                      DiskSpaceLayout)
        (Tab                            ScrProdMainTab
                                        TreeView
                                        BlankView)
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
                (Grid (Rows 0) (Cols 1 0)
                    LpLayout
                    DiskSpaceLayout
                )
                ScrProdMainTab
            )
        )
    )
)

(Layout LpLayout
    (Components
        (Label                          LpLab)
        (PushButton                     LpBrowse)
        (OptionMenu                     LoadPoint)
        (Label                          LpReleaseLab)
    )

    (Resources
        (LpLab.Label                    "Destination Folder")
        (LpLab.Visible                  False)
        (LpLab.AttachLeft               True)
        (LpLab.AttachRight              True)
        (LpLab.Alignment                0)
        (LpBrowse.Bitmap                "UI dir open image")
        (LpBrowse.HelpText              "Browse for Installation Directory")
        (LpBrowse.AttachLeft            True)
        (LoadPoint.MaxLen               260)
        (LoadPoint.Editable             True)
        (LoadPoint.RightOffset          2)
        (LpReleaseLab.Label             "Dummy Label")
        (LpReleaseLab.AttachLeft        True)
        (LpReleaseLab.Alignment         0)
        (LpReleaseLab.Resizeable        True)
        (.Label                         "Destination Folder")
        (.Decorated                     True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.Layout
            (Grid (Rows 0 1 1) (Cols 1 0)
                LpLab
                (Pos 2 1)
                LoadPoint
                LpBrowse
                LpReleaseLab
            )
        )
    )
)

(Layout DiskSpaceLayout
    (Components
        (Label                          SpaceAvailLab)
        (Label                          SpaceReqLab)
    )

    (Resources
        (SpaceAvailLab.Label            "Available on C: 9999GB")
        (SpaceAvailLab.AttachLeft       True)
        (SpaceAvailLab.AttachRight      True)
        (SpaceAvailLab.Alignment        0)
        (SpaceAvailLab.Resizeable       True)
        (SpaceAvailLab.TruncateLabel    False)
        (SpaceReqLab.Label              "Required on C: 9999GB")
        (SpaceReqLab.AttachLeft         True)
        (SpaceReqLab.AttachRight        True)
        (SpaceReqLab.Alignment          0)
        (SpaceReqLab.Resizeable         True)
        (SpaceReqLab.TruncateLabel      False)
        (.Label                         "Disk Space")
        (.Decorated                     True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.Layout
            (Grid (Rows 1 1) (Cols 1)
                SpaceAvailLab
                SpaceReqLab
            )
        )
    )
)

(Layout TreeView
    (Components
        (Tree                           ProdTree)
        (TextArea                       CompDescTA)
        (Label                          ProdTreeLab)
    )

    (Resources
        (ProdTree.SelectionPolicy       2)
        (ProdTree.Rows                  16)
        (ProdTree.Columns               20)
        (ProdTree.TreeLinkStyle         95)
        (ProdTree.TreeDisplayRoot       False)
        (ProdTree.PopupHelpEnabled      1)
        (CompDescTA.Rows                2)
        (CompDescTA.Columns             15)
        (CompDescTA.MaxLen              512)
        (CompDescTA.Editable            False)
        (CompDescTA.Value               "Select a product feature to view its description.")
        (CompDescTA.Wrap                True)
        (CompDescTA.BackgroundColor     20)
        (CompDescTA.LeftOffset          2)
        (CompDescTA.ScrollBarsWhenNeeded True)
        (ProdTreeLab.Label              "Features to Install")
        (ProdTreeLab.AttachLeft         True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.Layout
            (Grid (Rows 0 1) (Cols 1 0)
                ProdTreeLab
                (Pos 2 1)
                ProdTree
                CompDescTA
            )
        )
    )
)


(Layout BlankView
    (Components
        (Label                          NoLabel)
    )

    (Resources
        (.Layout
            (Grid (Rows 1) (Cols 1)
                NoLabel
            )
        )
    )
)
