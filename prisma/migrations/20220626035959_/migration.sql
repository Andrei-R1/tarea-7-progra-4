-- CreateTable
CREATE TABLE "_EstudianteToProfesor" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_EstudianteToProfesor_AB_unique" ON "_EstudianteToProfesor"("A", "B");

-- CreateIndex
CREATE INDEX "_EstudianteToProfesor_B_index" ON "_EstudianteToProfesor"("B");

-- AddForeignKey
ALTER TABLE "_EstudianteToProfesor" ADD CONSTRAINT "_EstudianteToProfesor_A_fkey" FOREIGN KEY ("A") REFERENCES "Estudiante"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_EstudianteToProfesor" ADD CONSTRAINT "_EstudianteToProfesor_B_fkey" FOREIGN KEY ("B") REFERENCES "Profesor"("id") ON DELETE CASCADE ON UPDATE CASCADE;
