const path = require("path");

const express = require("express");
const bodyParser = require("body-parser");

const app = express();
const PORT = process.env.PORT || 3500;

const journeyRoutes = require(path.join(__dirname, "routes", "journies.js"));
const shipmentRoutes = require(path.join(__dirname, "routes", "shipments.js"));
const errorController = require(path.join(
  __dirname,
  "controllers",
  "error.js"
));

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false })); // For space, %20s problem

app.use("/journey", journeyRoutes);
app.use("/shipment", shipmentRoutes);
app.use((error, req, res, next) => {
  if (error.httpStatusCode === 500) errorController.get500(req, res, next);
});
app.use(errorController.get404);

app.listen(PORT, () => console.log("Neo4j started listening on port 3500..."));
