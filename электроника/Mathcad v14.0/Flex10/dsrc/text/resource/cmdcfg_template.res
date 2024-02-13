!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
! 
!  cmdcfg_template.res
! 
!  Command configuration, template
! 
!  Date      Release   Name  Ver.   Comments
!  --------- -------   ----  ----   --------
!  16-Feb-99 I-03-02   JJE   $$1    Group submission
!  08-Feb-00           JJE          Add setup bitmap
!  09-Feb-00 I-03-26+  JJE   $$2    Group Submission
!
!%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(Dialog dummy
    (Components
        (SubLayout                      cmdcfg_<template>)
    )

    (Resources
        (.Bitmap                        "setup")
        (.Layout
            (Grid (Rows 1) (Cols 1)
                cmdcfg_<template>
            )
        )
    )
)

(Layout cmdcfg_<template>
    (Components
        (SubLayout                      <template>_1)
        (SubLayout                      <template>_2)
    )

    (Resources
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1 1) (Cols 1)
                <template>_1
                <template>_2
            )
        )
    )
)

(Layout <template>_1
    (Components
        (Label                          LabelInvisible)
    )
    (Resources
        (LabelInvisible.Visible         False)
        (.Label                         "Locate Other Installation Directories (Optional)")
! (.Decorated  : USE True once visible components are added.
        (.Decorated                     False)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                LabelInvisible
            )
        )
    )
)

(Layout <template>_2
    (Components
        (Label                          LabelInvisible2)
    )
    (Resources
        (LabelInvisible2.Visible         False)
        (.Label                         "Optional Inputs")
! (.Decorated  : USE True once visible components are added.
        (.Decorated                     False)
        (.AttachLeft                    True)
        (.AttachRight                   True)
        (.TopOffset                     5)
        (.BottomOffset                  5)
        (.LeftOffset                    5)
        (.RightOffset                   5)
        (.Layout
            (Grid (Rows 1) (Cols 1)
                LabelInvisible2
            )
        )
    )
)

