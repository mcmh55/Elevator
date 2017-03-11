unit FrameEVInsideNavigator;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  IFrameNavigator;

type
  TEVInsideNavigator = class(TFrame, IFraNavigator)
    pnlInsideNaviArea1: TPanel;
    pnlInsideNaviTop1: TPanel;
    pnlInsideRemoteCtrl: TPanel;
    comboxInsideNaviSelector: TComboBox;
    btnOpenDoor: TButton;
    btnCloseDoor: TButton;
    pnlUpDownState: TPanel;
    pnlCurrentFloor: TPanel;
    lbCtrlName: TLabel;
    procedure btnOpenDoorMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnOpenDoorMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnCloseDoorMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnCloseDoorMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

  private
    procedure CreateNavigator();
    {$REGION 'Documentation'}
    /// <summary>
    ///   배경 Panel 셋팅
    /// </summary>
    {$ENDREGION}
    procedure InitBGPnls(BGPnl: TPanel; Idx, Left, Top: Integer);
    
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses
  Constants;

{$R *.dfm}

procedure TEVInsideNavigator.btnCloseDoorMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  (Sender as TButton).Caption := STATE_CLOSE_ON;
end;

procedure TEVInsideNavigator.btnCloseDoorMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  (Sender as TButton).Caption := STATE_CLOSE_OFF;
end;

procedure TEVInsideNavigator.btnOpenDoorMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  (Sender as TButton).Caption := STATE_OPEN_ON;
end;

procedure TEVInsideNavigator.btnOpenDoorMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  (Sender as TButton).Caption := STATE_OPEN_OFF;
end;

constructor TEVInsideNavigator.Create(AOwner: TComponent);
begin
  inherited;

end;

procedure TEVInsideNavigator.CreateNavigator;
begin

end;

procedure TEVInsideNavigator.InitBGPnls(BGPnl: TPanel; Idx, Left, Top: Integer);
begin

end;

end.
