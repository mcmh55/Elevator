unit FraEVInsideNavigator;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TEVInsideNavigator = class(TFrame)
    pnlInsideNaviArea1: TPanel;
    pnlInsideNaviTop1: TPanel;
    pnlInsideRemoteCtrl: TPanel;
    comboxInsideNaviSelector: TComboBox;
    btnOpenDoor: TButton;
    btnCloseDoor: TButton;
    pnlUpDownState: TPanel;
    pnlCurrentFloor: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
