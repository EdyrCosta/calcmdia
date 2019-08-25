VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Cálculo de Médias"
   ClientHeight    =   3675
   ClientLeft      =   3030
   ClientTop       =   2190
   ClientWidth     =   4680
   HelpContextID   =   1
   Icon            =   "CalcMdia.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MouseIcon       =   "CalcMdia.frx":0442
   ScaleHeight     =   3675
   ScaleWidth      =   4680
   WhatsThisButton =   -1  'True
   WhatsThisHelp   =   -1  'True
   Begin VB.CommandButton Command3 
      Caption         =   "Finalizar"
      Height          =   495
      Left            =   2760
      TabIndex        =   13
      Top             =   2040
      Width           =   1455
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Limpar"
      Height          =   495
      Left            =   2760
      TabIndex        =   12
      Top             =   1440
      Width           =   1455
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Calcular"
      Height          =   495
      Left            =   2760
      TabIndex        =   11
      Top             =   840
      Width           =   1455
   End
   Begin VB.TextBox Text5 
      Height          =   285
      Left            =   960
      TabIndex        =   9
      Top             =   2040
      Width           =   615
   End
   Begin VB.TextBox Text4 
      Height          =   285
      Left            =   960
      TabIndex        =   7
      Top             =   1560
      Width           =   615
   End
   Begin VB.TextBox Text3 
      Height          =   285
      Left            =   960
      TabIndex        =   5
      Top             =   1080
      Width           =   615
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   960
      TabIndex        =   3
      Top             =   600
      Width           =   615
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   960
      TabIndex        =   1
      Top             =   120
      Width           =   2895
   End
   Begin VB.Label Label6 
      Height          =   495
      Left            =   120
      TabIndex        =   10
      Top             =   2760
      Width           =   1695
   End
   Begin VB.Label Label5 
      Caption         =   "4ª Nota"
      Height          =   255
      Left            =   120
      TabIndex        =   8
      Top             =   2040
      Width           =   735
   End
   Begin VB.Label Label4 
      Caption         =   "3ª Nota"
      Height          =   255
      Left            =   120
      TabIndex        =   6
      Top             =   1560
      Width           =   735
   End
   Begin VB.Label Label3 
      Caption         =   "2ª Nota"
      Height          =   255
      Left            =   120
      TabIndex        =   4
      Top             =   1080
      Width           =   735
   End
   Begin VB.Label Label2 
      Caption         =   "1ª Nota"
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   600
      Width           =   1215
   End
   Begin VB.Label Label1 
      Caption         =   "Nome"
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   2295
   End
   Begin VB.Menu Exibir 
      Caption         =   "&Exibir"
      Index           =   1
      WindowList      =   -1  'True
      Begin VB.Menu Anual 
         Caption         =   "&Anual"
         Index           =   2
      End
   End
   Begin VB.Menu Ajuda 
      Caption         =   "&Ajuda"
      Index           =   1
      Begin VB.Menu Conteúdo 
         Caption         =   "&Conteúdo"
         Index           =   2
      End
      Begin VB.Menu Sobre 
         Caption         =   "&Sobre"
         Index           =   3
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Declare Function HtmlHelp Lib "HHCtrl.ocx" Alias "HtmlHelpA" _
     (ByVal hWndCaller As Long, _
      ByVal pszFile As String, _
      ByVal uCommand As Long, _
      dwData As Any) As Long

Const HH_DISPLAY_TOPIC As Long = 0
Const HH_HELP_CONTEXT As Long = &HF

Private Sub Anual_Click(Index As Integer)
    Form2.Show
    Form1.Hide
End Sub

Private Sub Command1_Click()
    Dim N1, N2, N3, N4, Media, Mens, Style, title, exibe As Integer
    N1 = Val(Text2.Text)
    N2 = Val(Text3.Text)
    N3 = Val(Text4.Text)
    N4 = Val(Text5.Text)
    Media = (N1 + N2 + N3 + N4) / 4
    Label6.Caption = Media
    If (Media >= 5) Then
        Mens = "Aprovado"
        Style = vbOKOnly
        title = "Media"
        exibe = MsgBox(Mens, Style, title)
    Else
        Mens = "Reprovado"
        Style = vbCritical
        title = "Media"
        exibe = MsgBox(Mens, Style, title)
    End If
End Sub

Private Sub Command2_Click()
    Text1.Text = ""
    Text2.Text = ""
    Text3.Text = ""
    Text4.Text = ""
    Text5.Text = ""
    Label6.Caption = ""
    Text1.SetFocus
End Sub

Private Sub Command3_Click()
    End
End Sub

Private Sub Conteúdo_Click(Index As Integer)
     HtmlHelp hWnd, "CalcHelp.chm", HH_DISPLAY_TOPIC, ByVal "Conteúdo.htm"
     HtmlHelp hWnd, "CalcHelp.chm", HH_HELP_CONTEXT, ByVal 100&
End Sub

Private Sub Form_Load()
    ChDir App.Path & "\Ajuda\"
End Sub


Private Sub Sobre_Click(Index As Integer)
    frmAbout.Show
End Sub
