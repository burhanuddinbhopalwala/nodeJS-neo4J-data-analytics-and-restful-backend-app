const path = require("path");

const express = require("express");
const bodyParser = require("body-parser");

const nodesRoutes = require(path.join(__dirname, "routes", "nodes.js"));
const journiesRoutes = require(path.join(__dirname, "routes", "journies.js"));
const shipmentsRoutes = require(path.join(__dirname, "routes", "shipments.js"));
const journeyNodesRoutes = require(path.join(
  __dirname,
  "routes",
  "journey_nodes.js"
));
const errorController = require(path.join(
  __dirname,
  "controllers",
  "error.js"
));

const app = express();
const PORT = process.env.PORT || 3500;

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use((req, res, next) => {
  res.setHeader("Access-Control-Allow-Origin", "*");
  res.setHeader(
    "Access-Control-Allow-Methods",
    "OPTIONS, GET, POST, PUT, PATCH, DELETE"
  );
  res.setHeader("Access-Control-Allow-Headers", "Content-Type, Authorization");
  next();
});

app.use("/nodes", nodesRoutes);
app.use("/journies", journiesRoutes);
app.use("/shipments", shipmentsRoutes);
app.use("/journey_nodes", journeyNodesRoutes);
app.use(errorController.throwError);
app.use(errorController.throw404);

app.listen(PORT, () => console.log("Neo4j started listening on port 3500..."));
