{-----------------------------------------------------------------}
{TaschenrechnerProjekt	                               12.10.2017 }
{Lucas Kaldenhoff, Leo Michel                                     }
{Gruppe A12     						  }
{Klasse Eb Informatik Wendorff                                    }
{Erstellung eines Taschenrechners                                 }             //We Schleife...
{-----------------------------------------------------------------}
unit TaschenrechnerUnit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Math;

type

  { TTaschenrechnerForm }

  TTaschenrechnerForm = class(TForm)
    AddiereButton: TButton;
    Naeherungsbutton: TButton;
    NullstellenButton: TButton;
    ZusatzButton: TButton;
    ClearButton: TButton;
    DEGLabel: TLabel;
    LundLImage: TImage;
    RADLabel: TLabel;
    ZweiHochXButton: TButton;
    XhochYButton: TButton;
    nteWurzelButton: TButton;
    TangensButton: TButton;
    CosinusButton: TButton;
    WinkelfunktionAusgabeRADZEdit: TEdit;
    WinkelfunktionAusgabeDEGZEdit: TEdit;
    SinusButton: TButton;
    SummeAllerButton: TButton;
    FakultaetButton: TButton;
    YLabel: TLabel;
    XLabel: TLabel;
    WurzelButton: TButton;
    Hoch3Button: TButton;
    QuadriereButton: TButton;
    CloseButton: TButton;
    DividierenButton: TButton;
    AusgabeZEdit: TEdit;
    EingabeYEdit: TEdit;
    EingabeXEdit: TEdit;
    MultiplizierenButton: TButton;
    SubtrahierenButton: TButton;
    procedure AddiereButtonClick(Sender: TObject);                              //We möglichst sinnvoll sortieren (auch im Quelltext)
    procedure ClearButtonClick(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure CosinusButtonClick(Sender: TObject);
    procedure DividierenButtonClick(Sender: TObject);
    procedure FakultaetButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Hoch3ButtonClick(Sender: TObject);
    procedure MultiplizierenButtonClick(Sender: TObject);
    procedure NaeherungsbuttonClick(Sender: TObject);
    procedure nteWurzelButtonClick(Sender: TObject);
    procedure NullstellenButtonClick(Sender: TObject);
    procedure QuadriereButtonClick(Sender: TObject);
    procedure SinusButtonClick(Sender: TObject);
    procedure SubtrahierenButtonClick(Sender: TObject);
    procedure SummeAllerButtonClick(Sender: TObject);
    procedure TangensButtonClick(Sender: TObject);
    procedure WurzelButtonClick(Sender: TObject);
    procedure XhochYButtonClick(Sender: TObject);
    procedure ZusatzButtonClick(Sender: TObject);
    procedure ZweiHochXButtonClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  TaschenrechnerForm: TTaschenrechnerForm;
  x,y,z: real;
  Anzahl: Integer;
  i:integer;
  b:LongInt;

implementation

{$R *.lfm}

{ TTaschenrechnerForm }

uses ggtfunit, nullstellenfunit,naeherungswertefuerquadratwurzelnfunit ;

procedure TTaschenrechnerForm.AddiereButtonClick(Sender: TObject);
begin
  x:= StrToFloat (EingabeXEdit.Text);
  y:= StrToFloat (EingabeYEdit.Text);
  z:= x+y;
  AusgabeZEdit.Text:= FloatToStr (z);

end;

procedure TTaschenrechnerForm.ClearButtonClick(Sender: TObject);
begin
  EingabeXEdit.text:=' ';
  EingabeYEdit.text:=' ';
  AusgabeZEdit.text:=' ';
  WinkelfunktionAusgabeDEGZEdit.text:=' ';
  WinkelfunktionAusgabeRADZEdit.text:=' ';
end;

procedure TTaschenrechnerForm.CloseButtonClick(Sender: TObject);
begin
  close
end;

procedure TTaschenrechnerForm.CosinusButtonClick(Sender: TObject);              //We: s. sin
begin
  x:=strtofloat (eingabexedit.text);
  z:=cos(x);
  WinkelfunktionAusgabeRADZedit.text:= floattostr (z);

  x:=strtofloat (eingabexedit.text);
  z:=cos(x);
  WinkelfunktionAusgabeRADZedit.text:= floattostr (z);
  z:=Cos(DegToRad(x));
  WinkelfunktionAusgabeDEGZedit.text:= floattostr (z)
end;

procedure TTaschenrechnerForm.DividierenButtonClick(Sender: TObject);
begin
  x:= StrToFloat (EingabeXEdit.Text);
  y:= StrToFloat (EingabeYEdit.Text);
  if y=0 then showmessage('Bitte nicht durch 0 Teilen!');
  z:= x/y;
  AusgabeZEdit.Text:= FloatToStr (z);
end;

procedure TTaschenrechnerForm.FakultaetButtonClick(Sender: TObject);
var
  g:integer;
begin
  g:=1;
  b:= StrToInt (EingabeXEdit.Text);
  FOR i:=1 TO b Do
  begin
     g:= g*i;
  end;
  AusgabeZEdit.Text:= IntToStr (g);
  end;
//We: gut

procedure TTaschenrechnerForm.FormCreate(Sender: TObject);
begin
  Taschenrechnerform.Color:=clCream;
  LundLImage.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Der L&L Taschenrechner.png');
end;

procedure TTaschenrechnerForm.Hoch3ButtonClick(Sender: TObject);
begin
  x:= StrToFloat (EingabeXEdit.Text);
  z:= x*x*x;
  AusgabeZEdit.Text:= FloatToStr (z);
end;

procedure TTaschenrechnerForm.MultiplizierenButtonClick(Sender: TObject);
begin
  x:= StrToFloat (EingabeXEdit.Text);
  y:= StrToFloat (EingabeYEdit.Text);
  z:= x*y;
  AusgabeZEdit.Text:= FloatToStr (z);
end;

procedure TTaschenrechnerForm.NaeherungsbuttonClick(Sender: TObject);
begin
  NaeherungswerteQuadratwurzelnForm.show;
end;

procedure TTaschenrechnerForm.nteWurzelButtonClick(Sender: TObject);
 var
   radikand,n:integer;
   result:real;                                                                 //We: *"result" ist vorgegebener Bezeichner (als eigenen Namen vermeiden)
begin
  radikand:= strtoint(EingabeXedit.text);
  n:= strtoint(eingabeYedit.text);
  if radikand>=0 then
    result:=power(radikand, 1/n)
  else result:=-1;
    AusgabeZedit.text:=floattostr (result);
                                                                                 //Idee von
                                                                                 //   https://www.delphi-treff.de/tipps-tricks/mathematik/arithmetik/
                                                                                 //    n-te-wurzel-einer-zahl-berechnen/
end;

procedure TTaschenrechnerForm.NullstellenButtonClick(Sender: TObject);
begin
  NullstellenForm.show;
end;

procedure TTaschenrechnerForm.QuadriereButtonClick(Sender: TObject);
begin
 x:= StrToFloat (EingabeXEdit.Text);
  z:= x*x;
  AusgabeZEdit.Text:= FloatToStr (z);
end;

procedure TTaschenrechnerForm.SinusButtonClick(Sender: TObject);
begin
  x:=strtofloat (eingabexedit.text);
  z:=sin(x);
  WinkelfunktionAusgabeRADZedit.text:= floattostr (z);

  x:=strtofloat (eingabexedit.text);                                            {//We: ...ist doch schon in z gespeichert}
  z:=sin(x);                                                                    //We ...sin deg alles doppelt
  WinkelfunktionAusgabeRADZedit.text:= floattostr (z);
  z:=Sin(DegToRad(x));
  WinkelfunktionAusgabeDEGZedit.text:= floattostr (z)
                                                                                // Angaben zur Quelle für RAD -> DEG
                                                                                //http://www.delphipraxis.net/148965-sinus-cosinus-tangens.html
end;
//We: *leicht verwirrend, da ja der Eingabewert in DEG oder RAD

procedure TTaschenrechnerForm.SubtrahierenButtonClick(Sender: TObject);
begin
  x:= StrToFloat (EingabeXEdit.Text);
  y:= StrToFloat (EingabeYEdit.Text);
  z:= x-y;
  AusgabeZEdit.Text:= FloatToStr (z);
end;

procedure TTaschenrechnerForm.SummeAllerButtonClick(Sender: TObject);

var
  g:integer;
begin
  g:=1;
  b:= StrToInt (EingabeXEdit.Text);
  FOR i:=2 TO b Do
  begin
     g:= g+i;
  end;
  AusgabeZEdit.Text:= IntToStr (g);

end;
//We: gut
procedure TTaschenrechnerForm.TangensButtonClick(Sender: TObject);              //We: s. sin
begin
   x:=strtofloat (eingabexedit.text);
  z:= tan(x);
  WinkelfunktionAusgabeRADZedit.text:= floattostr (z);

  x:=strtofloat (eingabexedit.text);
  z:=tan(x);
  WinkelfunktionAusgabeRADZedit.text:= floattostr (z);
  z:=Tan(DegToRad(x));
  WinkelfunktionAusgabeDEGZedit.text:= floattostr (z)
end;

procedure TTaschenrechnerForm.WurzelButtonClick(Sender: TObject);               //We: Wurzel aus neg. Werten...
begin
  x:= StrToFloat (EingabeXEdit.Text);
  z:=sqrt(x);
  AusgabeZEdit.Text:=FloatToStr (z);
                                                                                //Angaben zum Quellcode für die Wurzel:
                                                                                //http://www.delphipraxis.net/128549-wurzel-ziehen-mit-kleinem-programm-delphi.html
end;

procedure TTaschenrechnerForm.XhochYButtonClick(Sender: TObject);
 var
    i,x,y:integer;
begin
  x:= strtoint (EingabeXedit.text);
  y:= strtoint (EingabeYedit.text);                                              //Eigener Algorithmus
  if y=0 then z:=1;
  if y=1 then z:=x;
  if y=2 then z:=x*x;
  if y>2 then
    begin
    //We: überflüssig     i:= 3;
    z:= x*x;
    FOR  i:=3 TO y DO
    z:= z*x;
    end;
  AusgabeZedit.text:= Floattostr (z);
end;

procedure TTaschenrechnerForm.ZusatzButtonClick(Sender: TObject);
begin
  ZusatzForm.show;
end;

//We: gut! (etwas kürzer mögl.)
procedure TTaschenrechnerForm.ZweiHochXButtonClick(Sender: TObject);
var
   x,i:integer;
begin
  x:= strtoint (EingabeXedit.text);                                             //Eigener Algorithmus
  if x=0 then z:=1;                                                             //We: Verwendung von XhochY möglich
  if x=1 then z:=2;
  if x=2 then z:=2*2;
  if x>2 then
    begin
//We    i:=3;
    z:= 2*2;
    FOR i:=3 TO x DO
    z:= z*2;
    end;
  AusgabeZedit.text:= Floattostr (z);
end;

end.

{We
Grundanforderungen erfüllt, SUM, FAK
++eigener Algorithmus
++unbekannte Befehle verwendet
+div. Erweiterungen

-Quelltext etwas unübersichtlich /neue Befehle, eig. Algorithmen besser kommentieren

*Zahl hinter Dateinamen löschen

14,5
}
