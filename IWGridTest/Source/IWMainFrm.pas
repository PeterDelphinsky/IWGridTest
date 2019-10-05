unit IWMainFrm;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes,
  IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl, IWCompGrids,
  IWDBGrids, Vcl.Controls, Vcl.Forms,
  IWVCLBaseContainer, IWContainer, IWHTMLContainer, IWHTML40Container, IWRegion,
  IWCompButton, IWCompEdit, IWCompMemo;

type
  TIWMainForm = class(TIWAppForm)
    IWRegion1: TIWRegion;
    IWGrid1: TIWGrid;
    IWButton1: TIWButton;
    IWMemo1: TIWMemo;

    procedure OnAsyncKeyDownControl(Sender: TObject; EventParams: TStringList);
    procedure OnOnAsyncEnterControl(Sender: TObject; EventParams: TStringList);
    procedure OnAsyncClickControl(Sender: TObject; EventParams: TStringList);

    procedure IWButton1Click(Sender: TObject);

  private
    FX: Integer;
    FY: Integer;
    procedure SetX(const Value: Integer);
    procedure SetY(const Value: Integer);
    procedure SetCurrentXY(Sender: TObject);

  public
    property X: Integer read FX write SetX;
    property Y: Integer read FY write SetY;

    procedure SetFocus(X, Y: Integer);

  end;

  TMyIWEdit = class(TIWEdit)
  private
    FX: Integer;
    FY: Integer;
    procedure SetX(const Value: Integer);
    procedure SetY(const Value: Integer);
  published
    property X: Integer read FX write SetX;
    property Y: Integer read FY write SetY;
  end;

implementation

{$R *.dfm}

procedure TIWMainForm.IWButton1Click(Sender: TObject);
var
  i, j: Integer;
begin
  for j := 0 to IWGrid1.RowCount - 1 do
    for i := 0 to IWGrid1.ColumnCount - 1 do
    begin
      with IWGrid1.Cell[j, i] do
      begin
        Alignment := taCenter;
        Width     := IntToStr(Round(IWGrid1.Width / IWGrid1.ColumnCount));

        Control := TMyIWEdit.Create(IWGrid1);
        with TMyIWEdit(Control) do
        begin
          X := i;
          Y := j;
          Text := '';
          Width := StrToInt(IWGrid1.Cell[j, i].Width) - 10;
          OnAsyncKeyDown := OnAsyncKeyDownControl;
          OnAsyncClick   := OnAsyncClickControl;
        end;
      end;
    end;
  SetFocus(0, 0);
end;

procedure TIWMainForm.OnAsyncClickControl(Sender: TObject;
  EventParams: TStringList);
begin
  SetCurrentXY(Sender);
end;

procedure TIWMainForm.OnAsyncKeyDownControl(Sender: TObject;
  EventParams: TStringList);
var
  pKey: Integer;
  pText: String;
  i: Integer;
begin

  if not TryStrToInt(EventParams.Values['Which'],pKey) then
    pKey := 0;

  if pKey = 13 then
  begin

    pText := IWGrid1.Cell[Y, X].Control.Text;

    if (X = 0) and (pText <> '') then
    begin

      for i := X + 1 to IWGrid1.ColumnCount - 1 do
        IWGrid1.Cell[Y, i].Control.Text := pText;

      Exit;
    end;

    if X >= IWGrid1.ColumnCount - 1 then
    begin
      X := 0;
      if Y < IWGrid1.RowCount - 1 then
        Y := Y + 1
      else
        Y := 0;
    end
    else
      X := X + 1;

    SetFocus(X, Y);
  end;
end;

procedure TIWMainForm.OnOnAsyncEnterControl(Sender: TObject;
  EventParams: TStringList);
begin
  SetCurrentXY(Sender);
end;

procedure TIWMainForm.SetFocus(X, Y: Integer);
var
  jsTemp: string;
begin
  if Assigned(IWGrid1.Cell[Y, X].Control) then
  begin
    jsTemp := IWGrid1.Cell[Y, X].Control.HTMLName + 'IWCL.focus();';
    WebApplication.CallBackResponse.AddJavaScriptToExecute(jsTemp);
  end;
end;

procedure TIWMainForm.SetCurrentXY(Sender: TObject);
var
  pControl: TMyIWEdit;
begin
  if Sender is TMyIWEdit then
  begin
    pControl := Sender as TMyIWEdit;
    X := pControl.X;
    Y := pControl.Y;
  end;
end;

procedure TIWMainForm.SetX(const Value: Integer);
begin
  FX := Value;
end;

procedure TIWMainForm.SetY(const Value: Integer);
begin
  FY := Value;
end;

{ TMyIWEdit }

procedure TMyIWEdit.SetX(const Value: Integer);
begin
  FX := Value;
end;

procedure TMyIWEdit.SetY(const Value: Integer);
begin
  FY := Value;
end;

initialization

TIWMainForm.SetAsMainForm;

end.
