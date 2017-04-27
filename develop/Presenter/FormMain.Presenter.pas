unit FormMain.Presenter;

interface

uses
  System.Classes,
  Constants, Arrays,
  FormMain.Model.Logic, FormMain.Model.Bean,
  EleVator.Model.Logic, EleVator.Model.Bean,
  Vcl.Dialogs;

type
  IFormMainPresenter = interface(IInterface)
  ['{D3F75D8B-546D-4F13-89AB-9A801E7DA832}']

    procedure CreateEVList();
  end;

  TFormMainPresenter = class(TInterfacedObject, IFormMainPresenter)
  private
    FFormLogic: IFormLogic;
    FEVBeanLogic: IEVBeanLogic;
  public
    constructor Create();
    procedure CreateEVList();
  end;

implementation

{ TEVPresenter }

constructor TFormMainPresenter.Create;
begin
  FFormLogic := TFormLogic.Create();
  FEVBeanLogic := TEVBeanLogic.Create();
end;

procedure TFormMainPresenter.CreateEVList;
begin
  FFormLogic.SetSelectedEVList(nil);
  TEVBeans.InitEVBeans(FEVBeanLogic.GetConvertToEVTypeList(TFormBean.GetInstance().EVList));
end;

end.
