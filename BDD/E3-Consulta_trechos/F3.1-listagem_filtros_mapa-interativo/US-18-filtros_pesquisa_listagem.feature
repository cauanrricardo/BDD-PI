
Feature: Filtrar listagem de trechos inspecionados
  Como usuário
  Quero filtrar a listagem por diferentes critérios
  Para encontrar trechos específicos com agilidade

  Scenario: Filtros disponíveis para todos os usuários
    Given qualquer usuário acessa a listagem de trechos
    When visualiza os filtros disponíveis
    Then pode filtrar por cidade, UF, responsável técnico, classificação e intervalo de datas

  Scenario: Filtro "Meus Trabalhos" disponível apenas para autenticados
    Given um usuário não autenticado acessa a listagem
    When visualiza as opções de filtro
    Then o filtro "Meus Trabalhos" não está disponível

  Scenario: Filtro "Meus Trabalhos" disponível para usuário autenticado
    Given um usuário autenticado acessa a listagem
    When visualiza as opções de filtro
    Then o filtro "Meus Trabalhos" está disponível

  Scenario: Resultados atualizados dinamicamente ao aplicar filtros
    Given o usuário está na listagem com filtros disponíveis
    When seleciona ou altera qualquer filtro
    Then os resultados são atualizados sem recarregar a página

