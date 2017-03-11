unit IFrameNavigator;

interface

uses
  Vcl.ExtCtrls;

type
  IFraNavigator = interface(IInterface)
  ['{79115A6C-0D1B-43FC-ACC4-4D3F1BAC7D1E}']
    procedure CreateNavigator();
    procedure InitBGPnls(BGPnl: TPanel; Idx, Left, Top: Integer);
  end;

implementation

end.
