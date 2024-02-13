!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  scr_optieadpt.res
! 
!  Optegra Info*Engine Adapter properties screen
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  20-Apr-00           MAZ          Created
!  26-Apr-00 I-03-28+  JJE          Group Submission
!  03-May-00           MAZ          Rm all log file comps
!  05-May-00 I-03-28+  JJE   $$1    Group Submission
!  08-Sep-00           DAR          Add Adapter Port Number
!  18-Sep-00 J-01-18   TWH   $$2    Group Submission
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout scr_optieadpt
    (Components
        (SubLayout                      scr_optieadpt2)
        (TextArea                       TextArea)
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
            (Grid (Rows 0 0 1) (Cols 1)
                TextArea
                scr_optieadpt2
                Label1
            )
        )
    )
)

(Layout scr_optieadpt2
    (Components
        (InputPanel                     AdapterHost)
        (Label                          HostnameLab)
        (InputPanel                     listenerPort)
        (Label                          ListenerPortLab)
        (InputPanel                     OracleSID)
        (Label                          OracleSIDLab)
        (Label                          AdapterPortLab)
        (InputPanel                     AdapterPort)
    )

    (Resources
        (AdapterHost.MaxLen             255)
        (AdapterHost.AutoHighlight      True)
        (HostnameLab.Label              "Optegra Vault Host Name")
        (HostnameLab.AttachRight        True)
        (HostnameLab.Alignment          1)
        (listenerPort.MaxLen            255)
        (listenerPort.Integer           1521)
        (listenerPort.MinInteger        0)
        (listenerPort.MaxInteger        99999)
        (listenerPort.InputType         2)
        (listenerPort.AutoHighlight     True)
        (ListenerPortLab.Label          "Optegra Vault Oracle Listener Port Number")
        (ListenerPortLab.AttachRight    True)
        (ListenerPortLab.Alignment      1)
        (OracleSID.MaxLen               255)
        (OracleSID.AutoHighlight        True)
        (OracleSIDLab.Label             "Optegra Vault Oracle SID")
        (OracleSIDLab.AttachRight       True)
        (OracleSIDLab.Alignment         1)
        (AdapterPortLab.Label           "Optegra Info*Engine Adapter Port Number")
        (AdapterPortLab.AttachRight     True)
        (AdapterPort.MaxLen             255)
        (AdapterPort.Integer            6001)
        (AdapterPort.MinInteger         0)
        (AdapterPort.MaxInteger         99999)
        (AdapterPort.InputType          2)
        (AdapterPort.AutoHighlight      True)
        (.Label                         "Optegra Info*Engine Adapter Settings")
        (.Decorated                     True)
        (.AttachTop                     True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1 1 1) (Cols 1 1)
                HostnameLab
                AdapterHost
                ListenerPortLab
                listenerPort
                OracleSIDLab
                OracleSID
                AdapterPortLab
                AdapterPort
            )
        )
    )
)
