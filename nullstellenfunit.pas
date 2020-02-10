{-----------------------------------------------------------------}
{Nullstellen Zusatz Form	  	               16.04.2018 }
{Leo Michel und Lucas Kaldenhoff                                  }
{Gruppe A12     						  }
{Klasse Eb Informatik Wendorff                                    }
{Übung: bisektion                                                 }
{-----------------------------------------------------------------}

unit nullstellenfunit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, TAGraph, TASeries, Forms, Controls, Graphics,
  Dialogs, StdCtrls;

type

  { TNullstellenForm }

  TNullstellenForm = class(TForm)
    FktChart: TChart;
    FktChartLineSeries1: TLineSeries;
    ZeichnenButton: TButton;
    dEdit: TEdit;
    EpsilonEdit: TEdit;
    IntervallgREdit: TEdit;
    IntervallgLEdit: TEdit;
    Intervallgrenze1Label: TLabel;
    Intervallgrenze2Label: TLabel;
    aLabel: TLabel;
    bLabel: TLabel;
    cLabel: TLabel;
    dLabel: TLabel;
    NormalformLabel: TLabel;
    SchrittgroesseLabel: TLabel;
    xLabel: TLabel;
    startButton: TButton;
    ClearButton: TButton;
    aEdit: TEdit;
    bEdit: TEdit;
    cEdit: TEdit;
    procedure ClearButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure startButtonClick(Sender: TObject);
    procedure ParameterEinlesen;
    procedure ZeichnenButtonClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  NullstellenForm: TNullstellenForm;
  a,b,c,d,l,r,x,y,z,epsilon:real;
  i:integer;
implementation
 function f(x:real):real;
 begin
   f:=a*(x*x*x)+b*(x*x)+c*x+d;
   end;

{$R *.lfm}

{ TNullstellenForm }

procedure TNullstellenForm.ParameterEinlesen;
  begin
a:=strtofloat(aEdit.Text);
 b:=strtofloat(bEdit.Text);
 c:=strtofloat(cEdit.text);
 d:=strtofloat(dEdit.text);
 Epsilon:=strtofloat(EpsilonEdit.text);
 l:=strtofloat(IntervallgLEdit.text);
 r:=strtofloat(IntervallgREdit.text);
  end;

procedure TNullstellenForm.ZeichnenButtonClick(Sender: TObject);
begin
 FktChartLineSeries1.clear;
 ParameterEinlesen;

 For i:= 0 to (99) do
 begin
 x := l + (r - l) * i /(98);
  FktChartLineSeries1.AddXY(x,f(x));
 end;
end;

procedure TNullstellenForm.startButtonClick(Sender: TObject);

begin
{if aEdit.text= '' or bEdit.text= '' or cEdit.text= '' or dEdit.text= ''
then showmessage ('Felder vollständig ausfüllen');   }


ParameterEinlesen;
 if (f(l)*f(r))<0 then
 begin
   Repeat
     if f(l)<0 then

     begin
       if f((l+r)/2)>=0 then
       begin
         r:=((l+r)/2);
         l:=l;
         end
       else
       begin
         r:=((l+r)/2);
         l:=l;
         end;
       end

     else

     begin
      if((l+r)/2)>=0 then
       begin
         r:=r;
         l:=((l+r)/2);
         end
       else
       begin
         l:=l;
         r:=((l+r)/2);
         end;
       end;
     until abs(l-r)<Epsilon;
 end
   else showmessage('Andere Intervallsgrenzen eingeben');
 xLabel.caption:= ('Eine Nullstelle der Funktion liegt bei x='+ floattostr(l));
end;

procedure TNullstellenForm.ClearButtonClick(Sender: TObject);
begin
  {aEdit.text:= 'a';
  bEdit.text:= 'b';
  cEdit.text:= 'c';
 xLabel.caption:= ('');}
end;

procedure TNullstellenForm.FormCreate(Sender: TObject);
begin
  NullstellenForm.color:=clcream;
end;

end.

