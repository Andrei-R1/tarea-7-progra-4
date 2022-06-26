/*
  Warnings:

  - You are about to drop the column `materia_id` on the `Facultad` table. All the data in the column will be lost.
  - Added the required column `facultad_id` to the `Estudiante` table without a default value. This is not possible if the table is not empty.
  - Added the required column `facultad_id` to the `Materia` table without a default value. This is not possible if the table is not empty.
  - Added the required column `profesor_id` to the `Materia` table without a default value. This is not possible if the table is not empty.
  - Added the required column `facultad_id` to the `Profesor` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Facultad" DROP CONSTRAINT "Facultad_materia_id_fkey";

-- AlterTable
ALTER TABLE "Estudiante" ADD COLUMN     "facultad_id" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Facultad" DROP COLUMN "materia_id";

-- AlterTable
ALTER TABLE "Materia" ADD COLUMN     "facultad_id" INTEGER NOT NULL,
ADD COLUMN     "profesor_id" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Profesor" ADD COLUMN     "facultad_id" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "Estudiante" ADD CONSTRAINT "Estudiante_facultad_id_fkey" FOREIGN KEY ("facultad_id") REFERENCES "Facultad"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Materia" ADD CONSTRAINT "Materia_facultad_id_fkey" FOREIGN KEY ("facultad_id") REFERENCES "Facultad"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Materia" ADD CONSTRAINT "Materia_profesor_id_fkey" FOREIGN KEY ("profesor_id") REFERENCES "Profesor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Profesor" ADD CONSTRAINT "Profesor_facultad_id_fkey" FOREIGN KEY ("facultad_id") REFERENCES "Facultad"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
