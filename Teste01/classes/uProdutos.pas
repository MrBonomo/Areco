unit uProdutos;

interface

type
  TProduto = class
    private
      FID: Integer;
      FDescricao: String;
      FQtdEstoque: Integer;
      FPreco: Currency;
      procedure SetID(const Value: Integer);
      procedure SetDescricao(const Value: String);
      procedure SetQtdEstoque(const Value: Integer);
      procedure SetPreco(const Value: Currency);
    public
      property ID : Integer read FID write SetID;
      property Descricao : String read FDescricao write SetDescricao;
      property QtdEstoque : Integer read FQtdEstoque write SetQtdEstoque;
      property Preco : Currency read FPreco write SetPreco;
  end;

implementation

{ TProdutos }

procedure TProduto.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TProduto.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TProduto.SetQtdEstoque(const Value: Integer);
begin
  FQtdEstoque := Value;
end;

procedure TProduto.SetPreco(const Value: Currency);
begin
  FPreco := Value;
end;

end.
