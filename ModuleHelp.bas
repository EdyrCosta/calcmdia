Attribute VB_Name = "Module1"
Private Declare Function HtmlHelp Lib "HHCtrl.ocx" Alias "HTMLHelpA" _
    (ByVal hWndCaller As Long, _
     ByVal pszFile As String, _
     ByVal uCommand As Long, _
     dwData As Any) As Long

'definição de constantes usadas pela API

Public Const HELP_CONTEXT = &H1
Public Const HELP_QUIT = &H2
Public Const HELP_INDEX = &H3
Public Const HELP_HELPONHELP = &H4
Public Const HELP_SETINDEX = &H5
Public Const HELP_KEY = &H101
Public Const HELP_MULTIKEY = &H201

Public vHelp As String

