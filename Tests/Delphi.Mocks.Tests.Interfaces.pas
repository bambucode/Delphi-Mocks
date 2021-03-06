unit Delphi.Mocks.Tests.Interfaces;

interface

uses
  DUnitX.TestFramework,
  Delphi.Mocks;

type
  {$M+}
  ISafeCallInterface = interface
    ['{50960499-4347-421A-B28B-3C05AE9CB351}']
    function DoSomething(const value : WideString) : integer;safecall;
    function Foo2(const value : WideString): string; safecall;
    procedure Foo; safecall;
  end;

  ISimpleInterface = interface
    ['{35DA1428-5183-43FE-BEE8-1010C75EF4D6}']
    procedure SimpleProcedure(const value: widestring);
  end;

  IVariant = interface
    procedure VariantParam(Value: Variant);
  end;
  {$M-}

  {$M+}
  TSafeCallTest = class
  published
    [Test]
    procedure CanMockSafecallFunction;
    [Test, Ignore]
    procedure CanMockSafecallProc;
    [Test, Ignore]
    procedure CanMockSimpleProcedureCall;
    [Test]
    procedure CanMockProcedureWithVariantParam;
  end;
  {$M-}


implementation
uses
  Rtti,
  System.Variants;


{ TValueTests }

procedure TSafeCallTest.CanMockProcedureWithVariantParam;
var
  mock : TMock<IVariant>;
begin
  mock := TMock<IVariant>.Create;

  mock.Setup.Expect.Once.When.VariantParam(Null);

  mock.Instance.VariantParam(Null);
  mock.Verify;
end;

procedure TSafeCallTest.CanMockSafecallFunction;
var
  mock : TMock<ISafeCallInterface>;
  value: Integer;
begin
  mock := TMock<ISafeCallInterface>.Create;
  mock.Setup.WillReturn(123).When.DoSomething('hello');

  value := mock.Instance.DoSomething('hello');

  Assert.AreEqual(123, value);
end;

procedure TSafeCallTest.CanMockSafecallProc;
var
  mock : TMock<ISafeCallInterface>;
begin
  mock := TMock<ISafeCallInterface>.Create;

  Assert.NotImplemented;
end;


procedure TSafeCallTest.CanMockSimpleProcedureCall;
var
  mock : TMock<ISimpleInterface>;
begin
  mock := TMock<ISimpleInterface>.Create;

  mock.Instance.SimpleProcedure('hello');

  Assert.NotImplemented;
end;

initialization
  TDUnitX.RegisterTestFixture(TSafeCallTest);


end.
