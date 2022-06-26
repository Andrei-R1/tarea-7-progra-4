import { Router } from "express";
import { PrismaClient } from "@prisma/client";

const router = Router();
const prisma = new PrismaClient();

// Get y Post para profesor

router.get("/profesor", async (req, res) => {
  const profesor = await prisma.profesor.findMany();
  res.json(profesor);
});

router.post("/profesor", async (req, res) => {
  const result = await prisma.profesor.create({
    // req.body es la info que manda el usuario para crear
    data: req.body,
  });
  res.json(result);
});

// Get, Put y Delete por id para profesor

router.get("/profesor/:id", async (req, res) => {
  const { id } = req.params;
  try {
    const getProfesor = await prisma.profesor.findUnique({
      where: { id: Number(id) },
    });
    if (getProfesor) {
      res.json(getProfesor);
    } else {
      res.json({ error: `No existe ningun profesor con la id ${id}` });
    }
  } catch (e) {
    res.json({ error: `Profesor con el id ${id} no existe` });
  }
});

router.put("/profesor/:id", async (req, res) => {
  const { id } = req.params;
  try {
    const updateProfesor = await prisma.profesor.update({
      where: { id: Number(id) },
      // req.body es la info que manda el usuario para actualizar
      data: req.body,
    });
    res.json(updateProfesor);
  } catch (e) {
    res.json({ error: `El profesor con el id ${id} no existe` });
  }
});

router.delete(`/profesor/:id`, async (req, res) => {
  const { id } = req.params;
  const profesor = await prisma.profesor.delete({
    where: {
      id: Number(id),
    },
  });
  res.json(profesor);
});

// Get materias de un profesor

router.get("/profesor/:id/materias", async (req, res) => {
  const { id } = req.params;
  // const id = req.params.id
  const materias = await prisma.materia.findMany({
    where: {
      profesor_id: Number(id),
    },
  });

  res.json(materias);
});

export default router;