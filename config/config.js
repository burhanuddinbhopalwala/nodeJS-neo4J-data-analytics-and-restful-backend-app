"use strict";
const neo4j = require("neo4j-driver").v1;

class Config {
  static neo4j() {
    const driver = neo4j.driver(
      process.env.NEO4J_URI,
      neo4j.auth.basic(process.env.NEO4J_USERNAME, process.env.NEO4J_PASSWORD)
    );
    const session = driver.session();
    return { driver, session };
  }
}

module.exports = Config;
