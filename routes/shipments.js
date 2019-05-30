const path = require("path");

const express = require("express");
const { check, body } = require("express-validator/check");

const router = express.Router();

const shipmentsController = require(path.join(
  __dirname,
  "..",
  "controllers",
  "shipments.js"
));

// GET /shipments/total_transit_hours/:id
router.get(
  "/total_transit_hours/:id",
  shipmentsController.getShipmentTotalTransitTime
);

module.exports = router;
