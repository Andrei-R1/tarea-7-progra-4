/*
  Warnings:

  - You are about to drop the column `pais_origen` on the `Estudiante` table. All the data in the column will be lost.
  - You are about to drop the column `primer_apellido` on the `Estudiante` table. All the data in the column will be lost.
  - You are about to drop the column `primer_nombre` on the `Estudiante` table. All the data in the column will be lost.
  - You are about to drop the column `iniciales_profesor` on the `Materia` table. All the data in the column will be lost.
  - You are about to drop the column `profesor` on the `Materia` table. All the data in the column will be lost.
  - Added the required column `apellido` to the `Estudiante` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nombre` to the `Estudiante` table without a default value. This is not possible if the table is not empty.
  - Added the required column `pais` to the `Estudiante` table without a default value. This is not possible if the table is not empty.
  - Added the required column `materia_id` to the `Facultad` table without a default value. This is not possible if the table is not empty.
  - Added the required column `materia_nombre` to the `Facultad` table without a default value. This is not possible if the table is not empty.
  - Added the required column `materia_id` to the `Profesor` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Estudiante" DROP COLUMN "pais_origen",
DROP COLUMN "primer_apellido",
DROP COLUMN "primer_nombre",
ADD COLUMN     "apellido" TEXT NOT NULL,
ADD COLUMN     "nombre" TEXT NOT NULL,
ADD COLUMN     "pais" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Facultad" ADD COLUMN     "materia_id" INTEGER NOT NULL,
ADD COLUMN     "materia_nombre" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Materia" DROP COLUMN "iniciales_profesor",
DROP COLUMN "profesor";

-- AlterTable
ALTER TABLE "Profesor" ADD COLUMN     "materia_id" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "Facultad" ADD CONSTRAINT "Facultad_materia_id_fkey" FOREIGN KEY ("materia_id") REFERENCES "Materia"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Profesor" ADD CONSTRAINT "Profesor_materia_id_fkey" FOREIGN KEY ("materia_id") REFERENCES "Materia"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
