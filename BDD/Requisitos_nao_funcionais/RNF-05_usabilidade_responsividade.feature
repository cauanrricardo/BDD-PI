Feature: Garantir usabilidade e responsividade da interface
  Como usuário
  Quero que a interface seja intuitiva e responsiva em desktop e dispositivos móveis
  Para usá-la em escritório e em campo

  Scenario: Layout responsivo por faixas de largura
    Given que o usuário acessa o sistema em diferentes tamanhos de tela
    When visualiza a interface em resolução desktop (maior ou igual a 1280 px)
    Then o layout desktop é aplicado corretamente
    When visualiza a interface em resolução tablet (de 768 px a 1279 px)
    Then o layout tablet é aplicado corretamente
    When visualiza a interface em resolução mobile (menor que 768 px)
    Then o layout mobile é aplicado corretamente

  Scenario: Navegação e toque adequados em dispositivos móveis
    Given que o usuário acessa o sistema em dispositivo móvel
    When interage com o menu principal
    Then o sistema exibe menu no formato hambúrguer
    And os botões interativos possuem área de toque maior ou igual a 44 por 44 px

  Scenario: Upload por câmera e galeria no mobile
    Given que o usuário está em dispositivo móvel na tela de upload
    When escolhe anexar uma imagem
    Then o sistema permite envio pela câmera do dispositivo
    And o sistema permite envio pela galeria do dispositivo

  Scenario: Painel Meus Trabalhos carrega em tempo aceitável
    Given que o usuário autenticado acessa o painel "Meus Trabalhos"
    When o carregamento é iniciado em conexão de banda larga
    Then o painel é exibido em menos de 3 segundos

  Scenario: Compatibilidade com navegadores suportados
    Given que o usuário acessa o sistema nos navegadores suportados
    When utiliza as principais funcionalidades da aplicação
    Then o sistema funciona no Chrome, Firefox e Edge nas últimas 2 versões
    And o sistema funciona no Chrome Mobile e Safari Mobile
