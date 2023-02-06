class LoginController {
  String? validatorCodigo(String? codigo) {
    if (codigo == null || codigo.isEmpty) {
      return 'Digite seu código';
    }
    return null;
  }

  String? validatorSenha(String? senha) {
    if (senha == null || senha.isEmpty) {
      return 'Digite sua senha';
    }
    return null;
  }
}
