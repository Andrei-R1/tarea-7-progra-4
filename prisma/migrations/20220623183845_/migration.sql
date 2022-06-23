-- CreateTable
CREATE TABLE "Estudiante" (
    "id" SERIAL NOT NULL,
    "primer_nombre" TEXT NOT NULL,
    "primer_apellido" TEXT NOT NULL,
    "edad" INTEGER NOT NULL,
    "pais_origen" TEXT NOT NULL,
    "carrera" TEXT NOT NULL,
    "materias_cursadas" TEXT[],
    "es_moroso" BOOLEAN NOT NULL,
    "deuda_ciclo_actual" INTEGER NOT NULL,

    CONSTRAINT "Estudiante_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Materia" (
    "id" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "codigo" INTEGER NOT NULL,
    "profesor" TEXT NOT NULL,
    "iniciales_profesor" TEXT NOT NULL,
    "creditos" INTEGER NOT NULL,
    "carrera" TEXT NOT NULL,

    CONSTRAINT "Materia_pkey" PRIMARY KEY ("id")
);
