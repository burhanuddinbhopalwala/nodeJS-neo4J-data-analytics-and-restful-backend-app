const path = require("path");

const [driver, session] = require(path.join(
  __dirname,
  "..",
  "config",
  "neo4j.js"
)).getNeo4JCredentials;

module.exports.getShipmentTotalTransitTime = async (req, res, next) => {
  try {
    const shipmentId = +req.params.id;
    const query =
      "MATCH (s:Shipment {id: $shipmentId})<-[r:HAVING]-(jn:JourneyNode) MATCH (n_start)-[rel1:START]->(jn)-[rel2:END]->(n_end:Node) RETURN sum(jn.transit_time);";
    const result = await session.run(query, { shipmentId: shipmentId });
    session.close();
    if (!result) {
      const error = new Error("Result not found");
      error.httpStatusCode = 401;
      throw error;
    }
    res.status(200).json({
      success: true,
      shipment_id: shipmentId,
      value: +result.records[0]._fields[0].low
    });
    driver.close();
  } catch (error) {
    if (!error.httpStatusCode) error.httpStatusCode = 500;
    next(error);
  }
};
