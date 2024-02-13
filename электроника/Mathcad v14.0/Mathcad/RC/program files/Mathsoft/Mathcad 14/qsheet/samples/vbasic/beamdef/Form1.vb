Public Class Form1
    Inherits System.Windows.Forms.Form

    'Dimension Objects using Intellisense
    Dim MC As Mathcad.Application
    Dim WK As Mathcad.Worksheets
    Dim WS As Mathcad.Worksheet

#Region " Windows Form Designer generated code "

    Public Sub New()
        MyBase.New()

        'This call is required by the Windows Form Designer.
        InitializeComponent()

        'Add any initialization after the InitializeComponent() call

    End Sub

    'Form overrides dispose to clean up the component list.
    Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
        If disposing Then
            If Not (components Is Nothing) Then
                components.Dispose()
            End If
        End If
        MyBase.Dispose(disposing)
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents Label3 As System.Windows.Forms.Label
    Friend WithEvents Label4 As System.Windows.Forms.Label
    Friend WithEvents MathcadPath As System.Windows.Forms.TextBox
    Friend WithEvents MaxStress As System.Windows.Forms.TextBox
    Friend WithEvents InputLoad As System.Windows.Forms.ComboBox
    Friend WithEvents CalculateButton As System.Windows.Forms.Button
    Friend WithEvents ExitButton As System.Windows.Forms.Button
    Friend WithEvents Label5 As System.Windows.Forms.Label
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.CalculateButton = New System.Windows.Forms.Button
        Me.ExitButton = New System.Windows.Forms.Button
        Me.MathcadPath = New System.Windows.Forms.TextBox
        Me.MaxStress = New System.Windows.Forms.TextBox
        Me.Label1 = New System.Windows.Forms.Label
        Me.Label2 = New System.Windows.Forms.Label
        Me.Label3 = New System.Windows.Forms.Label
        Me.Label4 = New System.Windows.Forms.Label
        Me.InputLoad = New System.Windows.Forms.ComboBox
        Me.Label5 = New System.Windows.Forms.Label
        Me.SuspendLayout()
        '
        'CalculateButton
        '
        Me.CalculateButton.Location = New System.Drawing.Point(56, 176)
        Me.CalculateButton.Name = "CalculateButton"
        Me.CalculateButton.Size = New System.Drawing.Size(88, 40)
        Me.CalculateButton.TabIndex = 0
        Me.CalculateButton.Text = "Calculate!"
        '
        'ExitButton
        '
        Me.ExitButton.Location = New System.Drawing.Point(192, 176)
        Me.ExitButton.Name = "ExitButton"
        Me.ExitButton.Size = New System.Drawing.Size(96, 40)
        Me.ExitButton.TabIndex = 1
        Me.ExitButton.Text = "Exit"
        '
        'MathcadPath
        '
        Me.MathcadPath.Location = New System.Drawing.Point(152, 24)
        Me.MathcadPath.Name = "MathcadPath"
        Me.MathcadPath.Size = New System.Drawing.Size(168, 20)
        Me.MathcadPath.TabIndex = 2
        Me.MathcadPath.Text = "C:\beamdef.mcd"
        '
        'MaxStress
        '
        Me.MaxStress.Enabled = False
        Me.MaxStress.Location = New System.Drawing.Point(152, 120)
        Me.MaxStress.Name = "MaxStress"
        Me.MaxStress.Size = New System.Drawing.Size(56, 20)
        Me.MaxStress.TabIndex = 4
        Me.MaxStress.Text = ""
        '
        'Label1
        '
        Me.Label1.Font = New System.Drawing.Font("Verdana", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.Location = New System.Drawing.Point(8, 24)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(144, 16)
        Me.Label1.TabIndex = 5
        Me.Label1.Text = "Path to Mathcad file:"
        '
        'Label2
        '
        Me.Label2.Font = New System.Drawing.Font("Verdana", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label2.Location = New System.Drawing.Point(64, 72)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(80, 23)
        Me.Label2.TabIndex = 6
        Me.Label2.Text = "Input load:"
        '
        'Label3
        '
        Me.Label3.Font = New System.Drawing.Font("Verdana", 9.75!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label3.Location = New System.Drawing.Point(24, 120)
        Me.Label3.Name = "Label3"
        Me.Label3.Size = New System.Drawing.Size(128, 23)
        Me.Label3.TabIndex = 7
        Me.Label3.Text = "Maximum stress:"
        '
        'Label4
        '
        Me.Label4.Font = New System.Drawing.Font("Verdana", 10.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label4.Location = New System.Drawing.Point(216, 120)
        Me.Label4.Name = "Label4"
        Me.Label4.Size = New System.Drawing.Size(48, 16)
        Me.Label4.TabIndex = 8
        Me.Label4.Text = "ksi"
        '
        'InputLoad
        '
        Me.InputLoad.Location = New System.Drawing.Point(152, 72)
        Me.InputLoad.Name = "InputLoad"
        Me.InputLoad.Size = New System.Drawing.Size(72, 21)
        Me.InputLoad.TabIndex = 9
        Me.InputLoad.Text = "ComboBox1"
        '
        'Label5
        '
        Me.Label5.Font = New System.Drawing.Font("Verdana", 9.75!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label5.Location = New System.Drawing.Point(232, 72)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(32, 16)
        Me.Label5.TabIndex = 10
        Me.Label5.Text = "lbf"
        '
        'Form1
        '
        Me.AutoScaleBaseSize = New System.Drawing.Size(5, 13)
        Me.ClientSize = New System.Drawing.Size(336, 238)
        Me.Controls.Add(Me.Label5)
        Me.Controls.Add(Me.InputLoad)
        Me.Controls.Add(Me.Label4)
        Me.Controls.Add(Me.Label3)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.MaxStress)
        Me.Controls.Add(Me.MathcadPath)
        Me.Controls.Add(Me.ExitButton)
        Me.Controls.Add(Me.CalculateButton)
        Me.Name = "Form1"
        Me.Text = "Mathcad Automation Example"
        Me.ResumeLayout(False)

    End Sub

#End Region

    Private Sub ExitButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ExitButton.Click

        'The Cleanup subroutine (see below) closes the application objects in the 
        '.NET Environment and releases the memory taken up by the Mathcad executable
        'Cleanup() is callaed only if a process was started.
        If IsNothing(MC) = False Then
            Cleanup()
        End If

        End

    End Sub


    Private Sub CalculateButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CalculateButton.Click

        'Dimension the force and file path variables used in the script
        Dim Load As Integer
        Dim Path As String

        'Extract the path to the Mathcad file from the first text box (MathcadPath)
        Path = MathcadPath.Text

        'Create the Mathcad application object if one does not already exist
        If IsNothing(MC) = True Then

            MC = CreateObject("Mathcad.Application")

            'Open the Mathcad sheet found at the specified path.  If the sheet is not found,
            'trap the error and return a message stating that it could not be found.  Allow 
            'the user to update the path
            Err.Number = 0
            On Error Resume Next
            WK = MC.Worksheets
            WS = WK.Open(Path)

            If Err.Number <> 0 Then
                MsgBox("File not found!")
                Exit Sub
            End If
            On Error GoTo 0

        End If

        'Assign the input value from the combobox (InputLoad) to the variable Load 
        Load = InputLoad.SelectedItem
        'Note that Load is currently cast as an integer.
            
        'Pass Load to the Mathcad sheet where it is bound to a Mathcad variable called F
        WS.SetValue("F", Load)

        'Extract the variable Smax from the Mathcad sheet, treat it as a string, and place 
        'it in the third text box (MaxStress), now enabled on the form
        MaxStress.Enabled = True
        MaxStress.Text = WS.GetValue("Smax").AsString

    End Sub
    Sub Cleanup()

        'Close the Mathcad application running in the background and do not prompt to save
        'changes
        WS.Close(Mathcad.MCSaveOption.mcDiscardChanges)
        System.Runtime.InteropServices.Marshal.ReleaseComObject(WK)
        System.Runtime.InteropServices.Marshal.ReleaseComObject(WS)
        System.Runtime.InteropServices.Marshal.ReleaseComObject(MC)

    End Sub
    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        'Populate the combobox with the desired loads available to the user 
        InputLoad.Items.Add("10")
        InputLoad.Items.Add("15")
        InputLoad.Items.Add("20")
        InputLoad.Items.Add("25")
        InputLoad.Items.Add("30")
        'The range of items could also be calculated based on the index, or
        'this could be a free entry text box, requiring error checking and 
        'type conversion.

        'ComboBox defaults to the first item on the list, 10 lbf
        InputLoad.SelectedIndex = 0

    End Sub
End Class
