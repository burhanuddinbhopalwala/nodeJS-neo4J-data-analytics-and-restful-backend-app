const path = require("path");

const express = require("express");

const router = express.Router();

const journiesController = require(path.join(
  __dirname,
  "..",
  "controllers",
  "journies.js"
));

router.get("/:id", journiesController.getJourneyById);

module.exports = router;
