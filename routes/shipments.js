"use strict";
const path = require("path");

const express = require("express");

const router = express.Router();

const shipmentsController = require(path.join(
  __dirname,
  "..",
  "controllers",
  "shipmentsController.js"
));

// GET /shipments/total_transit_hours/shipment_id
router.get(
  "/total_transit_hours/:shipment_id",
  shipmentsController.getShipmentTotalTransitTime
);

module.exports = router;
