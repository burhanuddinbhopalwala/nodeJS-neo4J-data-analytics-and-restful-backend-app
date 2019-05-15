module.exports = {
  labels: ["Shipment"],

  shipment_id: {
    primary: true,
    required: true
  },
  slug: "string",
  shipment_no: {
    type: "string",
    required: true,
    indexed: true
  },
  status: "string",
  in_state: "string",
  exp_start_time: "datetime",
  exp_end_time: "datetime",
  act_start_time: "datetime",
  act_end_time: "datetime",
  start_node_id: "integer",
  end_node_id: "integer",
  consigner_name: "string",
  consignee_name: "string",
  data_string: "string",
  meta_data: "string",
  active_status: "integer",
  deleted_at: "datetime",
  material: "string",
  quantity: "integer",
  flow_id: "integer",

  belongs_to_jns: {
    type: "relationship",
    relationship: "HAVING",
    direction: "in",
    target: "JourneyNode",
    eager: true,
    properties: {
      start_node_id: "integer",
      end_node_id: "integer",
      shipment_id: "integer"
    }
  }
};
