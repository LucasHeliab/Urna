final createTableZona = '''
  CREATE TABLE zona(
    id INTEGER NOT NULL PRIMARY KEY
  )
''';

final createTableSessao = '''
  CREATE TABLE sessao(
    id INTEGER NOT NULL,
    numero INTEGER NOT NULL,
    id_zona INTEGER NOT NULL,
    FOREIGN KEY(id_zona) REFERENCES zona(id)
  )
''';

final createTableCargos = '''
  CREATE TABLE cargos(
    id INTEGER NOT NULL PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    executivo TINYINT NOT NULL,
  )
''';

final createTableEleitor = '''
  CREATE TABLE eleitor(
    codigo INTEGER NOT NULL PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    senha VARCHAR(100) NOT NULL,
    votou TINYINT NOT NULL,
    sessao INTEGER NOT NULL,
    url_foto VARCHAR(300) NOT NULL,
    FOREIGN KEY(sessao) REFERENCES sessao(id)
  )
''';

final createTableCandidato = '''
  CREATE TABLE candidato(
    codigo INTEGER NOT NULL PRIMARY KEY,
    numero VARCHAR(6) NOT NULL,
    cargo INTEGER NOT NULL,
    vice INTEGER,
    nome_campanha VARCHAR(200),
    FOREIGN KEY(codigo) REFERENCES eleitor(id),
    FOREIGN KEY(cargo) REFERENCES cargo(id),
    FOREIGN KEY(vice) REFERENCES Candidato(codigo)
  )
''';

final createTableVotos = '''
  CREATE TABLE Votos(
    id INTEGER NOT NULL PRIMARY KEY,
    numero VARCHAR(6),
    cargo INTEGER NOT NULL,
    sessao INTEGER NOT NULL,
    FOREIGN KEY(sessao) REFERENCES sessao(id)
  )
''';
