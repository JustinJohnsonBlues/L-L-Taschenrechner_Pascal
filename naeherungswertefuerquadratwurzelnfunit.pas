{-----------------------------------------------------------------}
{NaeherungswerteFuerQuadratwurzeln  	               14.06.2018 }
{Leo Michel und Lucas Kaldenhoff                                  }
{Gruppe A12     						  }
{Klasse Eb Informatik Wendorff                                    }
{Freiwilliger Zusatz: Brechnung von Quadrat Wurzeln nach Heron    }
{-----------------------------------------------------------------}
unit NaeherungswerteFuerQuadratwurzelnfunit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TNaeherungswerteQuadratwurzelnForm }

  TNaeherungswerteQuadratwurzelnForm = class(TForm)
    AnzeigeLabel: TLabel;
    AusgabeLabel: TLabel;
    Anzeige2Label: TLabel;
    Ausgabe2Label: TLabel;
    StartButton: TButton;
    ClearButton: TButton;
    GenauigkeitEdit: TEdit;
    RadikantEdit: TEdit;
    procedure ClearButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure StartButtonClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  NaeherungswerteQuadratwurzelnForm: TNaeherungswerteQuadratwurzelnForm;
  r:integer; //Radikant
  x,y:real; //Rechnungsvariablen
  g:integer; //Genauigkeits var
  z:integer; //Zähl var

implementation

{$R *.lfm}

{ TNaeherungswerteQuadratwurzelnForm }

procedure TNaeherungswerteQuadratwurzelnForm.FormCreate(Sender: TObject);
begin
  NaeherungswerteQuadratwurzelnForm.color:=clcream;
end;

procedure TNaeherungswerteQuadratwurzelnForm.ClearButtonClick(Sender: TObject);
begin
  r:=0;
  x:=0;
  y:=0;
  AusgabeLabel.caption:=('');
  Ausgabe2Label.caption:=('');
  RadikantEdit.text:=('');
end;

procedure TNaeherungswerteQuadratwurzelnForm.StartButtonClick(Sender: TObject);
begin
r:= Strtoint(RadikantEdit.text);
g:= Strtoint(GenauigkeitEdit.text);
x:=1;
For z:=1 to g do
begin
 y:=(r/x);
 x:= (0.5)*(x+y);
end;
 AusgabeLabel.caption:=('Die Wurzel aus '+inttostr(r)+' ist ungefähr:');
 Ausgabe2Label.caption:=floattostr(x);
 end;
end.

