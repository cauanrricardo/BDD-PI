
Feature: Visualizar e refinar localização de inspeções no mapa
  Como usuário
  Quero visualizar todas as imagens processadas em um mapa
  Para conferir e corrigir a precisão da localização de cada inspeção

  Scenario: Mapa exibe marcadores de todas as imagens processadas
    Given o usuário concluiu o processamento de um lote de imagens
    When acessa a tela de revisão no mapa
    Then o sistema exibe o mapa OpenStreetMap com marcadores para todas as imagens
    And os marcadores incluem tanto imagens com GPS original quanto as com localização preenchida manualmente

  Scenario: Usuário visualiza imagem ao clicar em um marcador
    Given o mapa está carregado com os marcadores das inspeções
    When o usuário clica em um marcador específico
    Then o sistema exibe a imagem associada àquela inspeção

  Scenario: Usuário ajusta posição de marcador via drag-and-drop
    Given o usuário está visualizando o mapa com os marcadores
    When arrasta um marcador para uma nova posição no mapa
    Then o sistema atualiza automaticamente os campos de latitude e longitude no banco de dados
    And a nova posição fica visualmente refletida no marcador

  Scenario: Usuário confirma o registro das inspeções após revisão
    Given o usuário revisou e ajustou as posições necessárias no mapa
    When confirma o registro das inspeções
    Then o sistema salva o estado final de todas as localizações
    And avança para a etapa de endereçamento de trechos

 
  Scenario: Todas as imagens exibidas no mapa possuem localização resolvida
    Given o usuário passou pela etapa de resolução de metadados (US-11) e todas as imagens foram tratadas
    When acessa o mapa de revisão geral
    Then o sistema exibe marcadores apenas para imagens com coordenadas válidas ou marcadas como justificadas
    And não existem imagens pendentes de localização no fluxo do mapa