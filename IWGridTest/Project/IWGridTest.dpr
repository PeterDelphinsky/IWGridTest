program IWGridTest;

uses
  FastMM4,
  IWRtlFix,
  IWJclStackTrace,
  IWJclDebug,
  IWStart,
  IWMainFrm in '..\Source\IWMainFrm.pas' {IWMainForm: TIWAppForm},
  ServerController in '..\Source\ServerController.pas' {IWServerController: TIWServerControllerBase},
  UserSessionUnit in '..\Source\UserSessionUnit.pas' {IWUserSession: TIWUserSessionBase};

{$R *.res}

begin
  TIWStart.Execute(True);
end.
