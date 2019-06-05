"use strict";
module.exports = {
  labels: ["Journey"],

  journey_id: {
    primary: true,
    required: true
  },
  slug: {
    type: "string",
    required: true,
    indexed: true
  },
  vehicle_no: {
    type: "string",
    required: true,
    indexed: true
  },
  transport_mode: "integer",
  transporter_name: "string",
  lr_no: {
    type: "string",
    required: true,
    indexed: true
  },
  sub_lr_no: {
    type: "string",
    required: true,
    indexed: true
  },
  invoice_no: {
    type: "string",
    required: true,
    indexed: true
  },
  status: "integer",
  in_state: "integer",
  exp_start_time: "datetime",
  exp_end_time: "datetime",
  act_start_time: "datetime",
  act_end_time: "datetime",
  eta: "datetime",
  start_node_id: "integer",
  end_node_id: "integer",
  consigner_name: "string",
  consignee_name: "string",
  driver_name: "string",
  driver_no: "string",
  data_string: "string",
  meta_data: "string",
  deleted_at: "datetime",
  active_status: {
    type: "integer",
    indexed: true
  },
  flow_id: "integer",

  has_one_journey_node: {
    type: "relationship",
    relationship: "FROM",
    direction: "out",
    target: "JourneyNode",
    eager: true,
    properties: {
      start_node_id: "integer",
      end_node_id: "integer",
      sequence_no: "integer"
    }
  },
  has_one_journey_node: {
    type: "relationship",
    relationship: "TO",
    direction: "out",
    target: "JourneyNode",
    eager: true,
    properties: {
      start_node_id: "integer",
      end_node_id: "integer",
      sequence_no: "integer"
    }
  }
};
