unit Delphi.Mocks.Tests.ProxyBase;

interface

uses
  Rtti,
  SysUtils,
  DUnitX.TestFramework,
  Delphi.Mocks;

type
  {$M+}
  TSimpleTestObject = class(TObject);
  {$M-}

  TTestProxyBase = class
  published
    procedure SetUp;
  end;

implementation

uses
  Delphi.Mocks.Helpers,
  Delphi.Mocks.Interfaces,
  classes;

{ TTestProxyBase }

procedure TTestProxyBase.Setup;
begin
end;

initialization
  TDUnitX.RegisterTestFixture(TTestProxyBase);

end.
