-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Modulo" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "nome" TEXT NOT NULL,
    "nota1" REAL,
    "nota2" REAL,
    "nota3" REAL,
    "id_aluno" TEXT NOT NULL,
    CONSTRAINT "Modulo_id_aluno_fkey" FOREIGN KEY ("id_aluno") REFERENCES "Aluno" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Modulo" ("id", "id_aluno", "nome", "nota1", "nota2", "nota3") SELECT "id", "id_aluno", "nome", "nota1", "nota2", "nota3" FROM "Modulo";
DROP TABLE "Modulo";
ALTER TABLE "new_Modulo" RENAME TO "Modulo";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
