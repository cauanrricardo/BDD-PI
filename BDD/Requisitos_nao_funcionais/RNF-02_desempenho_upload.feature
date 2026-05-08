Feature: Garantir desempenho de upload
  Como usuário
  Quero que o upload processe com bom desempenho
  Para não aguardar tempo excessivo

  Scenario: Upload de arquivo de até 10 MB em tempo aceitável
    Given que o usuário possui um arquivo de até 10 MB para envio
    And a conexão disponível é de 10 Mbps
    And o tempo considera apenas a etapa de envio excluindo processamento de IA
    When realiza o upload do arquivo
    Then o envio é concluído em menos de 5 segundos

  Scenario: Fila de processamento de IA visível por imagem
    Given que o usuário concluiu o upload de múltiplas imagens
    When o processamento de IA é iniciado
    Then o sistema exibe a fila de processamento
    And cada imagem apresenta seu status individual na fila

  Scenario: Sistema aceita ate 10 uploads simultâneos
    Given que existem menos de 10 uploads simultâneos em andamento
    When o usuário inicia novos uploads até atingir 10 envios simultâneos
    Then o sistema aceita os uploads sem bloqueio
    And os envios permanecem em processamento normal

  Scenario: Sistema alerta ao ultrapassar 10 uploads simultâneos
    Given que já existem 10 uploads simultâneos em andamento
    When o usuário tenta iniciar um novo upload
    Then o sistema não inicia o novo envio imediatamente
    And o sistema exibe alerta informando que o limite de simultaneidade foi excedido
