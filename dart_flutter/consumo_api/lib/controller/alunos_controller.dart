import 'package:consumo_api/models/aluno.dart';
import 'package:consumo_api/models/cidade.dart';
import 'package:consumo_api/models/curso.dart';
import 'package:consumo_api/models/endereco.dart';
import 'package:consumo_api/models/telefone.dart';
import 'package:consumo_api/repositories/alunos_repository.dart';

class AlunoController {
  final _alunosRepository = AlunosRepository();

  Future<void> findAll() async {
    final alunos = await _alunosRepository.findAll();

    alunos.forEach(print);
  }

  Future<void> findById(String id) async {
    final aluno = await _alunosRepository.findById(id);
    print(aluno);
  }

  Future<void> update() async {
    final aluno = await _alunosRepository.findById('1');
    aluno.nomeCursos.add('imersão dev');
    _alunosRepository.update(aluno);

    final alunoAlterado = await _alunosRepository.findById('1');
    print(alunoAlterado.nomeCursos);
  }

  Future<void> insert() async {
    final aluno = Aluno(
      nome: 'Murilo Tadeu',
      nomeCursos: ['Java', 'Flutter'],
      endereco: Endereco(
        rua: 'Rua Z',
        numero: 350,
        cep: '13610000',
        cidade: Cidade(id: 1, nome: 'Leme'),
        telefone: Telefone(ddd: 19, telefone: '989890562'),
      ),
      cursos: [
        Curso(id: 1, nome: 'Dart and Flutter', isAluno: true),
      ],
    );
    _alunosRepository.insert(aluno);
  }
}
