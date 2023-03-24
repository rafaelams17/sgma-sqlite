-- CreateTable
CREATE TABLE "Aluno" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "nome" TEXT NOT NULL,
    "cpf" TEXT NOT NULL,
    "data_nasc" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Modulo" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "nome" TEXT NOT NULL,
    "nota1" REAL NOT NULL,
    "nota2" REAL NOT NULL,
    "nota3" REAL NOT NULL,
    "id_aluno" TEXT NOT NULL,
    CONSTRAINT "Modulo_id_aluno_fkey" FOREIGN KEY ("id_aluno") REFERENCES "Aluno" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "usuario" TEXT NOT NULL,
    "senha" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Aluno_data_nasc_key" ON "Aluno"("data_nasc");
