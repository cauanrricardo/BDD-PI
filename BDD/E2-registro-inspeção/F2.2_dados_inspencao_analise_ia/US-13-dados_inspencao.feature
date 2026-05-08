
Feature: Informar dados da inspeção
  Como usuário
  Quero informar os dados da inspeção (data, responsável técnico e colaboradores)
  Para que o laudo final contenha as atribuições corretas

  Scenario: Data pré-preenchida a partir dos metadados das imagens
    Given as imagens enviadas possuem metadados de data válidos
    When o usuário acessa o formulário de dados da inspeção
    Then o campo de data é pré-preenchido com a data extraída dos metadados
    And o usuário pode confirmar ou alterar a data sem restrições

  Scenario: Data informada manualmente quando metadados estão ausentes
    Given as imagens enviadas não possuem metadados de data
    When o usuário acessa o formulário de dados da inspeção
    Then o campo de data está vazio e disponível para preenchimento manual

  Scenario: Responsável técnico pré-preenchido para Engenheiro ou Técnico
    Given o usuário autenticado possui perfil de Engenheiro ou Técnico
    When acessa o formulário de dados da inspeção
    Then o campo "Responsável Técnico" é pré-preenchido com o próprio usuário logado
    And o campo permanece editável

  Scenario: Responsável técnico pré-preenchido para Colaborador sem permissão de edição
    Given o usuário autenticado possui perfil de Colaborador
    When acessa o formulário de dados da inspeção
    Then o campo "Responsável Técnico" é pré-preenchido com o responsável técnico vinculado ao colaborador
    And o campo está bloqueado para edição dos dados

  Scenario: Seleção múltipla de colaboradores
    Given o usuário está preenchendo os dados da inspeção
    When acessa o campo "Colaboradores"
    Then o sistema permite selecionar um ou mais usuários cadastrados simultaneamente ao campo
