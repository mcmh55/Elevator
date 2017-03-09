unit FormMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  FraEVInsideNavigator, FraFloorNavigator;

type
  TFrmMain = class(TForm)
    EVInsideNavigator: TEVInsideNavigator;
    pnlInsideNaviArea1: TPanel;
    pnlInsideNaviTop1: TPanel;
    pnlUpDownState: TPanel;
    pnlCurrentFloor: TPanel;
    Frame1: TFrame1;
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

end.
