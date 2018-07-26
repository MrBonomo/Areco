unit uConexao;

interface

uses ADODB;

type
  TConexao = class
    public
      Conexao : TADOConnection;
      constructor Create;
      destructor Destroy; override;
  end;

implementation

{ TConexao }

constructor TConexao.Create;
begin
  Conexao := TADOConnection.Create(nil);
  Conexao.LoginPrompt := False;
  Conexao.ConnectionString := 'Provider=SQLNCLI10.1;' +
                              'Persist Security Info=False;' +
                              'Data Source=localhost;' +
                              'Initial Catalog=TESTEDB;' +
                              'User ID=Usuario;' +
                              'Password=Senha123';
  Conexao.Connected := True;
end;

destructor TConexao.Destroy;
begin
  Conexao.Free;
  inherited;
end;

end.
