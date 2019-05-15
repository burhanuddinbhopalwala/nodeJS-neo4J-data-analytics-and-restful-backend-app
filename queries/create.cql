// 1: DELETE EVERYTHING:
// MATCH (node)-[rel]->(any_node2) DELETE rel, node, any_node2;
// MATCH (node) DETACH DELETE node;

// 2: CREATING NODES:
// 2.1: CREATING HUB NODES
CREATE (n1:Node {name: "n1", id: 1, location_code: "lc1"})
CREATE (n2:Node {name: "n2", id: 2, location_code: "lc2"})
CREATE (n3:Node {name: "n3", id: 3, location_code: "lc3"})
CREATE (n4:Node {name: "n4", id: 4, location_code: "lc4"})
CREATE (n5:Node {name: "n5", id: 5, location_code: "lc5"})
CREATE (n7:Node {name: "n7", id: 7, location_code: "lc7"})

// 2.2: CREATING SHIPMENTS: 
CREATE (s1:Shipment {name: "s1", id: 1, start_node_id: 1, end_node_id: 5, material: "m1", quantity: 1})
CREATE (s2:Shipment {name: "s2", id: 2, start_node_id: 1, end_node_id: 7, material: "m2", quantity: 2})
CREATE (s3:Shipment {name: "s3", id: 3, start_node_id: 2, end_node_id: 5, material: "m3", quantity: 3})

// 2.3: CREATING JOURNIES: 
CREATE (j1:Journey {name: "j1", id: 1, start_node_id: 1, end_node_id: 5})
CREATE (j2:Journey {name: "j2", id: 2, start_node_id: 1, end_node_id: 5})
CREATE (j3:Journey {name: "j3", id: 3, start_node_id: 2, end_node_id: 7})

// 2.4: CREATING JOURNEY NODES:
CREATE (j11:JourneyNode {name: "j11", start_node_id: 1, end_node_id: 2, transit_time: 10, stoppage_time: 5, journey_id: 1, sequence_no: 1, vehicle_no: "v1", driver_name: "d1"})
CREATE (j12:JourneyNode {name: "j12", start_node_id: 2, end_node_id: 4, transit_time: 5, stoppage_time: 2, journey_id: 1, sequence_no: 2, vehicle_no: "v1", driver_name: "d1"})
CREATE (j13:JourneyNode {name: "j13", start_node_id: 4, end_node_id: 5, transit_time: 15, stoppage_time: 5, journey_id: 1, sequence_no:3, vehicle_no: "v1", driver_name: "d1"})

CREATE (j21:JourneyNode {name: "j21", start_node_id: 1, end_node_id: 3, transit_time: 15, stoppage_time: 5, journey_id: 2, sequence_no:1, vehicle_no: "v2", driver_name: "d2"})
CREATE (j22:JourneyNode {name: "j22", start_node_id: 3, end_node_id: 5, transit_time: 10, stoppage_time: 5, journey_id: 2, sequence_no:2, vehicle_no: "v2", driver_name: "d2"})

CREATE (j31:JourneyNode {name: "j31", start_node_id: 2, end_node_id: 7, transit_time: 8, stoppage_time: 4, journey_id: 3, sequence_no:1, vehicle_no: "v3", driver_name: "d3"})

// 2.5: CREATING JOURNEY_NODES RELATIONSHIPS:
CREATE 
  (n1)-[:START]->(j11),
  (j11)-[:END]->(n2)

CREATE 
  (n2)-[:START]->(j12),
  (j12)-[:END]->(n4)

CREATE 
  (n4)-[:START]->(j13),
  (j13)-[:END]->(n5)

CREATE 
  (n1)-[:START]->(j21),
  (j21)-[:END]->(n3)

CREATE 
  (n3)-[:START]->(j22),
  (j22)-[:END]->(n5)

CREATE 
  (n2)-[:START]->(j31),
  (j31)-[:END]->(n7)

// 2.6: CREATING SHIPMENT_JOURNIES RELATIONSHIPS:
CREATE
  (s1)<-[:HAVING]-(j21),
  (s1)<-[:HAVING]-(j22)

CREATE
  (s2)<-[:HAVING]-(j11),
  (s3)<-[:HAVING]-(j12),
  (s3)<-[:HAVING]-(j13)

CREATE
  (s2)<-[:HAVING]-(j31)

// 2.7: CREATING JOURNEY RELATIONS:
CREATE
  (j1)-[:FROM]->(j11),
  (j1)-[:TO]->(j13)

CREATE
  (j2)-[:FROM]->(j21),
  (j2)-[:TO]->(j22)

CREATE
  (j3)-[:FROM]->(j31),
  (j3)-[:TO]->(j31)
//////////////////////////////////////////////////

// 12: Finding a journey: 
MATCH (j:Journey {id: 1})-[:FROM]->(jn1:JourneyNode)
MATCH (j)-[:TO]->(jn2:JourneyNode)
MATCH path =(n_start:Node)-[:START]->(jn1)-[*]->(jn2)-[:END]->(n_end:Node)

WITH NODES(path) AS nodes
UNWIND nodes AS jns
WITH jns
WHERE "JourneyNode" IN LABELS(jns)

MATCH path2 = (jns)-[:HAVING]->()
MATCH path1 = ()-[:START]->(jns)-[:END]->()
RETURN path1, path2;

// 13: For a particular shipment, path: 
MATCH (s:Shipment {id: 1})<-[r:HAVING]-(jn:JourneyNode)
MATCH (n_start)-[rel1:START]->(jn)-[rel2:END]->(n_end:Node)
RETURN n_start, rel1, jn, rel2, n_end;

// Total transit time/ shipment 
MATCH (s:Shipment {id: 1})<-[r:HAVING]-(jn:JourneyNode)
MATCH (n_start)-[rel1:START]->(jn)-[rel2:END]->(n_end:Node)
RETURN SUM(jn.transit_time);

// 14: Top 2 performing routes with driver name and vehicle_number with least transit time:
MATCH (n1:Node)-[rel1:START]-(jn:JourneyNode)-[rel2: END]->(n2:Node)
WHERE n1 <> n2
RETURN n1, rel1, jn, rel2, n2 ORDER BY (jn.transit_time) ASC LIMIT 2;
//////////////////////////////////////////////////

// 3: UPDATING NODES/ RELATIOSHIPS:
MATCH (node:Node {id: 5})
SET node.name = "n2", node:Hub; // Setting new label

MATCH (node:Hub {id: 5})
REMOVE node.position, node:Hub; // Removing new label

// NOT VALID: As dynamic value not allowed inside SET
MATCH (p:Person)-[:HAS_CONTACT]->(c:Contact)
SET p.contacts = COUNT(c)
RETURN p;

// SOLN: Using WITH clause to break the query into 2 parts
MATCH (p:Person)-[:HAS_CONTACT]->(c:Contact)
WITH p, p.contacts = COUNT(c) AS total_contacts
WHERE total_contacts > 10
SET p.contacts = total_contacts, p:Social
RETURN p;

// UPDATING RELATION = DEL OLD RELATION + CREATE NEW RELATION
MATCH (p1:Person {id: 1})-[old_rel:OLD_CONTACT]->(p2:Person {id: 2})
SET old_rel.type = "feriends"
CREATE (p1:Person {id: 1})-[new_rel:HAS_CONTACT]->(p2:Person {id: 2})
SET new_rel = old_rel
DELETE old_rel
RETURN p1, p2;
//////////////////////////////////////////////////

