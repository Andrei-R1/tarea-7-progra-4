/*
  Warnings:

  - You are about to drop the column `materias_cursadas` on the `Estudiante` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Estudiante" DROP COLUMN "materias_cursadas";

-- CreateTable
CREATE TABLE "Facultad" (
    "id" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "nombre_decano" TEXT NOT NULL,
    "abreviacion" TEXT NOT NULL,

    CONSTRAINT "Facultad_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Profesor" (
    "id" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "apellido" TEXT NOT NULL,

    CONSTRAINT "Profesor_pkey" PRIMARY KEY ("id")
);
