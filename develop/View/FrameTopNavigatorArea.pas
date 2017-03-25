unit FrameTopNavigatorArea;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FrameEVLocationNavigator,
  FrameFloorNavigator, Vcl.StdCtrls, Vcl.ExtCtrls, Constants;

type
  TTopNavigatorArea = class(TFrame)
    EVLocationNavagator: TEVLocationNavagator;
    FloorNavigator: TFloorNavigator;

  private

  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}

{ TTopNavigatorArea }

constructor TTopNavigatorArea.Create(AOwner: TComponent);
begin
  inherited;

end;
end.
