unit FormMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  FrameFloorNavigator, FrameEVLocationNavigator, FrameTopNavigatorArea, FrameEVNavigator;

type
  TFrmMain = class(TForm)
    EVInsideNavigator: TEVInsideNavigator;
    TopNavigatorArea: TTopNavigatorArea;
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
