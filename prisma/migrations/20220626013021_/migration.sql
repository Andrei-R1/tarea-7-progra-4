/*
  Warnings:

  - You are about to drop the column `materia_nombre` on the `Facultad` table. All the data in the column will be lost.
  - You are about to drop the column `materia_id` on the `Profesor` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Profesor" DROP CONSTRAINT "Profesor_materia_id_fkey";

-- AlterTable
ALTER TABLE "Facultad" DROP COLUMN "materia_nombre";

-- AlterTable
ALTER TABLE "Profesor" DROP COLUMN "materia_id";
