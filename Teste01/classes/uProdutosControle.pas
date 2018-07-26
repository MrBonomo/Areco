unit uProdutosControle;

interface

uses
  ADODB, DB, SysUtils, uConexao, uProdutos;

type
  TProdutosControle = class
    private
      FConexao: TConexao;
      FProduto: TProduto;
      FqrySQL: TADOQuery;
      FqryProduto: TADOQuery;
      FdsProduto: TDataSource;
      procedure SetqrySQL(const Value: TADOQuery);
      procedure SetqryProduto(const Value: TADOQuery);
      procedure SetdsProduto(const Value: TDataSource);
    public
      constructor Create(Conexao: TConexao; Produto: TProduto);
      property qrySQL : TADOQuery read FqrySQL write SetqrySQL;
      property qryProduto : TADOQuery read FqryProduto write SetqryProduto;
      property dsProduto : TDataSource read FdsProduto write SetdsProduto;
      procedure Carregar;
      function Inserir : boolean;
      function Alterar(ID: Integer) : boolean;
      function Excluir(ID: Integer) : boolean;
  end;

implementation

{ TProdutosControle }

constructor TProdutosControle.Create(Conexao: TConexao; Produto: TProduto);
begin
   FConexao := Conexao;
   FProduto := Produto;
   qrySQL := TADOQuery.Create(nil);
   qryProduto := TADOQuery.Create(nil);
   dsProduto := TDataSource.Create(nil);
   qrySQL.Connection := FConexao.Conexao;
   qryProduto.Connection := FConexao.Conexao;
   dsProduto.DataSet := qryProduto;
end;

procedure TProdutosControle.SetqrySQL(const Value: TADOQuery);
begin
  FqrySQL := Value;
end;

procedure TProdutosControle.SetqryProduto(const Value: TADOQuery);
begin
  FqryProduto := Value;
end;

procedure TProdutosControle.SetdsProduto(const Value: TDataSource);
begin
  FdsProduto := Value;
end;

procedure TProdutosControle.Carregar;
begin
  qryProduto.Active := False;
  qryProduto.SQL.Text := 'SELECT * FROM PRODUTOS';
  qryProduto.Active := True;
end;

function TProdutosControle.Inserir: boolean;
begin
  qrySQL.Close;
  qrySQL.SQL.Text := 'INSERT INTO PRODUTOS (DESCRICAO, QTDESTOQUE, PRECO) ' +
                    'VALUES (:vDESCRICAO, :vQTDESTOQUE, :vPRECO)';
  qrySQL.Parameters.ParamByName('vDESCRICAO').Value := FProduto.Descricao;
  qrySQL.Parameters.ParamByName('vQTDESTOQUE').Value := FProduto.QtdEstoque;
  qrySQL.Parameters.ParamByName('vPRECO').Value := FProduto.Preco;
  try
    qrySQL.Connection.BeginTrans;
    qrySQL.ExecSQL;
    qrySQL.Connection.CommitTrans;
    Result := True;
  except
    qrySQL.Connection.RollbackTrans;
    Result := False;
  end;
end;

function TProdutosControle.Alterar(ID: Integer): boolean;
begin
  qrySQL.Close;
  qrySQL.SQL.Text := 'UPDATE PRODUTOS SET ' +
                    'DESCRICAO = :vDESCRICAO, ' +
                    'QTDESTOQUE = :vQTDESTOQUE, ' +
                    'PRECO = :vPRECO ' +
                    'WHERE ID = :vID';
  qrySQL.Parameters.ParamByName('vDESCRICAO').Value := FProduto.Descricao;
  qrySQL.Parameters.ParamByName('vQTDESTOQUE').Value := FProduto.QtdEstoque;
  qrySQL.Parameters.ParamByName('vPRECO').Value := FProduto.Preco;
  qrySQL.Parameters.ParamByName('vID').Value := FProduto.ID;
  try
    qrySQL.Connection.BeginTrans;
    qrySQL.ExecSQL;
    qrySQL.Connection.CommitTrans;
    Result := True;
  except
    qrySQL.Connection.RollbackTrans;
    Result := False;
  end;
end;

function TProdutosControle.Excluir(ID: Integer): boolean;
begin
  qrySQL.Close;
  qrySQL.SQL.Text := 'DELETE FROM PRODUTOS ' +
                    'WHERE ID = :vID';
  qrySQL.Parameters.ParamByName('vID').Value := FProduto.ID;
  try
    qrySQL.Connection.BeginTrans;
    qrySQL.ExecSQL;
    qrySQL.Connection.CommitTrans;
    Result := True;
  except
    qrySQL.Connection.RollbackTrans;
    Result := False;
  end;
end;

end.
