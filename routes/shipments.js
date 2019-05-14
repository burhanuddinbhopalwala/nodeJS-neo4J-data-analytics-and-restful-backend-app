const path = require("path");

const express = require("express");

const router = express.Router();

const journiesController = require(path.join(
  __dirname,
  "..",
  "controllers",
  "shipments.js"
));

router.get(
  "/total_transit_hours/:id",
  journiesController.getShipmentTotalTransitTime
);

module.exports = router;
