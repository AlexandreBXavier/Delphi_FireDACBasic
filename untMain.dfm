object frmMain: TfrmMain
  Left = 0
  Top = 0
  Hint = 'Main FireDAC'
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Main FireDAC'
  ClientHeight = 422
  ClientWidth = 615
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 104
    Height = 13
    Caption = 'Database Parameters'
  end
  object Label2: TLabel
    Left = 208
    Top = 8
    Width = 33
    Height = 13
    Caption = 'Query '
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 173
    Width = 615
    Height = 230
    Align = alBottom
    DataSource = ds
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 148
    Width = 615
    Height = 25
    DataSource = ds
    Align = alBottom
    TabOrder = 1
    ExplicitLeft = 8
    ExplicitTop = 96
  end
  object Button1: TButton
    Left = 118
    Top = 117
    Width = 75
    Height = 25
    Caption = 'Open'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 27
    Width = 185
    Height = 89
    Lines.Strings = (
      'DriverID=MSSQL'
      'Server=127.0.0.1'
      'Database=Samples'
      'OSAuthent=No'
      'User_Name=sa'
      'Password=mypass')
    TabOrder = 3
  end
  object Button2: TButton
    Left = 532
    Top = 117
    Width = 75
    Height = 25
    Caption = 'Open'
    TabOrder = 4
    OnClick = Button2Click
  end
  object Memo2: TMemo
    Left = 208
    Top = 27
    Width = 399
    Height = 89
    Lines.Strings = (
      'SELECT *'
      'FROM Contacts (NOLOCK)')
    TabOrder = 5
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 403
    Width = 615
    Height = 19
    Panels = <>
    SimplePanel = True
    ExplicitLeft = 400
    ExplicitTop = 136
    ExplicitWidth = 0
  end
  object con: TFDConnection
    Params.Strings = (
      '')
    LoginPrompt = False
    Left = 288
    Top = 8
  end
  object cursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 320
    Top = 8
  end
  object qry: TFDQuery
    Connection = con
    SQL.Strings = (
      '')
    Left = 352
    Top = 8
  end
  object ds: TDataSource
    DataSet = qry
    Left = 384
    Top = 8
  end
end
