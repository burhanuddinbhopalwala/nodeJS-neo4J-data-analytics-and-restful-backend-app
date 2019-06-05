"use strict";
const path = require("path");

const { driver, session } = require(path.join(
  __dirname,
  "..",
  "config",
  "config.js"
)).neo4j();

class JourniesController {
  static async getJourneyById(req, res, next) {
    try {
      const journeyId = +req.params.id;
      const query =
        "MATCH (j:Journey {id: $journeyId})-[:FROM]->(jn1:JourneyNode) MATCH (j)-[:TO]->(jn2:JourneyNode) MATCH path =(n_start:Node)-[:START]->(jn1)-[*]->(jn2)-[:END]->(n_end:Node) WITH NODES(path) AS nodes UNWIND nodes AS jns WITH jns WHERE 'JourneyNode' IN LABELS(jns) MATCH path2 = (jns)-[:HAVING]->() MATCH path1 = ()-[:START]->(jns)-[:END]->() RETURN path1, path2;";
      const result = await session.run(query, { journeyId: journeyId });
      session.close();
      if (!result || result.records.length === 0) {
        const error = new Error("Journey not found!");
        error.httpStatusCode = 404;
        throw error;
      }
      res.status(200).json({
        message: `Fetched successfully journey for journey id: ${journeyId}!`,
        result: result
      });
      driver.close();
      return;
    } catch (error) {
      if (!error.httpStatusCode) error.httpStatusCode = 500;
      next(error);
    }
  }
}

module.exports = JourniesController;
