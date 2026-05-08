
Feature: Acessar listagem nacional de trechos inspecionados
  Como qualquer usuário incluindo Visitante
  Quero acessar a listagem nacional de trechos inspecionados
  Para consultar o histórico de condições viárias

  Scenario: Listagem acessível sem autenticação
    Given um visitante não autenticado acessa o sistema
    When navega para a listagem de trechos inspecionados
    Then o sistema exibe a listagem sem solicitar login

  Scenario: Listagem exibe informações resumidas de cada trecho
    Given o usuário acessa a listagem nacional
    When os trechos são exibidos
    Then cada item apresenta: via, município/UF, badge colorido de classificação geral e data da inspeção mais recente

  Scenario: Versão mais recente exibida no topo com acesso ao histórico
    Given um trecho possui múltiplas inspeções registradas
    When é exibido na listagem
    Then a inspeção mais recente aparece no topo
    And o usuário pode expandir para visualizar o histórico completo de inspeções anteriores

  Scenario: Listagem suporta paginação ou scroll infinito
    Given há um grande volume de trechos cadastrados
    When o usuário percorre a listagem
    Then o sistema carrega os registros de forma paginada ou via scroll infinito sem travar a interface

