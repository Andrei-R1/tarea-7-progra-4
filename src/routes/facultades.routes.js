import { Router } from "express";
import { PrismaClient } from "@prisma/client";

const router = Router();
const prisma = new PrismaClient();

// Get y Post para facultades

router.get("/facultad", async (req, res) => {
  const facultad = await prisma.facultad.findMany();
  res.json(facultad);
});

router.post("/facultad", async (req, res) => {
  const result = await prisma.facultad.create({
    // req.body es la info que manda el usuario para crear
    data: req.body,
  });
  res.json(result);
});

// Get, Put y Delete por id para facultades

router.get("/facultad/:id", async (req, res) => {
  const { id } = req.params;
  try {
    const getFacultad = await prisma.facultad.findUnique({
      where: { id: Number(id) },
    });
    if (getFacultad) {
      res.json(getFacultad);
    } else {
      res.json({ error: `No existe ninguna facultad con la id ${id}` });
    }
  } catch (e) {
    res.json({ error: `Job con el id ${id} no existe` });
  }
});

router.put("/facultad/:id", async (req, res) => {
  const { id } = req.params;
  try {
    const updateFacultad = await prisma.facultad.update({
      where: { id: Number(id) },
      // req.body es la info que manda el usuario para actualizar
      data: req.body,
    });
    res.json(updateFacultad);
  } catch (e) {
    res.json({ error: `La facultad con el id ${id} no existe` });
  }
});

router.delete("/facultad/:id", async (req, res) => {
  const { id } = req.params;
  const facultad = await prisma.facultad.delete({
    where: {
      id: Number(id),
    },
  });
  res.json(facultad);
});

// Get estudiantes de una facultad

router.get("/facultad/:id/estudiantes", async (req, res) => {
  const { id } = req.params;
  // const id = req.params.id

  const estudiantes = await prisma.estudiante.findMany({
    where: {
      facultad_id: Number(id),
    },
  });

  res.json(estudiantes);
});

// Get profesores de una facultad

router.get("/facultad/:id/profesores", async (req, res) => {
  const { id } = req.params;
  // const id = req.params.id

  const profesores = await prisma.profesor.findMany({
    where: {
      facultad_id: Number(id),
    },
  });

  res.json(profesores);
});

// Get materias de una facultad

router.get("/facultad/:id/materias", async (req, res) => {
  const { id } = req.params;
  // const id = req.params.id

  const materias = await prisma.materia.findMany({
    where: {
      facultad_id: Number(id),
    },
  });

  res.json(materias);
});

export default router;