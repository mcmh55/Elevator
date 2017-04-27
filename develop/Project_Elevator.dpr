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
  FrameEVNavigator in 'View\FrameEVNavigator.pas' {EVInsideNavigator: TFrame},
  EleVator.Model.Bean in 'Model\EleVator.Model.Bean.pas',
  FormMain.Presenter in 'Presenter\FormMain.Presenter.pas',
  Elevator.Presenter in 'Presenter\Elevator.Presenter.pas',
  FormMain.Model.Logic in 'Model\FormMain.Model.Logic.pas',
  FormMain.Model.Bean in 'Model\FormMain.Model.Bean.pas',
  EleVator.Model.Logic in 'Model\EleVator.Model.Logic.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
