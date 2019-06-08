"use strict";
const path = require("path");

const express = require("express");

const router = express.Router();

const journeyNodesControllers = require(path.join(
  __dirname,
  "..",
  "controllers",
  "journeyNodesController.js"
));
module.exports = router;
