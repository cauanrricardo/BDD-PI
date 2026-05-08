
Feature: Solicitar troca de responsável técnico
  Como Colaborador
  Quero solicitar a troca do meu responsável para outro profissional cadastrado
  Para que meu vínculo técnico fique sempre atualizado

  Scenario: Solicitação enviada com sucesso para novo responsável
    Given o colaborador está autenticado e acessa a opção de troca de responsável
    When informa o número de registro de um profissional cadastrado e o sistema confirma o número de resgitro
    Then o sistema registra a solicitação com status Pendente
    And o novo responsável recebe notificação no painel sobre a solicitação do colaborador

  Scenario: Novo responsável aceita a solicitação
    Given o novo responsável recebeu uma solicitação de vínculo pendente
    When acessa o painel e aceita a solicitação
    Then o vínculo com o responsável anterior é encerrado
    And o novo vínculo passa a status Ativo

  Scenario: Novo responsável recusa a solicitação
    Given o novo responsável recebeu uma solicitação de vínculo pendente
    When acessa o painel e recusa a solicitação
    Then o vínculo anterior permanece ativo e inalterado para o colaborador
    And o colaborador é notificado da recusa do novo responsável

  Scenario: Vínculo anterior não é encerrado enquanto solicitação está pendente
    Given o colaborador enviou uma solicitação de troca ainda não respondida
    When o novo responsável ainda não aceitou nem recusou
    Then o vínculo com o responsável atual permanece ativo

  Scenario: Técnico de edificações tenta solicitar upgrade para responsável independente
    Given o colaborador possui perfil de Técnico de Edificações
    When tenta selecionar um responsável com perfil que exige assinatura técnica independente
    Then o sistema bloqueia a solicitação
    And exibe mensagem informando a restrição de assinatura técnica para esse perfil

  Scenario: Número de registro informado não corresponde a nenhum profissional cadastrado
    Given o colaborador está na tela de troca de responsável
    When informa um número de registro inexistente no sistema
    Then o sistema exibe aviso de profissional não encontrado
    And mantém o vínculo atual inalterado
