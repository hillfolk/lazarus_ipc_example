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
    Memo1: TMemo;
    SimpleIPCClient1: TSimpleIPCClient;
    procedure Button1Click(Sender: TObject);
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



procedure TForm1.Button1Click(Sender: TObject);
var
  stream: TStream;
begin
  SimpleIPCClient1.Active := True;
  SimpleIPCClient1.Connect;
  SimpleIPCClient1.SendStringMessage('SendMsg' + DateTimeToStr(Now));
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin

end;

end.

