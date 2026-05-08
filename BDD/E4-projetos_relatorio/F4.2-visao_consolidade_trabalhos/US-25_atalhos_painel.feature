
Feature: Acessar atalhos de ação rápida no painel
  Como usuário autenticado
  Quero ter botões de atalho no painel para iniciar upload ou criar projeto
  Para não precisar navegar por menus

  Scenario: Atalho "Realizar novo upload" redireciona para o fluxo correto
    Given o usuário autenticado está no painel "Meus Trabalhos"
    When aciona o botão "Realizar novo upload"
    Then o sistema redireciona para o início do fluxo de upload de imagens (US-09)

  Scenario: Atalho "Criar novo projeto" redireciona para o fluxo correto
    Given o usuário autenticado está no painel "Meus Trabalhos"
    When aciona o botão "Criar novo projeto"
    Then o sistema redireciona para o fluxo de criação de projeto (US-21)

  Scenario: Atalhos visíveis mesmo quando não há trabalhos cadastrados
    Given o usuário autenticado não possui nenhuma inspeção ou projeto cadastrado
    When acessa o painel "Meus Trabalhos"
    Then os botões de atalho estão visíveis
    And o sistema exibe uma orientação ao usuário sobre como começar