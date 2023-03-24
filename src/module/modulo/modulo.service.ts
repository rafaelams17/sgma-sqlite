import { Injectable } from '@nestjs/common';
import { PrismaService } from '../../database/PrismaService';
import { ModuloDTO } from './modulo.dto';

@Injectable()
export class ModuloService {
  constructor(private prisma: PrismaService) {}

  // cria um módulo
  async create(data: ModuloDTO) {
    // verificar se o modulo já foi criado
    const moduloExists = await this.prisma.modulo.findFirst({
      // procure um modulo onde o nome é igual ao data.nome
      where: {
        nome: data.nome,
        id_aluno: data.id_aluno,
      },
    });

    // se caso o aluno exista vai lançar um exceção
    if (moduloExists) {
      throw new Error('Modulo já existe!');
    }

    // se o modulo não existir ele é salvo no banco

    // await é usado para aguardar a criação do aluno
    const modulo = await this.prisma.modulo.create({
      data,
    });
    return modulo;
  }

  // retornar todos os módulos disponíveis para a aplicação
  async findAll() {
    return this.prisma.modulo.findMany();
  }

  // atualizar um módulo
  async update(id: string, data: ModuloDTO) {
    const moduloExists = await this.prisma.modulo.findUnique({
      where: {
        id,
      },
    });

    // se livro não existir ele deve lançar uma exceção
    if (!moduloExists) {
      throw new Error('Módulo não existe!');
    }

    return await this.prisma.modulo.update({
      data,
      where: {
        id,
      },
    });
  }
}
