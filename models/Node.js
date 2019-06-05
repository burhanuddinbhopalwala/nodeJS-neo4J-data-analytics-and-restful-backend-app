"use strict";
module.exports = {
  labels: ["Node"],

  node_id: {
    primary: true,
    required: true
  },
  location_name: "string",
  address_line1: "string",
  address_line2: "string",
  pincode: "string",
  city: "string",
  state: "string",
  country: "string",
  location_code: {
    type: "string",
    required: true,
    indexed: true
  },
  location_type: "string",
  location_manager: "string",
  location_manager_contact: "string",
  primary_poi_id: "integer",
  primary_lat: "float",
  primary_long: "float",
  primary_radius: "float",
  city_lat: "float",
  city_long: "float",
  city_radius: "float",
  flow_id: "integer",

  has_many_journey_nodes: {
    type: "relationship",
    relationship: "START",
    direction: "out",
    target: "JourneyNode",
    eager: true,
    properties: {
      start_node_id: "integer",
      end_node_id: "integer",
      journey_id: "integer",
      leg_no: "integer"
    }
  }
};
