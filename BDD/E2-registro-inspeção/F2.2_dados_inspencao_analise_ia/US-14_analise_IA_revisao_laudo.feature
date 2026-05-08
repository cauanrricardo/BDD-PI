
Feature: Acionar análise por IA e revisar laudo gerado
  Como usuário
  Quero acionar a análise por IA, acompanhar o processamento e revisar o laudo
  Para finalizar a inspeção com os resultados corretos

  Scenario: Botão de análise habilitado somente com pré-requisitos atendidos
    Given o usuário realizou upload válido de imagens e preencheu os dados geográficos
    When acessa a tela de análise
    Then o botão "Analisar com IA" está disponível para acionamento

  Scenario: Botão de análise indisponível sem upload ou dados geográficos
    Given o usuário não concluiu o upload válido ou não preencheu os dados geográficos
    When acessa a tela de análise
    Then o botão "Analisar com IA" permanece desabilitado

  Scenario: Processamento assíncrono com fila visível
    Given o usuário acionou a análise por IA
    When o processamento está em andamento
    Then o sistema exibe o status da fila de processamento
    And o usuário pode navegar livremente pelo sistema sem interromper a análise

  Scenario: Notificação in-app ao concluir o processamento
    Given a análise por IA foi concluída
    When o processamento finaliza
    Then o sistema envia notificação in-app ao usuário independente de onde ele estiver no sistema

  Scenario: Laudo exibido para revisão antes da publicação
    Given a análise por IA foi concluída com sucesso
    When o usuário acessa o resultado
    Then o sistema exibe o laudo gerado com todos os defeitos detectados
    And o usuário pode editar campos do laudo antes de finalizar

  Scenario: Detecção com baixa certeza sinalizada para revisão manual
    Given o laudo gerado contém detecções com grau de certeza inferior a 85%
    When o usuário visualiza o laudo
    Then o sistema sinaliza essas detecções com o alerta "Revisão manual recomendada"

  Scenario: Defeitos detectados seguem a classificação DNIT 005/2003-TER
    Given a análise por IA foi concluída
    When o laudo é exibido
    Then os defeitos são classificados exclusivamente nas categorias: Panelas, Trincas isoladas, Trincas interligadas, Remendos e Desgaste superficial

  Scenario: Botão de finalização disponível após revisão do laudo
    Given o usuário visualizou e revisou o laudo gerado
    When está na tela de revisão
    Then o botão "Finalizar Inspeção" está disponível para acionamento
