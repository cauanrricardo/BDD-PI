Feature: Garantir confiabilidade da IA nas deteccoes
  Como usuário
  Quero que a IA tenha alta precisão nas detecções
  Para confiar nos resultados

  Scenario: Modelo atende acurácia mínima no dataset de validação
    Given que o modelo de IA é avaliado em dataset de validação balanceado por tipo de defeito
    When a avaliação de desempenho é executada
    Then a acurácia do modelo é maior ou igual a 90%

  Scenario: Certeza média das detecções exibida no laudo
    Given que o processamento de IA de uma inspeção foi concluído
    When o laudo é gerado
    Then o laudo exibe a certeza média das detecções

  Scenario: Detecções com baixa certeza são sinalizadas para revisão
    Given que existem detecções com certeza inferior a 85%
    When o resultado é apresentado no laudo
    Then essas detecções são sinalizadas para revisão manual
