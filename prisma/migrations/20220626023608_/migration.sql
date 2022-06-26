-- CreateTable
CREATE TABLE "Estudiante" (
    "id" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "apellido" TEXT NOT NULL,
    "edad" INTEGER NOT NULL,
    "pais" TEXT NOT NULL,
    "carrera" TEXT NOT NULL,
    "es_moroso" BOOLEAN NOT NULL,
    "deuda_ciclo_actual" INTEGER NOT NULL,
    "facultad_id" INTEGER NOT NULL,

    CONSTRAINT "Estudiante_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Materia" (
    "id" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "codigo" INTEGER NOT NULL,
    "creditos" INTEGER NOT NULL,
    "carrera" TEXT NOT NULL,
    "profesor_id" INTEGER NOT NULL,
    "facultad_id" INTEGER NOT NULL,

    CONSTRAINT "Materia_pkey" PRIMARY KEY ("id")
);

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
    "facultad_id" INTEGER NOT NULL,

    CONSTRAINT "Profesor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_EstudianteToMateria" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_EstudianteToMateria_AB_unique" ON "_EstudianteToMateria"("A", "B");

-- CreateIndex
CREATE INDEX "_EstudianteToMateria_B_index" ON "_EstudianteToMateria"("B");

-- AddForeignKey
ALTER TABLE "Estudiante" ADD CONSTRAINT "Estudiante_facultad_id_fkey" FOREIGN KEY ("facultad_id") REFERENCES "Facultad"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Materia" ADD CONSTRAINT "Materia_facultad_id_fkey" FOREIGN KEY ("facultad_id") REFERENCES "Facultad"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Materia" ADD CONSTRAINT "Materia_profesor_id_fkey" FOREIGN KEY ("profesor_id") REFERENCES "Profesor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Profesor" ADD CONSTRAINT "Profesor_facultad_id_fkey" FOREIGN KEY ("facultad_id") REFERENCES "Facultad"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_EstudianteToMateria" ADD CONSTRAINT "_EstudianteToMateria_A_fkey" FOREIGN KEY ("A") REFERENCES "Estudiante"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_EstudianteToMateria" ADD CONSTRAINT "_EstudianteToMateria_B_fkey" FOREIGN KEY ("B") REFERENCES "Materia"("id") ON DELETE CASCADE ON UPDATE CASCADE;
