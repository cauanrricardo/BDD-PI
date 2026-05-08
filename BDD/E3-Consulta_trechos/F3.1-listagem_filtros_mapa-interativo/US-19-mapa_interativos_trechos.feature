
Feature: Visualizar trechos inspecionados em mapa interativo
  Como usuário
  Quero visualizar os trechos em um mapa interativo com cores por classificação DNIT
  Para identificar geograficamente as áreas mais críticas

  Scenario: Trechos plotados no mapa com escala de cores por classificação
    Given existem trechos inspecionados publicados no sistema
    When o usuário acessa a visualização de mapa
    Then cada trecho é plotado com a cor correspondente à sua classificação DNIT

  Scenario: Legenda de cores visível no mapa
    Given o usuário está na visualização de mapa
    When o mapa é carregado
    Then a legenda de cores com as classificações DNIT está visível na interface

  Scenario: Clique em trecho abre modal de detalhes
    Given o mapa está carregado com os trechos plotados
    When o usuário clica em um trecho específico
    Then o sistema abre o modal de detalhes daquele trecho

  Scenario: Mapa responde aos filtros da listagem
    Given o usuário aplicou filtros na listagem de trechos
    When alterna para a visualização de mapa
    Then o mapa exibe apenas os trechos correspondentes aos filtros ativos(US-18)

  Scenario: Fallback tabular exibido em ausência de conexão
    Given o usuário está sem conexão com a internet ou o mapa não carrega
    When tenta acessar a visualização de mapa
    Then o sistema exibe os trechos em formato tabular como alternativa

