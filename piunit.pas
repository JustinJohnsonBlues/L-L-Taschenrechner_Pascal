{-----------------------------------------------------------------}
{Stellen von Pi berechnen nach Summenfunktion          29.01.2020 }
{Leo Michel                                                       }
{Gruppe A12     						  }
{Klasse Q2b Informatik Wendorff                                   }
{Übung: Langeweile und üben mit GNURZ                         	  }
{-----------------------------------------------------------------}
unit PIunit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Spin;

type

  { TPIForm }

  TPIForm = class(TForm)
    rechenzeitLabel: TLabel;
    StartButton: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Memo: TMemo;
    SpinEdit: TSpinEdit;
    procedure StartButtonClick(Sender: TObject);
  private

  public

  end;

var
  PIForm: TPIForm;

implementation

uses
  gnurz;

{$R *.lfm}

{ TPIForm }

function Gnurzdivision(zaehler,nenner,genauigkeit:GNZtyp):string;
var
  i,a,b,zehn,speicher:GNZtyp;
  GO:TGnurz;
begin
  GO:=TGnurz.create;
  a:=zaehler;
  zehn:=GO.StrToGNZtyp('10');
  speicher:=GO.GNZnull;
  i:=GO.GNZeins;
  While GO.GNZakleinerb(i,genauigkeit) do begin
    b:=GO.GNZdiv(a,nenner);
    speicher:=GO.GNZadd(GO.GNZmul(zehn,speicher),b);
    a:=GO.GNZmul(zehn,GO.GNZmod(a,nenner));
    i:=GO.GNZadd(i,GO.GNZeins);
  end ;
  result:=GO.GNZtypToStr(speicher);
  GO.free;
end;

procedure TPIForm.StartButtonClick(Sender: TObject);
var
tick1,tick2:int64;
GO:TGNURZ;
pi,speicher,z1,z2,RAeins,RAvier:GRaZtyp;
i,n,NAzwei:GNZtyp;
pos:boolean;
begin
  GO:=TGnurz.create;
  i:=GO.StrToGNZtyp('2');
  RAeins.zaehler:=GO.GNZeins;
  RAeins.nenner:=GO.GNZeins;
  RAvier.zaehler:=GO.StrtoGNZtyp('4');
  RAvier.Nenner:=GO.GNZeins;
  pi.zaehler:=GO.GNZnull;
  pi.nenner:=GO.GNZeins;
  n:=GO.GNZpotenz(GO.StrToGNZtyp('10'),GO.StrTOGNZtyp(SpinEdit.text));          //n= 10^SpinEdit
  i:=GO.GNZnull;
  NAzwei:=GO.StrToGNZtyp('2');
  tick1:=gettickcount64;
  While GO.GNZakleinerb(i,n) do begin
    z1.zaehler:=GO.GNZmul(NAzwei,i);
    z1.nenner:=GO.GNZeins;
    Speicher:=GO.GRaZadd(z1,RAeins);
    Speicher:=GO.GRaZdiv(RAeins,speicher);
    If GO.GNZistgerade(i)=true or (i=GO.GNZnull) then pi:=GO.GRaZadd(pi,Speicher);
    If GO.GNZistgerade(i)=false then pi:=GO.GRaZsub(pi,Speicher);
    i:=GO.GNZadd(i,GO.GNZeins);
end;
  pi:=GO.GRaZmul(RAvier,pi);
  tick2:=gettickcount64;
  rechenzeitlabel.caption:=inttostr(tick2-tick1)+'ms';
  Memo.lines.add('Zähler:');
  Memo.lines.add(GO.GNZtypToStr(pi.zaehler));
  Memo.lines.add('Nenner:');
  Memo.lines.add(GO.GNZtypToStr(pi.nenner));
  Memo.lines.add('Dezimal:');
  Memo.lines.add(Gnurzdivision(pi.zaehler,pi.nenner,n));
   GO.free;
end;

end.

