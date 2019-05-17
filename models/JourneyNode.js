module.exports = {
  labels: ["JourneyNode"],

  journey_id: {
    type: "integer",
    required: true,
    indexed: true
  },
  primary_node_id: {
    type: "integer",
    required: true,
    indexed: true
  },
  sequence: {
    type: "integer",
    required: true
  },
  loading_in_time: "datetime",
  loading_out_time: "datetime",
  unloading_in_time: "datetime",
  unloading_out_time: "datetime",
  loading_in_time_gps: "datetime",
  loading_out_time_gps: "datetime",
  unloading_in_time_gps: "datetime",
  unloading_out_time_gps: "datetime",
  eta: "datetime",
  exp_dwell_time: "number",
  act_dwell_time: "number",
  sta: "datetime",
  expected_departure_time: "datetime",
  closure_time: "datetime",
  closure_reason: "string",
  closed_by: "string",
  active_status: "integer",
  deleted_at: "datetime",

  has_one_node: {
    type: "relationship",
    relationship: "END",
    direction: "out",
    target: "Node",
    eager: true,
    properties: {
      start_node_id: "integer",
      end_node_id: "integer",
      journey_id: "integer",
      leg_no: "integer"
    }
  },
  has_many_shipments: {
    type: "relationship",
    relationship: "HAVING",
    direction: "out",
    target: "Shipment",
    eager: true,
    properties: {
      start_node_id: "integer",
      end_node_id: "integer",
      shipment_id: "integer"
    }
  }
};
