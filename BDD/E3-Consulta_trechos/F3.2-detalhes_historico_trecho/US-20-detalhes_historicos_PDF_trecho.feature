
Feature: Visualizar laudo detalhado em modal com histórico e exportação
  Como usuário
  Quero clicar em um trecho para ver o laudo detalhado com histórico e exportar PDF
  Para consultar e compartilhar as informações de inspeção

  Scenario: Modal exibe dados completos do laudo
    Given o usuário clica em um trecho na listagem ou no mapa
    When o modal é aberto
    Then exibe: via, km, responsável técnico, defeitos por tipo e quantidade, PCI, IGG, classificação e data

  Scenario: Histórico de inspeções exibido em ordem cronológica
    Given o trecho possui mais de uma inspeção registrada
    When o usuário acessa o modal do trecho
    Then a seção de histórico lista as inspeções anteriores em ordem cronológica decrescente

  Scenario: Relatório comparativo disponível entre inspeções do mesmo trecho
    Given o trecho possui ao menos duas inspeções no histórico
    When o usuário acessa a opção de comparativo
    Then o sistema exibe um relatório comparando os indicadores entre as inspeções selecionadas

  Scenario: Botão de exportação PDF visível para todos os usuários
    Given qualquer usuário acessa o modal de laudo detalhado
    When o modal é aberto
    Then o botão "Exportar PDF" está visível e disponível independente de autenticação do usuário
