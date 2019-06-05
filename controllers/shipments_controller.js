"use strict";
const path = require("path");

const { driver, session } = require(path.join(
  __dirname,
  "..",
  "config",
  "config.js"
)).neo4j();

class ShipmentsController {
  static async getShipmentTotalTransitTime(req, res, next) {
    try {
      const shipmentId = +req.params.id;
      const query =
        "MATCH (s:Shipment {id: $shipmentId})<-[r:HAVING]-(jn:JourneyNode) MATCH (n_start)-[rel1:START]->(jn)-[rel2:END]->(n_end:Node) RETURN sum(jn.transit_time);";
      const result = await session.run(query, { shipmentId: shipmentId });
      session.close();
      if (
        !result ||
        result.records.length === 0 ||
        +result.records[0]._fields[0].low === 0
      ) {
        const error = new Error("Shipment not found!");
        error.httpStatusCode = 404;
        throw error;
      }
      res.status(200).json({
        message: `Fetched successfully total transit time for shipment_id: ${shipmentId}!`,
        result: +result.records[0]._fields[0].low
      });
      driver.close();
      return;
    } catch (error) {
      if (!error.httpStatusCode) error.httpStatusCode = 500;
      next(error);
    }
  }
}

module.exports = ShipmentsController;
