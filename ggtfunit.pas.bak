{-----------------------------------------------------------------}
{Euklidischer Algorithmus	  	               28.02.2018 }
{Leo Michel und Lucas Kaldenhoff                                  }
{Gruppe A12     						  }
{Klasse Eb Informatik Wendorff                                    }
{Übung: ggT berechen  (mit function)                          	  }
{-----------------------------------------------------------------}

unit ggtfunit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TZusatzForm }

  TZusatzForm = class(TForm)
    clearButton: TButton;
    kgVButton: TButton;
    Eingabe1Edit: TEdit;
    Eingabe2Edit: TEdit;
    AusgabeEdit: TEdit;
    ggTButton: TButton;
    DurchlaufLabel: TLabel;
    EuklidRadioButton: TRadioButton;
    WeitzalgorithmusRadioButton: TRadioButton;
    BruteforceRadioButton: TRadioButton;
    procedure clearButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ggTButtonClick(Sender: TObject);
    procedure kgVButtonClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  ZusatzForm: TZusatzForm;
  x,y,z,b: integer;
  a,m,l:integer;

implementation
function ggT (c,d,e:integer; var b: integer) :integer;
begin
  Repeat
  e:= c mod d;
  c:=d;
  d:=e;
  b:=b+1;
 until e=0;
 result:=c;                        //c ist lösung
end;

{$R *.lfm}

{ TZusatzForm }



procedure TZusatzForm.ggTButtonClick(Sender: TObject);
begin
 if (Eingabe1Edit.text='') or (Eingabe2Edit.text='') then ShowMessage ('Bitte Felder vollständig ausfüllen')
 else begin

 x:= strtoint (Eingabe1Edit.text);
 y:= strtoint (Eingabe2Edit.text);
 m:= strtoint (Eingabe1Edit.text);
 l:= strtoint (Eingabe2Edit.text);
 z:=0;
 b:=0;

 if (x=0) or (y=0) then ShowMessage ('Durch 0 darfst du nicht teilen, bitte 1 andere zahl')
 else begin

 If WeitzalgorithmusRadioButton.checked=true Then
 begin
 While x<>y do                                           // Algorithmus von
 begin                                                   // Prof. Weitz HAW
 If x>y then x:=x-y ;
 If x<y then y:=y-x ;
 z:=z+1;
 end;
 DurchlaufLabel.caption:= 'Ich habe '+Inttostr(z)+' Schleifendurchläufe gebraucht';
 b:=0;
 AusgabeEdit.text:= Inttostr (x);
end;

 If BruteforceRadioButton.checked=true then
 begin
 z:=x+1 ;
 b:=0;
 repeat
 z:=z-1 ;
 b:=b+1;
 until (x mod z=0) and (y mod z=0) ;
 AusgabeEdit.text:= Inttostr (z);
 DurchlaufLabel.caption:= 'Ich habe '+Inttostr(b)+' Schleifendurchläufe gebraucht';
 b:=0;
 end;

 If EuklidRadioButton.checked=true then
 begin
 x:= strtoint (Eingabe1Edit.text);
y:= strtoint (Eingabe2Edit.text);
z:=0;
 x:= ggT(x,y,z,b) ;
 AusgabeEdit.Text:=inttostr(x);
 DurchlaufLabel.caption:= 'Ich habe '+Inttostr(b)+' Schleifendurchläufe gebraucht';
 b:=0;
 end;

 end;
 end;
 end;

procedure TZusatzForm.kgVButtonClick(Sender: TObject);
begin
 if (Eingabe1Edit.text='') or (Eingabe2Edit.text='') then ShowMessage ('Bitte Felder vollständig ausfüllen')
 else begin

 x:= strtoint (Eingabe1Edit.text);
 y:= strtoint (Eingabe2Edit.text);
 z:=0;
 m:= strtoint (Eingabe1Edit.text);
 l:= strtoint (Eingabe2Edit.text);

if (x=0)or (y=0) then ShowMessage ('Durch 0 darfst du nicht teilen, bitte 1 andere zahl')
else begin
 x:=(m*l) div ggT(x,y,z,b) ;
 AusgabeEdit.Text:=inttostr(x);
 DurchlaufLabel.caption:= 'Ich habe '+Inttostr(b)+' Schleifendurchläufe gebraucht';
 b:=0;
 end;
 end;
 end;

procedure TZusatzForm.FormCreate(Sender: TObject);
begin
  ZusatzForm.color:= clcream;
end;

procedure TZusatzForm.clearButtonClick(Sender: TObject);
begin
  Eingabe1Edit.text:= ('');
  Eingabe2Edit.text:= ('');
  AusgabeEdit.text:= ('');
  b:=0;
  DurchlaufLabel.caption:= 'Ich habe keine Schleifendurchläufe gebraucht';
end;

end.

