"use strict";
const path = require("path");

const { driver, session } = require(path.join(
  __dirname,
  "..",
  "config",
  "config.js"
)).neo4j();

class JourneyNodesController {}

module.exports = JourneyNodesController;
