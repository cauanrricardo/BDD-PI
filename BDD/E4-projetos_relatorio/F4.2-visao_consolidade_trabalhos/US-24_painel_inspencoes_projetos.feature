
Feature: Acessar painel Meus Trabalhos
  Como usuário autenticado
  Quero acessar um painel que consolide minhas inspeções e projetos
  Para gerir minhas atividades com facilidade

  Scenario: Painel exibe inspeções publicadas e em andamento do usuário
    Given o usuário autenticado acessa o painel "Meus Trabalhos"
    When o painel é carregado
    Then exibe as inspeções publicadas e as ainda em andamento vinculadas ao usuário

  Scenario: Projetos criados pelo usuário exibidos no painel
    Given o usuário autenticado possui projetos criados
    When acessa o painel "Meus Trabalhos"
    Then os projetos do usuário são exibidos no painel

  Scenario: Inspeções de Colaborador exibem o responsável técnico vinculado
    Given o usuário autenticado possui perfil de Colaborador
    When acessa o painel "Meus Trabalhos"
    Then cada inspeção listada exibe o nome do Engenheiro ou Técnico responsável

  Scenario: Painel carregado em tempo aceitável
    Given o usuário autenticado acessa o painel "Meus Trabalhos"
    When o carregamento é iniciado em conexão de banda larga
    Then o painel é exibido em menos de 3 segundos
