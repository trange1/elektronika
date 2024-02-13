!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  lpcfg_ole.res
! 
!  Lpcfg, ole
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  16-Feb-99 I-03-02   JJE   $$1    Group submission
!  04-Mar-99           TWH          Add TextArea,Cosmetic chgs
!  23-Mar-99           JJE          Tweaks
!  30-Apr-99           JJE          Use image instead of Browse
!  11-May-99 I-03-09   JJE   $$2    Group Submission
!  12-Jan-00           TWH          OptionMenus' uneditable
!  14-Feb-00 J-01-02   TWH   $$3    Group Submission
!  09-Aug-00           MYA          set max length of startup directory input
!  23-Aug-00 J-01-15   TWH   $$4    Group Submission
!  02-Jun-03 K-01-07+  TWH   $$5    Hide Command components
!  09-Jun-03 K-01-08   TWH   $$6    Add Instructions layout
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout lpcfg_ole
    (Components
        (SubLayout                      ProductConfigLayout)
        (SubLayout                      OleConfigLayout)
        (Label                          Label1)
        (Label                          Label3)
        (Label                          Label4)
        (Label                          Label2)
        (SubLayout                      lpcfg_ole3)
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
            (Grid (Rows 1) (Cols 1 0 1)
                Label1
                (Grid (Rows 1 1 1 1 1) (Cols 0)
                    Label2
                    lpcfg_ole3
                    ProductConfigLayout
                    OleConfigLayout
                    Label3
                )
                Label4
            )
        )
    )
)

(Layout ProductConfigLayout
    (Components
        (Label                          OleCommandLab)
        (Label                          OleStartDirLab)
        (Label                          OleProdLangLab)
        (OptionMenu                     OleProdLang)
        (OptionMenu                     OleCommand)
        (InputPanel                     OleStartDir)
        (PushButton                     OleStartDirBrowse)
    )

    (Resources
        (OleCommandLab.Label            "Startup command")
        (OleCommandLab.AttachRight      True)
        (OleCommandLab.Alignment        1)
        (OleCommandLab.Visible          False)
        (OleStartDirLab.Label           "Startup directory")
        (OleStartDirLab.AttachRight     True)
        (OleStartDirLab.Alignment       1)
        (OleProdLangLab.Label           "Language")
        (OleProdLangLab.AttachRight     True)
        (OleProdLangLab.Alignment       1)
        (OleStartDir.MaxLen             260)
        (OleStartDirBrowse.Bitmap       "UI dir open image")
        (OleStartDirBrowse.AttachLeft   True)
        (OleStartDirBrowse.AttachRight  True)
        (OleStartDirBrowse.LeftOffset   0)
        (OleCommand.Visible             False)
        (.Label                         "Pro/ENGINEER OLE Configuration")
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
            (Grid (Rows 1 1 1) (Cols 1 1 0)
                OleCommandLab
                OleCommand
                (Pos 2 1)
                OleStartDirLab
                OleStartDir
                OleStartDirBrowse
                OleProdLangLab
                OleProdLang
            )
        )
    )
)

(Layout OleConfigLayout
    (Components
        (Label                          OleSearchDirLab)
        (Label                          OleLangLab)
        (InputPanel                     OleSearchDir)
        (PushButton                     OleSearchDirBrowse)
        (OptionMenu                     OleLang)
    )

    (Resources
        (OleSearchDirLab.Label          "Start search directory")
        (OleSearchDirLab.AttachRight    True)
        (OleSearchDirLab.Alignment      1)
        (OleLangLab.Label               "Language")
        (OleLangLab.AttachRight         True)
        (OleLangLab.Alignment           1)
        (OleSearchDir.MaxLen            260)
        (OleSearchDirBrowse.Bitmap      "UI dir open image")
        (OleSearchDirBrowse.AttachLeft  True)
        (OleSearchDirBrowse.AttachRight True)
        (OleSearchDirBrowse.LeftOffset  0)
        (.Label                         "PTC OLE Server Configuration")
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
            (Grid (Rows 1 1) (Cols 1 1 0)
                OleSearchDirLab
                OleSearchDir
                OleSearchDirBrowse
                OleLangLab
                OleLang
            )
        )
    )
)

(Layout lpcfg_ole3
    (Components
        (TextArea                       TextArea)
    )

    (Resources
        (TextArea.Rows                  3)
        (TextArea.Columns               25)
        (TextArea.MaxLen                200)
        (TextArea.Editable              False)
        (TextArea.Decorated             False)
        (TextArea.Wrap                  True)
        (TextArea.ScrollBarPosition     6)
        (TextArea.CaretVisible          False)
        (TextArea.ScrollBarsWhenNeeded  True)
        (.Label                         "Instructions")
        (.Decorated                     True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                TextArea
            )
        )
    )
)
