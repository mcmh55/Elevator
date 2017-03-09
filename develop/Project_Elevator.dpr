program Project_Elevator;

uses
  Vcl.Forms,
  FormMain in 'View\FormMain.pas' {FrmMain},
  FraEVInsideNavigator in 'View\FraEVInsideNavigator.pas' {EVInsideNavigator: TFrame},
  FraFloorNavigator in 'View\FraFloorNavigator.pas' {Frame1: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
