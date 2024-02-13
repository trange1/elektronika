!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  lpcfg_rbm.res
! 
!  Lpcfg, rbm
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  16-Feb-99 I-03-02   JJE   $$1    Group submission
!  04-Mar-99           TWH          Add TextArea; Cosmetic chgs
!  23-Mar-99           JJE          Tweaks
!  30-Apr-99           JJE          Use image instead of Browse
!  11-May-99 I-03-09   JJE   $$2    Group Submission
!  09-Aug-00           MYA          Set maxlen of RunDir
!  23-Aug-00 J-01-15   TWH   $$3    Group Submission
!  09-Jun-03 K-01-08   TWH   $$4    Add instructions layout
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout lpcfg_rbm
    (Components
        (SubLayout                      lpcfg_rbm2)
        (Label                          Label2)
        (Label                          Label3)
        (Label                          Label4)
        (Label                          Label1)
        (SubLayout                      lpcfg_rbm3)
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
                Label2
                (Grid (Rows 1 1 1 1) (Cols 0)
                    Label1
                    lpcfg_rbm3
                    lpcfg_rbm2
                    Label4
                )
                Label3
            )
        )
    )
)

(Layout lpcfg_rbm2
    (Components
        (Label                          ProeCmdLab)
        (Label                          NumSessLab)
        (Label                          UpdIntLab)
        (Label                          RpcPortLab)
        (Label                          RunDirLab)
        (OptionMenu                     ProeCmd)
        (InputPanel                     NumSess)
        (InputPanel                     UpdInt)
        (InputPanel                     RpcPort)
        (InputPanel                     RunDir)
        (PushButton                     RunDirBrowse)
    )

    (Resources
        (ProeCmdLab.Label               "Pro/ENGINEER startup command")
        (ProeCmdLab.AttachRight         True)
        (ProeCmdLab.Alignment           1)
        (NumSessLab.Label               "Number of Pro/ENGINEER sessions")
        (NumSessLab.AttachRight         True)
        (NumSessLab.Alignment           1)
        (UpdIntLab.Label                "Status update interval (in seconds)")
        (UpdIntLab.AttachRight          True)
        (UpdIntLab.Alignment            1)
        (RpcPortLab.Label               "RPC communications number")
        (RpcPortLab.AttachRight         True)
        (RpcPortLab.Alignment           1)
        (RunDirLab.Label                "Directory to run in")
        (RunDirLab.AttachRight          True)
        (RunDirLab.Alignment            1)
        (RunDir.MaxLen                  260)
        (RunDirBrowse.Bitmap            "UI dir open image")
        (RunDirBrowse.AttachLeft        True)
        (RunDirBrowse.AttachRight       True)
        (RunDirBrowse.LeftOffset        0)
        (.Label                         "RBM Server Settings")
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
            (Grid (Rows 0 0 0 0 0) (Cols 0 0 0)
                ProeCmdLab
                ProeCmd
                (Pos 2 1)
                NumSessLab
                NumSess
                (Pos 3 1)
                UpdIntLab
                UpdInt
                (Pos 4 1)
                RpcPortLab
                RpcPort
                (Pos 5 1)
                RunDirLab
                RunDir
                RunDirBrowse
            )
        )
    )
)

(Layout lpcfg_rbm3
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
        (TextArea.BottomOffset          5)
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
