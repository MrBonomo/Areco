program Teste01;

uses
  Vcl.Forms,
  uFormPrincipal in 'uFormPrincipal.pas' {frmPrincipal},
  uConexao in 'classes\uConexao.pas',
  uProdutosControle in 'classes\uProdutosControle.pas',
  uProdutos in 'classes\uProdutos.pas',
  uFormProdutos in 'uFormProdutos.pas' {frmProdutos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
