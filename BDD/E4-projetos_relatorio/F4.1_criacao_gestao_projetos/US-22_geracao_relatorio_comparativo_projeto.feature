
Feature: Gerar relatório consolidado de projeto com ranking de prioridade
  Como usuário
  Quero gerar um relatório que consolide os laudos dos trechos selecionados com ranking de  prioridade de manutenção
  Para compartilhar com gestores municipais

  Scenario: Relatório exibe laudo resumido de cada trecho do projeto
    Given o projeto possui trechos associados com laudos publicados
    When o usuário acessa o relatório do projeto
    Then o sistema exibe o laudo resumido de cada trecho incluído

  Scenario: Ranking automático ordenado do pior para o melhor
    Given o relatório do projeto é gerado
    When os trechos são exibidos
    Then aparecem ordenados de Péssimo a Ótimo conforme a classificação

  Scenario: Critério de desempate aplica precedência ao trecho com mais Panelas
    Given dois ou mais trechos possuem a mesma classificação geral
    When o ranking é gerado
    Then o trecho com maior quantidade de Panelas recebe maior precedência no ranking

  Scenario: Relatório acessível em modal dentro do sistema
    Given o projeto foi criado e o relatório gerado
    When o usuário acessa o projeto
    Then o relatório é exibido em modal no próprio sistema
