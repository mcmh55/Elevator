unit FormMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  FrameEVInsideNavigator, FrameFloorNavigator, FrameEVLocationNavigator,
  FrameTopNavigatorArea;

type
  TFrmMain = class(TForm)
    EVInsideNavigator: TEVInsideNavigator;
    pnlInsideNaviArea1: TPanel;
    pnlInsideNaviTop1: TPanel;
    pnlUpDownState: TPanel;
    pnlCurrentFloor: TPanel;
    TopNavigatorArea: TTopNavigatorArea;
    FloorNavigator: TFloorNavigator;
    EVLocationNavagator: TEVLocationNavagator;
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
