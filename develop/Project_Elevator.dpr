program Project_Elevator;

uses
  Vcl.Forms,
  FormMain in 'View\FormMain.pas' {FrmMain},
  FrameEVInsideNavigator in 'View\FrameEVInsideNavigator.pas' {EVInsideNavigator: TFrame},
  FrameFloorNavigator in 'View\FrameFloorNavigator.pas' {FloorNavigator: TFrame},
  Constants in 'Common\Constants.pas',
  IFrameNavigator in 'View\IFrameNavigator.pas',
  FrameEVLocationNavigator in 'View\FrameEVLocationNavigator.pas' {EVLocationNavagator: TFrame},
  FrameTopNavigatorArea in 'View\FrameTopNavigatorArea.pas' {TopNavigatorArea: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
