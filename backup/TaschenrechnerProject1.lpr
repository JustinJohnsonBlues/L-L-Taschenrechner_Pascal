program TaschenrechnerProject1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, tachartlazaruspkg, TaschenrechnerUnit1, ggtfunit, nullstellenfunit,
  NaeherungswerteFuerQuadratwurzelnfunit
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(TTaschenrechnerForm, TaschenrechnerForm);
  Application.CreateForm(TZusatzForm, ZusatzForm);
  Application.CreateForm(TNullstellenForm, NullstellenForm);
  Application.CreateForm(TNaeherungswerteQuadratwurzelnForm,
    NaeherungswerteQuadratwurzelnForm);
  Application.Run;
end.

