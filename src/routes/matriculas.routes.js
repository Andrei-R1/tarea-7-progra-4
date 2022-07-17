import { Router } from 'express';
import { PrismaClient } from '@prisma/client';

const router = Router();
const prisma = new PrismaClient();

// Get y Post para matriculas

router.get('/matricula', async (req, res) => {
  const matricula = await prisma.matricula.findMany();
  res.json(matricula);
});

router.post('/matricula', async (req, res) => {
  const result = await prisma.matricula.create({
    // req.body es la info que manda el usuario para crear
    data: req.body,
  });
  res.json(result);
});

// Get, Put y Delete por id para matriculas

router.get('/matricula/:id', async (req, res) => {
  const { id } = req.params;
  try {
    const getMatricula = await prisma.matricula.findUnique({
      where: { id: Number(id) },
    });
    if (getMatricula) {
      res.json(getMatricula);
    } else {
      res.json({ error: `No existe ninguna matricula con la id ${id}` });
    }
  } catch (e) {
    res.json({ error: `Matricula con el id ${id} no existe` });
  }
});

router.put('/matricula/:id', async (req, res) => {
  const { id } = req.params;
  try {
    const updateMatricula = await prisma.matricula.update({
      where: { id: Number(id) },
      // req.body es la info que manda el usuario para actualizar
      data: req.body,
    });
    res.json(updateMatricula);
  } catch (e) {
    res.json({ error: `La matricula con el id ${id} no existe` });
  }
});

router.delete(`/matricula/:id`, async (req, res) => {
  const { id } = req.params;
  const matricula = await prisma.matricula.delete({
    where: {
      id: Number(id),
    },
  });
  res.json(matricula);
});

export default router;