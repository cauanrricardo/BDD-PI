
Feature: Criar projeto agrupando trechos inspecionados
  Como usuário autenticado
  Quero criar um projeto agrupando múltiplos trechos inspecionados
  Para gerar um relatório comparativo de prioridade de manutenção

  Scenario: Criação de projeto com nome e trechos selecionados
    Given o usuário autenticado acessa o fluxo de criação de projeto
    When informa o nome do projeto e seleciona ao menos dois trechos da listagem
    Then o sistema cria o projeto com os trechos associados

  Scenario: Criação bloqueada com menos de dois trechos selecionados
    Given o usuário está criando um projeto
    When tenta confirmar com apenas um trecho selecionado
    Then o sistema exibe aviso informando o mínimo de dois trechos obrigatórios
    And bloqueia a criação