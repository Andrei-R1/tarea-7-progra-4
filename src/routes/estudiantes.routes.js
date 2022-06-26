import { Router } from "express";
import { PrismaClient } from "@prisma/client";

const router = Router();
const prisma = new PrismaClient();

// Get y Post para estudiantes

router.get("/estudiante", async (req, res) => {
  const estudiante = await prisma.estudiante.findMany();
  res.json(estudiante);
});

router.post("/estudiante", async (req, res) => {
  const result = await prisma.estudiante.create({
    // req.body es la info que manda el usuario para crear
    data: req.body,
  });
  res.json(result);
});

// Get, Put y Delete por id para estudiantes

router.get("/estudiante/:id", async (req, res) => {
  const { id } = req.params;
  try {
    const getEstudiante = await prisma.estudiante.findUnique({
      where: { id: Number(id) },
    });
    if (getEstudiante) {
      res.json(getEstudiante);
    } else {
      res.json({ error: `No existe ningun estudiante con la id ${id}` });
    }
  } catch (e) {
    res.json({ error: `Job con el id ${id} no existe` });
  }
});

router.put("/estudiante/:id", async (req, res) => {
  const { id } = req.params;
  try {
    const updateEstudiante = await prisma.estudiante.update({
      where: { id: Number(id) },
      // req.body es la info que manda el usuario para actualizar
      data: req.body,
    });
    res.json(updateEstudiante);
  } catch (e) {
    res.json({ error: `El estudiante con el id ${id} no existe` });
  }
});

router.delete(`/estudiante/:id`, async (req, res) => {
  const { id } = req.params;
  const estudiante = await prisma.estudiante.delete({
    where: {
      id: Number(id),
    },
  });
  res.json(estudiante);
});

// Get materias de un estudiante

router.get("/estudiante/:id/materias", async (req, res) => {
  const { id } = req.params;
  // const id = req.params.id
  const materias = await prisma.materia.findMany({
    where: {
      materia_id: Number(id),
    },
  });

  res.json(materias);
});

export default router;