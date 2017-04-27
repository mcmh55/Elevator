unit FormMain.Model.Bean;

interface

uses
  System.SysUtils,
  Arrays;

type
  TFormBean = class(TObject)
  private
    class var FBeanInstance: TFormBean;
  private
    FEVList: TIntegerArray;

    class destructor Destroy();
    procedure SetEVList(const Value: TIntegerArray);

  public
    class function GetInstance(): TFormBean; static;

    property EVList: TIntegerArray read FEVList write SetEVList;
  end;

implementation

{ TFormBean }

class destructor TFormBean.Destroy;
begin
  if Assigned(FBeanInstance) then
    FreeAndNil(FBeanInstance);
end;

class function TFormBean.GetInstance: TFormBean;
begin
  if not Assigned(FBeanInstance) then
    FBeanInstance := TFormBean.Create();

  Result := FBeanInstance;
end;

procedure TFormBean.SetEVList(const Value: TIntegerArray);
begin
  FEVList := Value;
end;

end.
