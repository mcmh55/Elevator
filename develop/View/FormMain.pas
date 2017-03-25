unit FormMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  FrameFloorNavigator, FrameEVLocationNavigator, FrameTopNavigatorArea, FrameEVNavigator;

type
  TFrmMain = class(TForm)
    TopNavigatorArea: TTopNavigatorArea;
    EVInsideNavigator: TEVInsideNavigator;
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
