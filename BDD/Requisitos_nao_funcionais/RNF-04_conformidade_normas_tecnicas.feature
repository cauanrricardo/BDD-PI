Feature: Garantir conformidade com normas tecnicas
  Como usuário
  Quero que os cálculos e laudos sigam as normas DNIT e ASTM
  Para que sejam tecnicamente aceitos pelos órgãos competentes

  Scenario: Classificação de defeitos segue DNIT 005/2003-TER
    Given que o sistema identifica defeitos no pavimento
    When classifica os defeitos no laudo
    Then o critério aplicado segue a norma DNIT 005/2003-TER

  Scenario: Cálculo de PCI segue ASTM D6433
    Given que o sistema possui os dados necessários para cálculo de PCI
    When calcula o índice PCI
    Then o cálculo é executado conforme a norma ASTM D6433

  Scenario: Cálculo de IGG e IGGE segue normas DNIT específicas
    Given que o sistema possui os dados necessários para cálculo de IGG e IGGE
    When calcula os índices IGG e IGGE
    Then o IGG segue a norma DNIT 006/2003-PRO
    And o IGGE segue a norma DNIT 008/2003-PRO

  Scenario: Laudo referencia norma, versão e critério no rodapé
    Given que um laudo técnico é gerado
    When o documento final é disponibilizado ao usuário
    Then o rodapé cita a norma aplicada
    And informa a versão da norma
    And informa o critério utilizado
