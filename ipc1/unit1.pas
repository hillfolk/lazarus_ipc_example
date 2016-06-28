unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, simpleipc, FileUtil, Forms, Controls, Graphics, Dialogs,
  ExtCtrls, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    SimpleIPCClient1: TSimpleIPCClient;
    ToggleBox1: TToggleBox;
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ToggleBox1Change(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }



procedure TForm1.Button1Click(Sender: TObject);
var
  stream: TStream;
begin
  if SimpleIPCClient1.ServerRunning and SimpleIPCClient1.Active then
    SimpleIPCClient1.SendStringMessage(Edit1.Text);

end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin

end;

procedure TForm1.ToggleBox1Change(Sender: TObject);
begin
  SimpleIPCClient1.Active := ToggleBox1.Checked;
  if SimpleIPCClient1.Active then
  begin
    SimpleIPCClient1.Connect;
  end
  else
  begin
    SimpleIPCClient1.Disconnect;
  end;

end;

end.

