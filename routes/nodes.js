"use strict";
const path = require("path");

const express = require("express");

const router = express.Router();

const nodesController = require(path.join(
  __dirname,
  "..",
  "controllers",
  "nodes_controller"
));

module.exports = router;
