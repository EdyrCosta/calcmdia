VERSION 5.00
Begin VB.Form Form2 
   Caption         =   "Cálculo de Médias Anual"
   ClientHeight    =   3765
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   7350
   Icon            =   "CalcMdiaAnual.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   ScaleHeight     =   3765
   ScaleWidth      =   7350
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command3 
      Caption         =   "Finalizar"
      Height          =   615
      Left            =   5040
      TabIndex        =   8
      Top             =   2400
      Width           =   1815
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Limpar"
      Height          =   615
      Left            =   5040
      TabIndex        =   7
      Top             =   1680
      Width           =   1815
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Calcular"
      Height          =   615
      Left            =   5040
      TabIndex        =   6
      Top             =   960
      Width           =   1815
   End
   Begin VB.TextBox Text4 
      Height          =   285
      Index           =   1
      Left            =   1440
      TabIndex        =   4
      Top             =   1800
      Width           =   1695
   End
   Begin VB.TextBox Text5 
      Height          =   285
      Index           =   0
      Left            =   1440
      TabIndex        =   3
      Top             =   2280
      Width           =   1695
   End
   Begin VB.TextBox Text3 
      Height          =   285
      Left            =   1440
      TabIndex        =   2
      Top             =   1320
      Width           =   1695
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   1440
      TabIndex        =   1
      Top             =   840
      Width           =   1695
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   1200
      TabIndex        =   0
      Top             =   360
      Width           =   3855
   End
   Begin VB.Label Label4 
      Caption         =   "Nota Bimestral 3"
      Height          =   255
      Left            =   120
      TabIndex        =   13
      Top             =   1800
      Width           =   2295
   End
   Begin VB.Label Label3 
      Caption         =   "Nota Bimestral 2"
      Height          =   255
      Index           =   1
      Left            =   120
      TabIndex        =   12
      Top             =   1320
      Width           =   1695
   End
   Begin VB.Label Label2 
      Caption         =   "Nota Bimestral 1"
      Height          =   255
      Index           =   0
      Left            =   120
      TabIndex        =   11
      Top             =   840
      Width           =   2895
   End
   Begin VB.Label Label1 
      Caption         =   "Nome"
      Height          =   255
      Index           =   1
      Left            =   120
      TabIndex        =   10
      Top             =   360
      Width           =   1095
   End
   Begin VB.Label Label5 
      Caption         =   "Nota Bimestral 4"
      Height          =   255
      Left            =   120
      TabIndex        =   9
      Top             =   2280
      Width           =   1455
   End
   Begin VB.Label Label6 
      Height          =   735
      Left            =   120
      TabIndex        =   5
      Top             =   2880
      Width           =   1935
   End
   Begin VB.Menu Exibir 
      Caption         =   "&Exibir"
      Index           =   1
      Begin VB.Menu Mensal 
         Caption         =   "&Mensal"
         Index           =   2
      End
   End
   Begin VB.Menu Ajuda 
      Caption         =   "&Ajuda"
      Index           =   3
      Begin VB.Menu Conteúdo 
         Caption         =   "&Conteúdo"
         Index           =   4
      End
      Begin VB.Menu Sobre 
         Caption         =   "&Sobre"
         Index           =   5
      End
   End
End
Attribute VB_Name = "Form2"
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


Private Sub Command1_Click()
    Dim Valor As Currency
    Dim N1, N2, N3, N4, Media, Title, Mens, Style, exibe As Integer
    N1 = Val(Text2.Text)
    N2 = Val(Text3.Text)
    N3 = Val(Text4(1).Text)
    N4 = Val(Text5(0).Text)
    Media = (N1 + N2 + N3 + N4) / 4
    Label6.Caption = Media
    If (Media > 5) Then
        Mens = "Aprovado"
        Style = vbExclamation
        Title = "Media Aprovado"
        exibe = MsgBox(Mens, Style, Title)
    Else
        Mens = "Reprovado: você tem que estudar mais né?"
        Style = vbCritical
        Title = "Media Reprovada"
        exibe = MsgBox(Mens, Style, Title)
    End If
End Sub

Private Sub Command2_Click()
    Text1.Text = ""
    Text2.Text = ""
    Text3.Text = ""
    Text4(1).Text = ""
    Text5(0).Text = ""
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

Private Sub Mensal_Click(Index As Integer)
    Form1.Show
    Form2.Hide
End Sub

Private Sub Sobre_Click(Index As Integer)
    frmAbout.Show
End Sub
