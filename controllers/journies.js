const path = require("path");

const { driver, session } = require(path.join(
  __dirname,
  "..",
  "config",
  "neo4j.js"
)).getNeo4JCredentials;

module.exports.getJourneyById = (req, res, next) => {
  const journeyId = parseInt(req.params.id);
  const query =
    "MATCH (j:Journey {id: $journeyId})-[:FROM]->(jn1:JourneyNode) MATCH (j)-[:TO]->(jn2:JourneyNode) MATCH path =(n_start:Node)-[:START]->(jn1)-[*]->(jn2)-[:END]->(n_end:Node) WITH NODES(path) AS nodes UNWIND nodes AS jns WITH jns WHERE 'JourneyNode' IN LABELS(jns) MATCH path2 = (jns)-[:HAVING]->() MATCH path1 = ()-[:START]->(jns)-[:END]->() RETURN path1, path2;";

  const resultPromise = session
    .run(query, {
      journeyId: journeyId
    })
    .then(result => {
      session.close();
      res.status(200).json(result);
      driver.close();
    })
    .catch(err => {
      const error = new Error(err);
      error.httpStatusCode = 500;
      return next(error);
    });
};
