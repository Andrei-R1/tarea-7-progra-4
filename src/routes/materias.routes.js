import { Router } from "express";
import { PrismaClient } from "@prisma/client";

const router = Router();
const prisma = new PrismaClient();

// Get y Post para materias

router.get("/materia", async (req, res) => {
  const materia = await prisma.materia.findMany();
  res.json(materia);
});

router.post("/materia", async (req, res) => {
  const result = await prisma.materia.create({
    // req.body es la info que manda el usuario para crear
    data: req.body,
  });
  res.json(result);
});

// Get, Put y Delete por id para materias

router.get("/materia/:id", async (req, res) => {
  const { id } = req.params;
  try {
    const getMateria = await prisma.materia.findUnique({
      where: { id: Number(id) },
    });
    if (getMateria) {
      res.json(getMateria);
    } else {
      res.json({ error: `No existe ninguna materia con la id ${id}` });
    }
  } catch (e) {
    res.json({ error: `Job con el id ${id} no existe` });
  }
});

router.put("/materia/:id", async (req, res) => {
  const { id } = req.params;
  try {
    const updateMateria = await prisma.materia.update({
      where: { id: Number(id) },
      // req.body es la info que manda el usuario para actualizar
      data: req.body,
    });
    res.json(updateMateria);
  } catch (e) {
    res.json({ error: `La materia con el id ${id} no existe` });
  }
});

router.delete(`/materia/:id`, async (req, res) => {
  const { id } = req.params;
  const materia = await prisma.materia.delete({
    where: {
      id: Number(id),
    },
  });
  res.json(materia);
});

// Get estudiantes de una materia

router.get("/materia/:id/estudiantes", async (req, res) => {
  const { id } = req.params;
  // const { id } = req.params;
  const estudiantes = await prisma.estudiante.findUnique({
    where: {
      materia_id: Number(id),
    },
  });

  res.json(estudiantes);
});

export default router;