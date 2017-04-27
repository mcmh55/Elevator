unit EleVator.Model.Logic;

interface

uses
  System.SysUtils,
  Arrays,
  EleVator.Model.Bean;

type
  EEVBeanLogicException = class(Exception);

  IEVBeanLogic = interface(IInterface)
  ['{35D9FA48-D786-47C7-890F-731A370397AA}']

    function GetConvertToEVTypeList(SetSelectedEVList: TIntegerArray): TEVTypeList;
  end;

  TEVBeanLogic = class(TInterfacedObject, IEVBeanLogic)
  public
    function GetConvertToEVTypeList(SetSelectedEVList: TIntegerArray): TEVTypeList;
  end;

implementation

{ TEVBeanLogic }

function TEVBeanLogic.GetConvertToEVTypeList(
  SetSelectedEVList: TIntegerArray): TEVTypeList;
var
  i: Integer;
begin
  SetLength(Result, Length(SetSelectedEVList));

  for i := 0 to Length(SetSelectedEVList) - 1 do
  begin
    case SetSelectedEVList[i] of
      0: Result[i] := fmrAll;
      1: Result[i] := fmrLow;
      2: Result[i] := fmrHigh;
      3: Result[i] := fmrOdd;
      4: Result[i] := fmrEven;

      else
        raise EEVBeanLogicException.Create('엘리베이터 Type을 셋팅할 수 없는 인덱스 값');
    end;
  end;
end;

end.

