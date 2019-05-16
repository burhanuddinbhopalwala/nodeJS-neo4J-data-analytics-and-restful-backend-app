// 1: DELETE EVERYTHING:
MATCH (node) DETACH DELETE node;
// MATCH (node)-[rel]->(any_node2) DELETE rel, node, any_node2;
//////////////////////////////////////////////////////////////////////

// 2: CREATING NODES:
// 2.1: CREATING HUB NODES:
// MERGE == CREATE IF NOT EXISTS:
MERGE (n1:Node {name: "n1", id: 1, location_code: "lc1"})
ON CREATE SET n1.createdAt = timestamp(), n1.location_update_count = 0
ON MATCH SET n1.updatedAt = timestamp(), n1.location_update_count = (n1.location_update_count + 1)

MERGE (n2:Node {name: "n2", id: 2, location_code: "lc2"})
MERGE (n3:Node {name: "n3", id: 3, location_code: "lc3"})
MERGE (n4:Node {name: "n4", id: 4, location_code: "lc4"})
MERGE (n5:Node {name: "n5", id: 5, location_code: "lc5"})
MERGE (n7:Node {name: "n7", id: 7, location_code: "lc7"})

// 2.2: CREATING SHIPMENTS: 
MERGE (s1:Shipment {name: "s1", id: 1, start_node_id: 1, end_node_id: 5, material: "m1", quantity: 1})
MERGE (s2:Shipment {name: "s2", id: 2, start_node_id: 1, end_node_id: 7, material: "m2", quantity: 2})
MERGE (s3:Shipment {name: "s3", id: 3, start_node_id: 2, end_node_id: 5, material: "m3", quantity: 3})

// 2.3: CREATING JOURNIES: 
MERGE (j1:Journey {name: "j1", id: 1, start_node_id: 1, end_node_id: 5})
MERGE (j2:Journey {name: "j2", id: 2, start_node_id: 1, end_node_id: 5})
MERGE (j3:Journey {name: "j3", id: 3, start_node_id: 2, end_node_id: 7})

// 2.4: CREATING JOURNEY NODES:
MERGE (j11:JourneyNode {name: "j11", start_node_id: 1, end_node_id: 2, transit_time: 10, stoppage_time: 5, journey_id: 1, sequence_no: 1, vehicle_no: "v1", driver_name: "d1"})
MERGE (j12:JourneyNode {name: "j12", start_node_id: 2, end_node_id: 4, transit_time: 5, stoppage_time: 2, journey_id: 1, sequence_no: 2, vehicle_no: "v1", driver_name: "d1"})
MERGE (j13:JourneyNode {name: "j13", start_node_id: 4, end_node_id: 5, transit_time: 15, stoppage_time: 5, journey_id: 1, sequence_no:3, vehicle_no: "v1", driver_name: "d1"})

MERGE (j21:JourneyNode {name: "j21", start_node_id: 1, end_node_id: 3, transit_time: 15, stoppage_time: 5, journey_id: 2, sequence_no:1, vehicle_no: "v2", driver_name: "d2"})
MERGE (j22:JourneyNode {name: "j22", start_node_id: 3, end_node_id: 5, transit_time: 10, stoppage_time: 5, journey_id: 2, sequence_no:2, vehicle_no: "v2", driver_name: "d2"})

MERGE (j31:JourneyNode {name: "j31", start_node_id: 2, end_node_id: 7, transit_time: 8, stoppage_time: 4, journey_id: 3, sequence_no:1, vehicle_no: "v3", driver_name: "d3"})

// 2.5: CREATING JOURNEY_NODES RELATIONSHIPS:
MERGE (n1)-[:START {start_node_id: 1, end_node_id: 2, journey_id: 1, leg_no: 1}]->(j11)
MERGE (j11)-[:END {start_node_id: 1, end_node_id: 2, journey_id: 1, leg_no: 1}]->(n2)

MERGE (n2)-[:START {start_node_id: 2, end_node_id: 4, journey_id: 1, leg_no: 2}]->(j12)
MERGE (j12)-[:END {start_node_id: 2, end_node_id: 4, journey_id: 1, leg_no: 2}]->(n4)

MERGE (n4)-[:START {start_node_id: 4, end_node_id: 5, journey_id: 1, leg_no: 3}]->(j13)
MERGE (j13)-[:END {start_node_id: 4, end_node_id: 5, journey_id: 1, leg_no: 3}]->(n5)

MERGE (n1)-[:START {start_node_id: 1, end_node_id: 3, journey_id: 2, leg_no: 1}]->(j21)
MERGE (j21)-[:END {start_node_id: 1, end_node_id: 3, journey_id: 2, leg_no: 1}]->(n3)

MERGE (n3)-[:START {start_node_id: 3, end_node_id: 5, journey_id: 2, leg_no: 2}]->(j22)
MERGE (j22)-[:END {start_node_id: 3, end_node_id: 5, journey_id: 2, leg_no: 2}]->(n5)

MERGE (n2)-[:START {start_node_id: 2, end_node_id: 7, journey_id: 3, leg_no: 1}]->(j31)
MERGE (j31)-[:END {start_node_id: 2, end_node_id: 7, journey_id: 3, leg_no: 1}]->(n7)

// 2.6: CREATING SHIPMENT_JOURNIES RELATIONSHIPS:
MERGE (j21)-[:HAVING {start_node_id: 1, end_node_id: 3, shipment_id: 1}]->(s1)
MERGE (j22)-[:HAVING {start_node_id: 3, end_node_id: 5, shipment_id: 1}]->(s1)

MERGE (j11)-[:HAVING {start_node_id: 1, end_node_id: 2, shipment_id: 2}]->(s2)
MERGE (j12)-[:HAVING {start_node_id: 2, end_node_id: 4, shipment_id: 2}]->(s3)
MERGE (j13)-[:HAVING {start_node_id: 4, end_node_id: 5, shipment_id: 2}]->(s3)

MERGE (j31)-[:HAVING {start_node_id: 2, end_node_id: 7, shipment_id: 2}]->(s2)

// 2.7: CREATING JOURNEY RELATIONS:
MERGE (j1)-[:FROM {start_node_id: 1, end_node_id: 2, seq_no: 1}]->(j11)
MERGE (j1)-[:TO {start_node_id: 4, end_node_id: 5, seq_no: 3}]->(j13)

MERGE (j2)-[:FROM {start_node_id: 1, end_node_id: 3, seq_no: 1}]->(j21)
MERGE (j2)-[:TO {start_node_id: 3, end_node_id: 5, seq_no: 2}]->(j22)

MERGE (j3)-[:FROM {start_node_id: 2, end_node_id: 7, seq_no: 1}]->(j31)
MERGE (j3)-[:TO {start_node_id: 2, end_node_id: 7, seq_no: 1}]->(j31);
//////////////////////////////////////////////////////////////////////

// 3: UPDATING NODES/ RELATIOSHIPS:
MATCH (node:Node {id: 5})
SET node.name = "n2", node:Hub; // Setting new label

MATCH (node:Hub {id: 5})
REMOVE node.position, node:Hub; // Removing new label

// NOT VALID: AS DYNAMIC VALUE NOT ALLOWED INSIDE SET:
MATCH (p:Person)-[:HAS_CONTACT]->(c:Contact)
SET p.contacts = COUNT(c)
RETURN p;

// SOLN: USING WITH CLAUSE TO BREAK THE QUERY INTO 2 PARTS:
MATCH (p:Person)-[:HAS_CONTACT]->(c:Contact)
WITH p, p.contacts = COUNT(c) AS total_contacts
WHERE total_contacts > 10
SET p.contacts = total_contacts, p:Social
RETURN p;

// UPDATING RELATION = DEL OLD RELATION + MERGE NEW RELATION:
MATCH (p1:Person {id: 1})-[old_rel:OLD_CONTACT]->(p2:Person {id: 2})
SET old_rel.type = "feriends"
MERGE (p1:Person {id: 1})-[new_rel:HAS_CONTACT]->(p2:Person {id: 2})
SET new_rel = old_rel
DELETE old_rel
RETURN p1, p2;
/////////////////////////////////////////////////////////////////

// 4: WORKING WITH NULLS: 
WITH ["FIRST", "SECOND", "THIRD"] AS my_list
RETURN my_list[1], my_list[3]; // SECOND null

WITH  (NULL OR true) AS result1, (NULL OR false) AS result2
RETURN result1, result2; //true null

WITH  (NULL AND true) AS result1, (NULL AND false) AS result2
RETURN result1, result2; //null false

WITH (1 IN [1, NULL]) AS result1, (NULL IN [1, NULL]) AS result2, (NULL + [1]) AS result3, 
    ([NULL] + [1, NULL]) as result4
RETURN result1, result2, result3, result4 // true null null [null, 1, null]
// Add as list for result4, if value may be null, else lead to result 3

// COMPARISON WITH NULL, SAME SQL PROBLEM:
WITH (NULL = NULL) AS result1, (NULL <> NULL) AS result2
RETURN result1, result2; // null null

// SOLN, SAME SOLUTION AS IN SQL:
WITH (NULL IS NULL) AS result1, (NULL IS NOT NULL) AS result2
RETURN result1, result2;

// FOR CUTS OUT THE NULL, FROM LIST:
WITH ([NULL, 1] + [2, NULL]) as results
RETURN [result IN results WHERE result IS NOT NULL | result];
/////////////////////////////////////////////////////////////////

// 5: WORKING WITH PATH (SERIES OF CONNECTED (VIA NTH DEGREE RELATIONSHIPS) NODES):
// NOTE: MERGE - WITH -> MATCH
MERGE (p1:Person {name: "A"})-[:HAS_CONTACT {via: "XYZ"}]->(p2:Person {name: "B"})
WITH p1, p2
MATCH path = ((p1:Person)-[:HAS_CONTACT*1..10]->(p2:Person)) // min..max
WHERE p1 <> p2 // Infinite loop, check 1
RETURN p1, path, nodes(path) AS path_nodes, relationships(path) AS path_rels, length(path) AS path_length, p2
LIMIT 25; // Infinite loop, check 2

// SHORTEST_PATH AND ALL_SHORTEST_PATHS: 
MERGE (p1:Person {name: "A"})-[:HAS_CONTACT {via: "XYZ"}]->(p2:Person {name: "B"})
WITH p1, p2
MATCH path = shortestPath((p1)-[:HAS_CONTACT*1..10]->(p2)) // ..max, needed for SP's
WHERE p1 <> p2
RETURN p1, path, length(path) AS path_length, p2;

MERGE (p1:Person {name: "A"})-[:HAS_CONTACT {via: "XYZ"}]->(p2:Person {name: "B"})
WITH p1, p2
MATCH path = allShortestPaths((p1)-[:HAS_CONTACT*1..10]->(p2)) // ..max, needed for SP's
WHERE p1 <> p2
RETURN p1, path, length(path) AS path_length, p2
ORDER BY path_length
LIMIT 5;
/////////////////////////////////////////////////////////////////

