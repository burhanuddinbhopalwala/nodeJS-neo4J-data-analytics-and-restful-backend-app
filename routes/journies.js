"use strict";
const path = require("path");

const express = require("express");

const router = express.Router();

const journiesController = require(path.join(
  __dirname,
  "..",
  "controllers",
  "journiesController.js"
));

// GET /journies/journey_id
router.get("/:journey_id", journiesController.getJourneyById);

module.exports = router;
