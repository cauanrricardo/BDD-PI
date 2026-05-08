Feature: Gerenciar colaboradores sob responsabilidade
  Como Engenheiro ou Técnico
  Quero gerenciar os Colaboradores sob minha responsabilidade
  Para renovar ou revogar acessos conforme necessário

  Scenario: Painel exibe listagem de colaboradores com informações completas
    Given o usuário autenticado possui perfil de Engenheiro ou Técnico
    When acessa o painel de gerenciamento de colaboradores
    Then o sistema exibe uma listagem contendo: nome, e-mail, status (Ativo / Expirado) e data de expiração de cada colaborador vinculado

  Scenario: Notificação automática por e-mail 30 dias antes da expiração
    Given um colaborador vinculado ao responsável possui acesso com data de expiração definida
    When faltam exatamente 30 dias para a expiração
    Then o sistema envia notificação por e-mail ao responsável técnico alertando sobre a proximidade da expiração

  Scenario: Revogação de acesso com confirmação obrigatória
    Given o responsável técnico está na listagem de colaboradores
    When aciona a opção "Revogar acesso" em um colaborador
    Then o sistema exibe modal de confirmação solicitando confirmação da ação
    And a revogação só é efetivada após a confirmação

  Scenario: Acesso revogado passa a status Expirado imediatamente
    Given o responsável técnico confirmou a revogação de um colaborador
    When a ação é executada
    Then o status do colaborador muda para Expirado
    And o sistema registra data e hora da revogação

  Scenario: Renovação de acesso com seleção de nova data de expiração
    Given o responsável técnico está na listagem de colaboradores
    When aciona a opção "Renovar acesso" em um colaborador com status Expirado ou próximo de expirar
    Then o sistema exibe formulário para seleção de nova data de expiração

  Scenario: Renovação confirma e ativa acesso com novo prazo
    Given o responsável técnico preencheu a nova data de expiração
    When confirma a renovação
    Then o status do colaborador muda para Ativo
    And o sistema atualiza a data de expiração com a nova data informada
    And o colaborador pode voltar a acessar o sistema normalmente
