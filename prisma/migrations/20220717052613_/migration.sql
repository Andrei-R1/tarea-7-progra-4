/*
  Warnings:

  - You are about to drop the `_EstudianteToMateria` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "_EstudianteToMateria" DROP CONSTRAINT "_EstudianteToMateria_A_fkey";

-- DropForeignKey
ALTER TABLE "_EstudianteToMateria" DROP CONSTRAINT "_EstudianteToMateria_B_fkey";

-- DropTable
DROP TABLE "_EstudianteToMateria";

-- CreateTable
CREATE TABLE "Matricula" (
    "id" SERIAL NOT NULL,
    "estudiante_id" INTEGER NOT NULL,
    "materia_id" INTEGER NOT NULL,

    CONSTRAINT "Matricula_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Matricula" ADD CONSTRAINT "Matricula_estudiante_id_fkey" FOREIGN KEY ("estudiante_id") REFERENCES "Estudiante"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Matricula" ADD CONSTRAINT "Matricula_materia_id_fkey" FOREIGN KEY ("materia_id") REFERENCES "Materia"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
