
Feature: Atualizar trecho já mapeado com novo upload
  Como usuário autenticado
  Quero atualizar um trecho já mapeado com novo upload de imagens sem reinserir o endereço
  Para manter os laudos sempre atualizados

  Scenario: Botão "Atualizar" disponível na listagem de Meus Trabalhos
    Given o usuário acessa o painel "Meus Trabalhos"
    When visualiza a listagem de trechos
    Then cada trecho exibe o botão "Atualizar" ao seu lado

  Scenario: Fluxo de atualização reutiliza endereço do trecho existente
    Given o usuário aciona "Atualizar" em um trecho já mapeado
    When é redirecionado para o fluxo de upload
    Then o sistema não solicita novo preenchimento de endereço
    And os dados do trecho existente são mantidos

  Scenario: Usuário informa colaboradores e confirma responsável na atualização
    Given o usuário está no fluxo de atualização de um trecho
    When o sistema apresenta o formulário simplificado
    Then solicita apenas a seleção de colaboradores e confirmação do responsável técnico

  Scenario: Histórico registra dados do editor na atualização
    Given o usuário conclui uma atualização de trecho
    When a edição é salva
    Then o sistema registra data, hora e identidade do editor no histórico do trecho

  Scenario: Versão anterior do laudo mantida e acessível no histórico
    Given uma atualização foi publicada para um trecho já existente
    When o usuário acessa o histórico do trecho
    Then a versão anterior do laudo está listada e acessível para consulta

