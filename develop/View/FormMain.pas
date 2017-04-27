unit FormMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  FrameFloorNavigator, FrameEVLocationNavigator, FrameTopNavigatorArea, FrameEVNavigator,
  FormMain.Presenter;

type
  TFrmMain = class(TForm)
    TopNavigatorArea: TTopNavigatorArea;
    EVInsideNavigator: TEVInsideNavigator;
    procedure FormShow(Sender: TObject);
  private
    FFormMainPresenter: IFormMainPresenter;
  public
    constructor Create(AOwner: TComponent); override;
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

constructor TFrmMain.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FFormMainPresenter := TFormMainPresenter.Create();
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
  FFormMainPresenter.CreateEVList();
end;

end.
