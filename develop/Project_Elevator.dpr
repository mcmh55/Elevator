program Project_Elevator;

uses
  Vcl.Forms,
  FormMain in 'View\FormMain.pas' {FrmMain},
  FrameFloorNavigator in 'View\FrameFloorNavigator.pas' {FloorNavigator: TFrame},
  Constants in 'Common\Constants.pas',
  IFrameNavigator in 'View\IFrameNavigator.pas',
  FrameEVLocationNavigator in 'View\FrameEVLocationNavigator.pas' {EVLocationNavagator: TFrame},
  FrameTopNavigatorArea in 'View\FrameTopNavigatorArea.pas' {TopNavigatorArea: TFrame},
  Arrays in 'Common\Arrays.pas',
  FrameEVNavigator in 'View\FrameEVNavigator.pas' {EVInsideNavigator: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
