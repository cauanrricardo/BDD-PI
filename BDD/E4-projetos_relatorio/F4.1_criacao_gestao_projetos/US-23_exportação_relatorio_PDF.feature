
Feature: Exportar relatório de projeto em PDF
  Como usuário
  Quero exportar o relatório do projeto em PDF
  Para envio a gestores e órgãos públicos

  Scenario: Botão de exportação disponível no modal do projeto
    Given o usuário acessa o modal do projeto com relatório gerado
    When o modal é exibido
    Then o botão "Exportar PDF" está visível e disponível

  Scenario: PDF inclui laudos individuais e ranking de precedência
    Given o usuário aciona "Exportar PDF" no modal do projeto
    When o arquivo é gerado
    Then o PDF contém os laudos individuais de cada trecho e o ranking de precedência de manutenção

  Scenario: Arquivo nomeado automaticamente conforme padrão
    Given o PDF do projeto é gerado
    When o download é iniciado
    Then o nome do arquivo segue o padrão "Projeto_[Nome]_[AAAA-MM-DD].pdf"

