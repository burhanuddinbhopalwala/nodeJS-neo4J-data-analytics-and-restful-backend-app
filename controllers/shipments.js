const path = require("path");

const { driver, session } = require(path.join(
  __dirname,
  "..",
  "config",
  "neo4j.js"
)).getNeo4JCredentials;

module.exports.getShipmentTotalTransitTime = (req, res, next) => {
  const shipmentId = parseInt(req.params.id);
  const query =
    "MATCH (s:Shipment {id: $shipmentId})<-[r:HAVING]-(jn:JourneyNode) MATCH (n_start)-[rel1:START]->(jn)-[rel2:END]->(n_end:Node) RETURN sum(jn.transit_time);";
  const resultPromise = session
    .run(query, {
      shipmentId: shipmentId
    })
    .then(result => {
      session.close();
      res.status(200).json({
        success: true,
        shipment_id: shipmentId,
        value: result.records[0]._fields[0].low.toString()
      });
      driver.close();
    })
    .catch(err => {
      const error = new Error(err);
      error.httpStatusCode = 500;
      return next(error);
    });
};
