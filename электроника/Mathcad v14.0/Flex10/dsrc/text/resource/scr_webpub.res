!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  scr_webpub.res
! 
!  Webpub properties screen
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  30-Apr-99           JJE          Use image instead of Browse
!  11-May-99 I-03-09   JJE   $$1    Group Submission
!  03-Oct-00           JJE          Increase length for path inputs
!  03-Oct-00 J-01-19   JJE   $$2    Group Submission
!  06-Dec-02 J-03-39   JJE   $$3    SPR 991913: Remove TextArea since it was blank
!  09-Jun-03 K-01-08   TWH   $$4    Add instructions layout
!  06-Nov-03 K-01-18   MAZ   $$5    Fix the Label value
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Layout scr_webpub
    (Components
        (SubLayout                      scr_webpub2)
        (Label                          Label1)
        (SubLayout                      scr_webpub3)
        (Label                          Label2)
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
            (Grid (Rows 0 1 0 1) (Cols 1)
                scr_webpub3
                Label2
                scr_webpub2
                Label1
            )
        )
    )
)

(Layout scr_webpub2
    (Components
        (Label                          Label3)
        (Label                          Label4)
        (Label                          Label5)
        (InputPanel                     CgiBinDir)
        (PushButton                     CgiBinDirBrowse)
        (InputPanel                     MimeFile)
        (PushButton                     MimeFileBrowse)
        (InputPanel                     RootDir)
        (PushButton                     RootDirBrowse)
    )

    (Resources
        (Label3.Label                   "Cgi-bin Directory")
        (Label3.AttachLeft              True)
        (Label3.AttachBottom            True)
        (Label3.BottomOffset            2)
        (Label4.Label                   "Web Server MIME File")
        (Label4.AttachLeft              True)
        (Label4.AttachBottom            True)
        (Label4.BottomOffset            2)
        (Label5.Label                   "Document Root Directory")
        (Label5.AttachLeft              True)
        (Label5.AttachBottom            True)
        (Label5.BottomOffset            2)
        (CgiBinDir.MaxLen               260)
        (CgiBinDir.AttachTop            True)
        (CgiBinDir.AttachBottom         True)
        (CgiBinDir.BottomOffset         5)
        (CgiBinDirBrowse.Bitmap         "UI dir open image")
        (CgiBinDirBrowse.AttachLeft     True)
        (CgiBinDirBrowse.AttachRight    True)
        (CgiBinDirBrowse.LeftOffset     2)
        (MimeFile.MaxLen                260)
        (MimeFile.AttachTop             True)
        (MimeFile.AttachBottom          True)
        (MimeFile.BottomOffset          5)
        (MimeFileBrowse.Bitmap          "UI dir open image")
        (MimeFileBrowse.AttachLeft      True)
        (MimeFileBrowse.AttachRight     True)
        (MimeFileBrowse.LeftOffset      2)
        (RootDir.MaxLen                 260)
        (RootDir.AttachTop              True)
        (RootDir.AttachBottom           True)
        (RootDir.BottomOffset           5)
        (RootDirBrowse.Bitmap           "UI dir open image")
        (RootDirBrowse.AttachLeft       True)
        (RootDirBrowse.AttachRight      True)
        (RootDirBrowse.LeftOffset       2)
        (.Label                         "Pro/Web.Publish Configuration")
        (.Decorated                     True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.Alignment                     2)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1 1 1 1 1) (Cols 1 0)
                (Grid (Rows 1) (Cols 1 1)
                    Label3
                )
                (Pos 2 1)
                CgiBinDir
                CgiBinDirBrowse
                (Grid (Rows 1) (Cols 1 1)
                    Label4
                )
                (Pos 4 1)
                MimeFile
                MimeFileBrowse
                (Grid (Rows 1) (Cols 1 1)
                    Label5
                )
                (Pos 6 1)
                RootDir
                RootDirBrowse
            )
        )
    )
)

(Layout scr_webpub3
    (Components
        (TextArea                       TextArea1)
    )

    (Resources
        (TextArea1.Rows                 3)
        (TextArea1.MaxLen               512)
        (TextArea1.Editable             False)
        (TextArea1.Decorated            False)
        (TextArea1.Wrap                 True)
        (TextArea1.BottomOffset         5)
        (TextArea1.ScrollBarPosition    6)
        (TextArea1.CaretVisible         False)
        (TextArea1.ScrollBarsWhenNeeded True)
        (.Label                         "Instructions")
        (.Decorated                     True)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.AttachTop                     True)
        (.AttachBottom                  True)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                TextArea1
            )
        )
    )
)
