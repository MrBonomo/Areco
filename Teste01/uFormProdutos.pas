unit uFormProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmProdutos = class(TForm)
    pnlBotoes: TPanel;
    btnSalvar: TButton;
    btnCancelar: TButton;
    edtID: TLabeledEdit;
    edtDescricao: TLabeledEdit;
    edtQtdEstoque: TLabeledEdit;
    edtPreco: TLabeledEdit;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProdutos: TfrmProdutos;

implementation

{$R *.dfm}

uses uFormPrincipal;

procedure TfrmProdutos.FormShow(Sender: TObject);
begin
  edtID.Text := InttoStr(frmPrincipal.Produto.ID);
  edtDescricao.Text := frmPrincipal.Produto.Descricao;
  edtQtdEstoque.Text := InttoStr(frmPrincipal.Produto.QtdEstoque);
  edtPreco.Text := FormatFloat(',###.00', frmPrincipal.Produto.Preco);
end;

procedure TfrmProdutos.btnSalvarClick(Sender: TObject);
var
  Gravou: Boolean;
begin
  frmPrincipal.Produto.Descricao := Trim(edtDescricao.Text);
  if frmPrincipal.Produto.Descricao = '' then
  begin
    Application.MessageBox('Informe a descrição do produto.', 'Aviso', MB_OK + MB_ICONWARNING);
    edtDescricao.SetFocus;
    Exit;
  end;
  try
    frmPrincipal.Produto.QtdEstoque := StrtoInt(edtQtdEstoque.Text);
  except On EConvertError do
    begin
      Application.MessageBox('Informe a quantidade de estoque do produto.', 'Aviso', MB_OK + MB_ICONWARNING);
      edtQtdEstoque.SetFocus;
      Exit;
    end;
  end;
  try
    frmPrincipal.Produto.Preco := StrtoFloat(edtPreco.Text);
  except On EConvertError do
    begin
      Application.MessageBox('Informe o preço do produto.', 'Aviso', MB_OK + MB_ICONWARNING);
      edtPreco.SetFocus;
      Exit;
    end;
  end;
  if frmPrincipal.Produto.ID = 0 then
     Gravou := frmPrincipal.ProdutoControle.Inserir
  else
     Gravou := frmPrincipal.ProdutoControle.Alterar(frmPrincipal.Produto.ID);
  if Gravou then
    Application.MessageBox('Produto salvo com sucesso!', 'Informação', MB_OK + MB_ICONINFORMATION)
  else
    Application.MessageBox('Erro na gravação do produto, tente novamente!', 'Erro', MB_OK + MB_ICONERROR);
  frmProdutos.Close;
end;

procedure TfrmProdutos.btnCancelarClick(Sender: TObject);
begin
   frmProdutos.Close;
end;

end.
