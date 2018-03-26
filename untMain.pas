unit untMain;

interface

uses
     Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
     Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, Data.DB, FireDAC.Comp.Client,
     FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.StorageBin,
     Vcl.StdCtrls, Vcl.ComCtrls;

type
     TfrmMain = class(TForm)
          con: TFDConnection;
          cursor: TFDGUIxWaitCursor;
          qry: TFDQuery;
          DBGrid1: TDBGrid;
          DBNavigator1: TDBNavigator;
          ds: TDataSource;
          Button1: TButton;
          Memo1: TMemo;
          Label1: TLabel;
          Button2: TButton;
          Memo2: TMemo;
          Label2: TLabel;
          StatusBar1: TStatusBar;
          procedure Button1Click(Sender: TObject);
          procedure Button2Click(Sender: TObject);
     private
          { Private declarations }
     public
          { Public declarations }
     end;

var
     frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.Button1Click(Sender: TObject);
begin
     // Open and close database connection with run-time parameters
     if con.Connected then
     begin
          Button1.Caption := 'Open';
          //
          try
               con.Params.Clear;
               con.Close;
          except
               on E: Exception do
                    raise Exception.Create(E.Message);
          end;
          //
          Memo1.Enabled := not con.Connected;
          //
          Caption := Hint + ' - [ ' + 'Not Connected' + ' ]';
     end
     else
     begin
          Button1.Caption := 'Close';
          //
          try
               con.Params.Text := Memo1.Text;
               con.Open;
          except
               on E: Exception do
                    raise Exception.Create(E.Message);
          end;
          //
          Memo1.Enabled := not con.Connected;
          //
          Caption := Hint + ' - [ ' + 'Connected' + ' ]';
     end
end;

procedure TfrmMain.Button2Click(Sender: TObject);
begin
     // Open and close query with commands
     if con.Connected then
     begin
          if qry.Active then
          begin
               Button2.Caption := 'Open';
               //
               try
                    qry.SQL.Clear;
                    qry.Close;
               except
                    on E: Exception do
                         raise Exception.Create(E.Message);
               end;
               //
               Memo2.Enabled := not qry.Active;
               //
               StatusBar1.SimpleText := 'No record';
          end
          else
          begin
               Button2.Caption := 'Close';
               //
               try
                    qry.SQL.Text := Memo2.Text;
                    qry.Open;
               except
                    on E: Exception do
                         raise Exception.Create(E.Message);
               end;
               //
               Memo2.Enabled := not qry.Active;
               //
               StatusBar1.SimpleText := IntToStr(qry.RowsAffected) + ' record(s)';
          end;
     end
     else
          MessageDlg('Database not connected!', mtError, [mbOk], 0);
end;

end.
