// Projeto Teste 01 - Empresa Areco \\
// Cadastro de Produtos - POO       \\
// Autor: Marcel Bonomo             \\
// Data: 25/07/2018                 \\
unit uFormPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls,
  uConexao, uProdutos, uProdutosControle;

type
  TfrmPrincipal = class(TForm)
    pnlBotoes: TPanel;
    btnIncluir: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    btnFechar: TButton;
    grdProdutos: TDBGrid;
    pnlRotulo: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Conexao : TConexao;
    Produto : TProduto;
    ProdutoControle : TProdutosControle;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uFormProdutos;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  Conexao := TConexao.Create;
  Produto := TProduto.Create;
  ProdutoControle := TProdutosControle.Create(Conexao, Produto);
  ProdutoControle.Carregar;
  grdProdutos.DataSource := ProdutoControle.dsProduto;
end;

procedure TfrmPrincipal.btnIncluirClick(Sender: TObject);
begin
  Produto.ID := 0;
  Produto.Descricao := '';
  Produto.QtdEstoque := 0;
  Produto.Preco := 0;
  if not Assigned(frmProdutos) then
    frmProdutos := TfrmProdutos.Create(Self);
  frmProdutos.ShowModal;
  ProdutoControle.Carregar;
end;

procedure TfrmPrincipal.btnAlterarClick(Sender: TObject);
begin
  if grdProdutos.DataSource.DataSet.RecordCount = 0 then Exit;
  Produto.ID := grdProdutos.DataSource.DataSet.FieldByName('ID').AsInteger;
  Produto.Descricao := grdProdutos.DataSource.DataSet.FieldByName('DESCRICAO').AsString;
  Produto.QtdEstoque := grdProdutos.DataSource.DataSet.FieldByName('QTDESTOQUE').AsInteger;
  Produto.Preco := grdProdutos.DataSource.DataSet.FieldByName('PRECO').AsFloat;
  if not Assigned(frmProdutos) then
    frmProdutos := TfrmProdutos.Create(Self);
  frmProdutos.ShowModal;
  ProdutoControle.Carregar;
end;

procedure TfrmPrincipal.btnExcluirClick(Sender: TObject);
begin
  if grdProdutos.DataSource.DataSet.RecordCount = 0 then Exit;
  if Application.MessageBox('Confirma a exclusão do produto?', 'Confirmar', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
  begin
     Produto.ID := grdProdutos.DataSource.DataSet.FieldByName('ID').AsInteger;
     if ProdutoControle.Excluir(Produto.ID) then
        Application.MessageBox('Produto excluído com sucesso!', 'Informação', MB_OK + MB_ICONINFORMATION)
     else
        Application.MessageBox('Erro na exclusão do produto.', 'Erro', MB_OK + MB_ICONERROR);
     ProdutoControle.Carregar;
  end;
end;

procedure TfrmPrincipal.btnFecharClick(Sender: TObject);
begin
  Application.Terminate;
end;

end.
