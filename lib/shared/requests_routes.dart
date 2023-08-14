

class RequestRoutes {
  static const String baseUrl = 'http://18.233.10.135';

  static const String cadastroLogin = '$baseUrl/usuario/cadastrar-login';
  static String cadastroDadosUsuario(int idLogin) => '$baseUrl/usuario/$idLogin/cadastrar-usuario';
  static const String loginUsuario = '$baseUrl/usuario/login';


  static String listarProjetos(int idUsuario) => '$baseUrl/projeto/$idUsuario/listar-criados';
  static String projeto(int idProjeto) => '$baseUrl/projeto/$idProjeto';
  static String dadosUsuario(int id) => '$baseUrl/usuario/listar/$id';
  static String projetoEditar(int idProjeto) => '$baseUrl/projeto/$idProjeto/editar';
  static String projetoCriar(int idUsuario) => '$baseUrl/projeto/$idUsuario/criar';
  // final String cadastroLogin = 'usuario/cadastrar-login';
  // final String cadastroLogin = 'usuario/cadastrar-login';
  // final String cadastroLogin = 'usuario/cadastrar-login';
  // final String cadastroLogin = 'usuario/cadastrar-login';
  // final String cadastroLogin = 'usuario/cadastrar-login';

}