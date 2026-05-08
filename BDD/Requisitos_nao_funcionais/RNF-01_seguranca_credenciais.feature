Feature: Garantir segurança e proteção de credenciais
  Como usuário
  Quero que minhas credenciais e dados sejam protegidos
  Para ter segurança no acesso ao sistema

  Scenario: Senhas são armazenadas com hash seguro
    Given que um usuário cria ou altera sua senha
    When a senha é persistida no banco
    Then ela é armazenada com algoritmo bcrypt
    And o fator de custo é maior ou igual a 12

  Scenario: Comunicação ocorre apenas por canal seguro
    Given que o usuário acessa o sistema via navegador
    When uma requisição é realizada
    Then a conexão utiliza HTTPS com TLS 1.2 ou superior
    And requisições HTTP são redirecionadas para HTTPS

  Scenario: Sessão expira após inatividade
    Given que o usuário autenticou sem selecionar "Lembrar-me"
    When permanece 8 horas sem atividade
    Then a sessão é encerrada automaticamente
    And uma nova autenticação é solicitada

  Scenario: Conta é bloqueada após tentativas inválidas consecutivas
    Given que a conta atingiu 5 tentativas de autenticação incorretas consecutivas
    When o usuário tenta autenticar novamente antes de 15 minutos
    Then o acesso permanece bloqueado
    And o sistema informa o tempo restante de bloqueio
