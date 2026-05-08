
Feature: Publicar laudo e exportar em PDF
  Como usuário
  Quero publicar o laudo e exportá-lo em PDF
  Para compartilhar com gestores e órgãos públicos

  Scenario: Laudo publicado na listagem geral ao finalizar inspeção
    Given o usuário revisou o laudo e aciona "Finalizar Inspeção"
    When a finalização é confirmada
    Then o laudo é publicado e passa a ser visível na listagem geral para usuários autenticados e visitantes

  Scenario: Botão de exportação disponível após publicação
    Given o laudo foi publicado com sucesso
    When o usuário acessa o laudo
    Then o botão "Exportar PDF" está visível e disponível

  Scenario: PDF gerado com todas as informações obrigatórias
    Given o usuário aciona "Exportar PDF" em um laudo publicado
    When o arquivo é gerado
    Then o PDF contém: data, via, km, responsável técnico, PCI, IGG, tabela de defeitos por código DNIT, normas aplicadas e validade de 90 dias

  Scenario: Arquivo PDF nomeado automaticamente conforme padrão
    Given o usuário aciona "Exportar PDF"
    When o arquivo é gerado
    Then o nome do arquivo segue o padrão "Laudo_[Via]_[Km]_[AAAA-MM-DD].pdf"

  Scenario: Download iniciado imediatamente após geração do PDF
    Given o arquivo PDF foi gerado com sucesso
    When a geração é concluída
    Then o download é iniciado automaticamente no dispositivo do usuário

