import express from "express";
import { PrismaClient } from "@prisma/client";

import estudiantesRoutes from "./routes/estudiantes.routes.js";
import materiasRoutes from "./routes/materias.routes.js";
import profesoresRoutes from "./routes/profesores.routes.js";
import facultadesRoutes from "./routes/facultades.routes.js";
import matriculasRoutes from "./routes/matriculas.routes.js";
import morgan from "morgan";

const app = express();
app.use(morgan("dev"));
const prisma = new PrismaClient();

app.use(express.json());
app.use(estudiantesRoutes);
app.use(materiasRoutes);
app.use(profesoresRoutes);
app.use(facultadesRoutes);
app.use(matriculasRoutes);

app.listen(process.env.PORT || 8002, () => {
  console.log(`🚀 Example app listening on port 8002`);
});

app.get("/", (req, res) => {
  res.send("- API en funcionamiento -");
});