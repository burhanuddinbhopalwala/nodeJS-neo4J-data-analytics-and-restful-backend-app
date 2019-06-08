"use strict";
const path = require("path");

const express = require("express");

const router = express.Router();

const nodesController = require(path.join(
  __dirname,
  "..",
  "controllers",
  "nodesController"
));

module.exports = router;
