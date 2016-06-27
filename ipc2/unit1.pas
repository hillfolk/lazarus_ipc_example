unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, simpleipc, FileUtil, Forms, Controls, Graphics, Dialogs,
  StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Memo1: TMemo;
    SimpleIPCServer1: TSimpleIPCServer;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure SimpleIPCServer1Message(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
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

procedure TForm1.FormCreate(Sender: TObject);
begin
  SimpleIPCServer1.Global:= True;
  SimpleIPCServer1.ServerID:= 'lazarus';
  SimpleIPCServer1.StartServer;
  SimpleIPCServer1.Active:=True;

  Timer1.Enabled:= True;
end;

procedure TForm1.SimpleIPCServer1Message(Sender: TObject);
begin
  Memo1.Lines.Add(SimpleIPCServer1.StringMessage );
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  SimpleIPCServer1.PeekMessage(1000,True);
end;

end.

