VERSION 5.00
Begin VB.Form DnutForm 
   Caption         =   "Doughnut Analysis"
   ClientHeight    =   7650
   ClientLeft      =   1365
   ClientTop       =   1200
   ClientWidth     =   4920
   Icon            =   "DnutForm.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   7650
   ScaleWidth      =   4920
   Begin VB.CommandButton SaveButton 
      Caption         =   "Save Doughnut"
      Height          =   495
      Left            =   3000
      TabIndex        =   5
      Top             =   6120
      Width           =   1455
   End
   Begin VB.TextBox FilePathTextBox 
      Height          =   285
      Left            =   480
      TabIndex        =   4
      Text            =   "c:\doughnut.mcd"
      Top             =   6240
      Width           =   2175
   End
   Begin VB.CommandButton HelpButton 
      Caption         =   "HELP"
      Height          =   495
      Left            =   2760
      TabIndex        =   7
      Top             =   6960
      Width           =   1935
   End
   Begin VB.TextBox InTextBoxTurns 
      Height          =   285
      Left            =   1680
      TabIndex        =   1
      Text            =   "5"
      Top             =   840
      Width           =   855
   End
   Begin VB.TextBox InTextBoxTwists 
      Height          =   285
      Left            =   480
      TabIndex        =   0
      Text            =   "4"
      Top             =   840
      Width           =   855
   End
   Begin VB.CommandButton CancelButton 
      Caption         =   "CANCEL"
      Height          =   495
      Left            =   240
      TabIndex        =   6
      Top             =   6960
      Width           =   1935
   End
   Begin VB.CommandButton GoButton 
      BackColor       =   &H80000004&
      Caption         =   "Make Doughnut"
      Height          =   495
      Left            =   3000
      MaskColor       =   &H00FF8080&
      TabIndex        =   2
      Top             =   720
      Width           =   1455
   End
   Begin VB.TextBox OutTextBoxDonRad 
      Height          =   285
      Left            =   2760
      Locked          =   -1  'True
      TabIndex        =   9
      TabStop         =   0   'False
      Top             =   5160
      Width           =   1695
   End
   Begin VB.TextBox OutTextBoxTubeRad 
      Height          =   285
      Left            =   480
      Locked          =   -1  'True
      TabIndex        =   8
      TabStop         =   0   'False
      Top             =   5160
      Width           =   1695
   End
   Begin VB.Label Label8 
      Caption         =   "Doughnut file path"
      Height          =   255
      Left            =   480
      TabIndex        =   17
      Top             =   6000
      Width           =   1695
   End
   Begin VB.Shape Shape3 
      Height          =   855
      Left            =   240
      Top             =   5880
      Width           =   4455
   End
   Begin VB.OLE MathcadOLEObject 
      Class           =   "Mathcad"
      Height          =   2175
      Left            =   240
      OleObjectBlob   =   "DnutForm.frx":0442
      TabIndex        =   3
      Top             =   2040
      Width           =   4455
   End
   Begin VB.Label Label7 
      Caption         =   "Outputs"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   2160
      TabIndex        =   16
      Top             =   4440
      Width           =   975
   End
   Begin VB.Label Label6 
      Caption         =   "Embedded Mathcad Object"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   960
      TabIndex        =   15
      Top             =   1680
      Width           =   3135
   End
   Begin VB.Shape Shape2 
      Height          =   855
      Left            =   240
      Top             =   4800
      Width           =   4455
   End
   Begin VB.Label Label5 
      Caption         =   "Inputs"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   2160
      TabIndex        =   14
      Top             =   120
      Width           =   735
   End
   Begin VB.Label Label4 
      Caption         =   "Turns"
      Height          =   255
      Left            =   1680
      TabIndex        =   13
      Top             =   600
      Width           =   1095
   End
   Begin VB.Shape Shape1 
      Height          =   975
      Left            =   240
      Top             =   480
      Width           =   4455
   End
   Begin VB.Label Label3 
      Caption         =   "Twists"
      Height          =   255
      Left            =   480
      TabIndex        =   12
      Top             =   600
      Width           =   735
   End
   Begin VB.Label Label2 
      Caption         =   "Radius of doughnut"
      Height          =   255
      Left            =   2760
      TabIndex        =   10
      Top             =   4920
      Width           =   1455
   End
   Begin VB.Label Label1 
      Caption         =   "Radius of tube"
      Height          =   255
      Left            =   480
      TabIndex        =   11
      Top             =   4920
      Width           =   1095
   End
End
Attribute VB_Name = "DnutForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub GoButton_Click()

  Dim In0Re, In0Im, In1Re, In1Im As Variant
  Dim Out0Re, Out0Im, Out1Re, Out1Im As Variant
  Dim Twists, Turns As String
  
  Twists = InTextBoxTwists.Text
  Turns = InTextBoxTurns.Text
  
  If Not (IsNumeric(Twists) And IsNumeric(Turns)) Then
  
    Call ErrorInInputs
     
  Else
  
    In0 = CDbl(Twists)
    In1 = CDbl(Turns)

    Set MathcadObj = MathcadOLEObject.object
    Call MathcadObj.SetComplex("in0", In0, 0)
    Call MathcadObj.SetComplex("in1", In1, 0)
    Call MathcadObj.Recalculate
    Call MathcadObj.GetComplex("out0", Out0Re, Out0Im)
    Call MathcadObj.GetComplex("out1", Out1Re, Out1Im)
    
    OutTextBoxTubeRad.Text = Out0Re
    OutTextBoxDonRad.Text = Out1Re
    
  End If
  
  
End Sub

Private Sub CancelButton_Click()
  Unload DnutForm
End Sub

Private Sub HelpButton_Click()
  Call MsgBox("Help is not available. Try eating a doughnut instead.", , "Doughnut Help")
End Sub

Private Sub SaveButton_Click()
  Set MathcadObj = MathcadOLEObject.object
  Call MathcadObj.SaveAs(FilePathTextBox.Text)
  Call MsgBox("Mathcad worksheet has been saved to file " & FilePathTextBox.Text, , "Doughnut File Save")
End Sub

Sub ErrorInInputs()
  Call MsgBox("ERROR: Twists and turns must be numeric.", , "Doughnut Error")
End Sub
