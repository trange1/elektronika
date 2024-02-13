VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   4560
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7560
   LinkTopic       =   "Form1"
   ScaleHeight     =   4560
   ScaleWidth      =   7560
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton SaveWorksheet 
      Caption         =   "Save Worksheet"
      Height          =   375
      Left            =   6000
      TabIndex        =   14
      Top             =   480
      Width           =   1455
   End
   Begin VB.TextBox Text3 
      Height          =   285
      Left            =   4320
      TabIndex        =   13
      Text            =   "c:\TestMcad.mcd"
      Top             =   120
      Width           =   3135
   End
   Begin VB.CommandButton PassMtoX 
      Caption         =   "Pass M to X"
      Height          =   495
      Left            =   3120
      TabIndex        =   11
      Top             =   2760
      Width           =   1095
   End
   Begin VB.TextBox Text1 
      Height          =   375
      Left            =   1200
      TabIndex        =   8
      Text            =   "5"
      Top             =   360
      Width           =   495
   End
   Begin VB.CommandButton SendArray 
      Caption         =   "Send 3x1 Array to in0"
      Height          =   375
      Left            =   2040
      TabIndex        =   7
      Top             =   600
      Width           =   2055
   End
   Begin VB.TextBox Text2 
      Height          =   375
      Left            =   240
      TabIndex        =   6
      Text            =   "7"
      Top             =   360
      Width           =   495
   End
   Begin VB.CommandButton SendScalar 
      Caption         =   "Send Scalar to in0"
      Height          =   375
      Left            =   2040
      TabIndex        =   4
      Top             =   120
      Width           =   2055
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Quit"
      Height          =   375
      Left            =   6360
      TabIndex        =   1
      Top             =   960
      Width           =   1095
   End
   Begin VB.CommandButton SendMatrix 
      Caption         =   "Send 2x2 Matrix to in0"
      Height          =   375
      Left            =   2040
      TabIndex        =   0
      Top             =   1080
      Width           =   2055
   End
   Begin VB.Label Label4 
      Caption         =   "Mathcad Object Two"
      Height          =   255
      Left            =   4320
      TabIndex        =   12
      Top             =   1320
      Width           =   1815
   End
   Begin VB.OLE OLE2 
      Class           =   "Mathcad"
      Height          =   2655
      Left            =   4320
      OleObjectBlob   =   "PassVals.frx":0000
      TabIndex        =   10
      Top             =   1680
      Width           =   2895
   End
   Begin VB.Label Label1 
      Caption         =   "Imag Value"
      Height          =   255
      Left            =   1080
      TabIndex        =   9
      Top             =   120
      Width           =   855
   End
   Begin VB.Label Label3 
      Caption         =   "Real Value"
      Height          =   255
      Left            =   120
      TabIndex        =   5
      Top             =   120
      Width           =   975
   End
   Begin VB.OLE OLE1 
      Class           =   "Mathcad"
      Height          =   2655
      Left            =   240
      OleObjectBlob   =   "PassVals.frx":1A18
      TabIndex        =   3
      Top             =   1680
      Width           =   2775
   End
   Begin VB.Label Label2 
      Caption         =   "Mathcad Object One"
      Height          =   255
      Left            =   240
      TabIndex        =   2
      Top             =   1320
      Width           =   1815
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub PassMtoX_Click()
 Dim Mr, Mi As Variant
 
 'Set the respective Mathcad objects
 
 Set McadObj1 = OLE1.object
 Set McadObj2 = OLE2.object
 
 'get out0 from the first Mcad object,
 ' pass it to the second, then recalculate
 
 Call McadObj1.GetComplex("out0", Mr, Mi)
 Call McadObj2.SetComplex("in0", Mr, Mi)
 Call McadObj2.Recalculate
 
End Sub

Private Sub SaveWorksheet_Click()

'test the SaveAs method

  Set McadObj = OLE2.object
  McadObj.SaveAs (Text3.Text)
  
End Sub

Private Sub SendMatrix_Click()

 Dim Vr, Vi As Variant
 Dim Mr(1, 1), Mi(1, 1) As Variant
 Vr = Val(Text2.Text)
 Vi = Val(Text1.Text)

 Mr(0, 0) = Vr
 Mr(1, 0) = Vr
 Mr(0, 1) = Vr
 Mr(1, 1) = Vr
 Mi(0, 0) = Vi
 Mi(1, 0) = Vi
 Mi(0, 1) = Vi
 Mi(1, 1) = Vi

 Set McadObj = OLE1.object
 
 Call McadObj.SetComplex("in0", Mr, Mi)
 Call McadObj.Recalculate
 
End Sub

Private Sub Command2_Click()
'exit the program
 End
End Sub

Private Sub SendScalar_Click()
  Dim V As Variant
  Vr = Val(Text2.Text)
  Vi = Val(Text1.Text)
  
' Set the Mcad object, pass values and recalculate
  Set McadObj = OLE1.object
  Call McadObj.SetComplex("in0", Vr, Vi)
  Call McadObj.Recalculate
  
End Sub

Private Sub SendArray_Click()
 Dim Ar, Ai As Variant
 Dim V As Integer
 Vr = Val(Text2.Text)
 Vi = Val(Text1.Text)

 Ar = Array(Vr, Vr, Vr)
 Ai = Array(Vi, Vi, Vi)
 
' Set the Mcad object, pass values and recalculate

 Set McadObj = OLE1.object
 
 Call McadObj.SetComplex("in0", Ar, Ai)
 Call McadObj.Recalculate
 
End Sub

