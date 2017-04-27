unit FormMain.Model.Logic;

interface

uses
  Constants, Arrays,
  FormMain.Model.Bean;

type
  IFormLogic = interface(IInterface)
  ['{163F5B0A-0D46-4561-BCC2-358DB989FE3F}']

    procedure SetSelectedEVList(Sender: TObject);
  end;

  TFormLogic = class(TInterfacedObject, IFormLogic)
  public
    procedure SetSelectedEVList(Sender: TObject);
  end;

implementation

{ TFormLogic }

procedure TFormLogic.SetSelectedEVList(Sender: TObject);
var
  EVList: TIntegerArray;
begin
  // TODO -cRefactor : 컴포넌트(콤보박스)에 반복문으로 인덱스 값을 가져오는 것으로 변경
  SetLength(EVList, EV_COUNT);

  EVList[0] := 0;
  EVList[1] := 1;
  EVList[2] := 2;
  EVList[3] := 3;
  EVList[4] := 4;

  TFormBean.GetInstance().EVList := EVList;
end;

end.
