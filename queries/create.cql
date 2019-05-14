// 1: DELETE EVERYTHING
// MATCH (node) DETACH DELETE node;

// 2: CREATE EVERYTHING
CREATE (TUBES:Consigner {name: "TUBES", email:"h1@gmail.com", state:"active"})

CREATE (TATA_STEEL_LTD:Consignee {name: "TATA_STEEL_LTD", email:"h6@gmail.com", state:"active"})
CREATE (ALLIED_HITECH_INDUSTRIES_PVT_LTD:Consignee {name: "ALLIED_HITECH_INDUSTRIES_PVT_LTD", email: "h7@gmail.com", state: "active"})
CREATE (G_K_ISPAT_PVT_LTD:Consignee {name: "G_K_ISPAT_PVT_LTD", email: "h8@gmail.com", state: "active"})

CREATE (CTGBT600:Trip {name: "CTGBT600", transit_time: 1, stoppage_time: 4, trip_slug: "CTGBT600", is_active: 1, origin: "Jamshedpur", destination: "PUNE"})
CREATE (CTGBT601:Trip {name: "CTGBT601", transit_time: 3, stoppage_time: 40, trip_slug: "CTGBT601", is_active: 1, origin: "Jamshedpur", destination: "PUNE"})
CREATE (CTGBT602:Trip {name: "CTGBT602", transit_time: 44, stoppage_time: 23, trip_slug: "CTGBT602", is_active: 1, origin: "Jamshedpur", destination: "PUNE"})
CREATE (CTGBT603:Trip {name: "CTGBT603", transit_time: 3, stoppage_time: 33, trip_slug: "CTGBT603", is_active: 1, origin: "Jamshedpur", destination: "PUNE"})
CREATE (CTGBT604:Trip {name: "CTGBT604", transit_time: 2, stoppage_time: 4, trip_slug: "CTGBT604", is_active: 1, origin: "Jamshedpur", destination: "PUNE"})

CREATE (CTGBT605:Trip {name: "CTGBT605", transit_time: 66, stoppage_time: 55, trip_slug: "CTGBT605", is_active: 1, origin: "Jamshedpur", destination: "PATNA"})
CREATE (CTGBT606:Trip {name: "CTGBT606", transit_time: 76, stoppage_time: 12.5, trip_slug: "CTGBT606", is_active: 1, origin: "Jamshedpur", destination: "PATNA"})
CREATE (CTGBT607:Trip {name: "CTGBT607", transit_time: 21, stoppage_time: 33, trip_slug: "CTGBT607", is_active: 1, origin: "Jamshedpur", destination: "PATNA"})
CREATE (CTGBT608:Trip {name: "CTGBT608", transit_time: 66, stoppage_time: 5, trip_slug: "CTGBT608", is_active: 1, origin: "Jamshedpur", destination: "PATNA"})
CREATE (CTGBT609:Trip {name: "CTGBT609", transit_time: 2, stoppage_time: 55, trip_slug: "CTGBT609", is_active: 1, origin: "Jamshedpur", destination: "PATNA"})

CREATE (CTGBT610:Trip {name: "CTGBT610", transit_time: 5, stoppage_time: 3.3, trip_slug: "CTGBT610", is_active: 1, origin: "Jamshedpur", destination: "KOTA"})
CREATE (CTGBT611:Trip {name: "CTGBT611", transit_time: 7, stoppage_time: 4.4, trip_slug: "CTGBT611", is_active: 1, origin: "Jamshedpur", destination: "KOTA"})
CREATE (CTGBT612:Trip {name: "CTGBT612", transit_time: 5, stoppage_time: 4.4, trip_slug: "CTGBT612", is_active: 1, origin: "Jamshedpur", destination: "KOTA"})
CREATE (CTGBT613:Trip {name: "CTGBT613", transit_time: 6, stoppage_time: 5.4, trip_slug: "CTGBT613", is_active: 1, origin: "Jamshedpur", destination: "KOTA"})
CREATE (CTGBT614:Trip {name: "CTGBT614", transit_time: 21, stoppage_time: 10, trip_slug: "CTGBT614", is_active: 1, origin: "Jamshedpur", destination: "KOTA"})
CREATE (CTGBT615:Trip {name: "CTGBT615", transit_time: 22, stoppage_time: 3, trip_slug: "CTGBT615", is_active: 1, origin: "Jamshedpur", destination: "KOTA"})

CREATE
  (TUBES)-[:FROM {date: "2019-05-01"}]->(CTGBT600)-[:TO {date: "2019-05-03"}]->(ALLIED_HITECH_INDUSTRIES_PVT_LTD),
  (TUBES)-[:FROM {date: "2019-05-01"}]->(CTGBT601)-[:TO {date: "2019-05-03"}]->(ALLIED_HITECH_INDUSTRIES_PVT_LTD),
  (TUBES)-[:FROM {date: "2019-05-01"}]->(CTGBT602)-[:TO {date: "2019-05-03"}]->(ALLIED_HITECH_INDUSTRIES_PVT_LTD),
  (TUBES)-[:FROM {date: "2019-05-01"}]->(CTGBT603)-[:TO {date: "2019-05-03"}]->(ALLIED_HITECH_INDUSTRIES_PVT_LTD),
  (TUBES)-[:FROM {date: "2019-05-01"}]->(CTGBT604)-[:TO {date: "2019-05-03"}]->(ALLIED_HITECH_INDUSTRIES_PVT_LTD)

CREATE
  (TUBES)-[:FROM {date: "2019-05-01"}]->(CTGBT605)-[:TO {date: "2019-05-03"}]->(TATA_STEEL_LTD),
  (TUBES)-[:FROM {date: "2019-05-01"}]->(CTGBT606)-[:TO {date: "2019-05-03"}]->(TATA_STEEL_LTD),
  (TUBES)-[:FROM {date: "2019-05-01"}]->(CTGBT607)-[:TO {date: "2019-05-03"}]->(TATA_STEEL_LTD),
  (TUBES)-[:FROM {date: "2019-05-01"}]->(CTGBT608)-[:TO {date: "2019-05-03"}]->(TATA_STEEL_LTD),
  (TUBES)-[:FROM {date: "2019-05-01"}]->(CTGBT609)-[:TO {date: "2019-05-03"}]->(TATA_STEEL_LTD)

CREATE
  (TUBES)-[:FROM {date: "2019-05-01"}]->(CTGBT610)-[:TO {date: "2019-05-03"}]->(G_K_ISPAT_PVT_LTD),
  (TUBES)-[:FROM {date: "2019-05-01"}]->(CTGBT611)-[:TO {date: "2019-05-03"}]->(G_K_ISPAT_PVT_LTD),
  (TUBES)-[:FROM {date: "2019-05-01"}]->(CTGBT612)-[:TO {date: "2019-05-03"}]->(G_K_ISPAT_PVT_LTD),
  (TUBES)-[:FROM {date: "2019-05-01"}]->(CTGBT613)-[:TO {date: "2019-05-03"}]->(G_K_ISPAT_PVT_LTD),
  (TUBES)-[:FROM {date: "2019-05-01"}]->(CTGBT614)-[:TO {date: "2019-05-03"}]->(G_K_ISPAT_PVT_LTD)

// 1: Creating everything
// MERGE (:Consigner {name: "TUBES" email:"h1@gmail.com" state:"active"})-[:FROM {date: "2019-05-01"}]->(:Trip {name: "CTGBT601" transit_time: 3 stoppage_time: 40 slug: "CTGBT601" is_active: 1 origin: "Jamshedpur" destination: "PUNE"})-[:TO {date: "2019-05-03"}]->(:Consignee {name: "ALLIED_HITECH_INDUSTRIES_PVT_LTD" email: "h7@gmail.com" state: "active"})
// MERGE (:Consigner {name: "TUBES" email:"h1@gmail.com" state:"active"})-[:FROM {date: "2019-05-01"}]->(:Trip {name: "CTGBT602" transit_time: 44 stoppage_time: 23 slug: "CTGBT602" is_active: 1 origin: "Jamshedpur" destination: "PUNE"})-[:TO {date: "2019-05-03"}]->(:Consignee {name: "ALLIED_HITECH_INDUSTRIES_PVT_LTD" email: "h7@gmail.com" state: "active"})
// MERGE (:Consigner {name: "TUBES" email:"h1@gmail.com" state:"active"})-[:FROM {date: "2019-05-01"}]->(:Trip {name: "CTGBT603" transit_time: 3 stoppage_time: 33 slug: "CTGBT603" is_active: 1 origin: "Jamshedpur" destination: "PUNE"})-[:TO {date: "2019-05-03"}]->(:Consignee {name: "ALLIED_HITECH_INDUSTRIES_PVT_LTD" email: "h7@gmail.com" state: "active"})
// MERGE (:Consigner {name: "TUBES" email:"h1@gmail.com" state:"active"})-[:FROM {date: "2019-05-01"}]->(:Trip {name: "CTGBT604" transit_time: 2 stoppage_time: 4 slug: "CTGBT604" is_active: 1 origin: "Jamshedpur" destination: "PUNE"})-[:TO {date: "2019-05-03"}]->(:Consignee {name: "ALLIED_HITECH_INDUSTRIES_PVT_LTD" email: "h7@gmail.com" state: "active"})
// MERGE (:Consigner {name: "TUBES" email:"h1@gmail.com" state:"active"})-[:FROM {date: "2019-05-01"}]->(:Trip {name: "CTGBT615" transit_time: 22 stoppage_time: 3 slug: "CTGBT615" is_active: 1 origin: "Jamshedpur" destination: "PUNE"})-[:TO {date: "2019-05-03"}]->(:Consignee {name: "ALLIED_HITECH_INDUSTRIES_PVT_LTD" email: "h7@gmail.com" state: "active"})

// MERGE (:Consigner {name: "TUBES" email:"h1@gmail.com" state:"active"})-[:FROM {date: "2019-05-01"}]->(:Trip {name: "CTGBT605" transit_time: 66 stoppage_time: 55 slug: "CTGBT605" is_active: 1 origin: "Jamshedpur" destination: "PATNA"})-[:TO {date: "2019-05-03"}]->(:Consignee {name: "TATA_STEEL_LTD" email:"h6@gmail.com" state:"active"})
// MERGE (:Consigner {name: "TUBES" email:"h1@gmail.com" state:"active"})-[:FROM {date: "2019-05-01"}]->(:Trip {name: "CTGBT606" transit_time: 76 stoppage_time: 12.5 slug: "CTGBT606" is_active: 1 origin: "Jamshedpur" destination: "PATNA"})-[:TO {date: "2019-05-03"}]->(:Consignee {name: "TATA_STEEL_LTD" email:"h6@gmail.com" state:"active"})
// MERGE (:Consigner {name: "TUBES" email:"h1@gmail.com" state:"active"})-[:FROM {date: "2019-05-01"}]->(:Trip {name: "CTGBT607" transit_time: 21 stoppage_time: 33 slug: "CTGBT607" is_active: 1 origin: "Jamshedpur" destination: "PATNA"})-[:TO {date: "2019-05-03"}]->(:Consignee {name: "TATA_STEEL_LTD" email:"h6@gmail.com" state:"active"})
// MERGE (:Consigner {name: "TUBES" email:"h1@gmail.com" state:"active"})-[:FROM {date: "2019-05-01"}]->(:Trip {name: "CTGBT608" transit_time: 66 stoppage_time: 5 slug: "CTGBT608" is_active: 1 origin: "Jamshedpur" destination: "PATNA"})-[:TO {date: "2019-05-03"}]->(:Consignee {name: "TATA_STEEL_LTD" email:"h6@gmail.com" state:"active"})
// MERGE (:Consigner {name: "TUBES" email:"h1@gmail.com" state:"active"})-[:FROM {date: "2019-05-01"}]->(:Trip {name: "CTGBT609" transit_time: 2 stoppage_time: 55 slug: "CTGBT609" is_active: 1 origin: "Jamshedpur" destination: "PATNA"})-[:TO {date: "2019-05-03"}]->(:Consignee {name: "TATA_STEEL_LTD" email:"h6@gmail.com" state:"active"})

// MERGE (:Consigner {name: "TUBES" email:"h1@gmail.com" state:"active"})-[:FROM {date: "2019-05-01"}]->(:Trip {name: "CTGBT610" transit_time: 5 stoppage_time: 3.3 slug: "CTGBT610" is_active: 1 origin: "Jamshedpur" destination: "KOTA"})-[:TO {date: "2019-05-03"}]->(:Consignee {name: "G_K_ISPAT_PVT_LTD" email: "h8@gmail.com" state: "active"})
// MERGE (:Consigner {name: "TUBES" email:"h1@gmail.com" state:"active"})-[:FROM {date: "2019-05-01"}]->(:Trip {name: "CTGBT611" transit_time: 7 stoppage_time: 4.4 slug: "CTGBT611" is_active: 1 origin: "Jamshedpur" destination: "KOTA"})-[:TO {date: "2019-05-03"}]->(:Consignee {name: "G_K_ISPAT_PVT_LTD" email: "h8@gmail.com" state: "active"})
// MERGE (:Consigner {name: "TUBES" email:"h1@gmail.com" state:"active"})-[:FROM {date: "2019-05-01"}]->(:Trip {name: "CTGBT612" transit_time: 5 stoppage_time: 4.4 slug: "CTGBT612" is_active: 1 origin: "Jamshedpur" destination: "KOTA"})-[:TO {date: "2019-05-03"}]->(:Consignee {name: "G_K_ISPAT_PVT_LTD" email: "h8@gmail.com" state: "active"})
// MERGE (:Consigner {name: "TUBES" email:"h1@gmail.com" state:"active"})-[:FROM {date: "2019-05-01"}]->(:Trip {name: "CTGBT613" transit_time: 6 stoppage_time: 5.4 slug: "CTGBT613" is_active: 1 origin: "Jamshedpur" destination: "KOTA"})-[:TO {date: "2019-05-03"}]->(:Consignee {name: "G_K_ISPAT_PVT_LTD" email: "h8@gmail.com" state: "active"})
// MERGE (:Consigner {name: "TUBES" email:"h1@gmail.com" state:"active"})-[:FROM {date: "2019-05-01"}]->(:Trip {name: "CTGBT614" transit_time: 21 stoppage_time: 10 slug: "CTGBT614" is_active: 1 origin: "Jamshedpur" destination: "KOTA"})-[:TO {date: "2019-05-03"}]->(:Consignee {name: "G_K_ISPAT_PVT_LTD" email: "h8@gmail.com" state: "active"})



// 1: DELETE EVERYTHING
// MATCH (node) DETACH DELETE node;

// Shipment Case: 
// 5: Creating nodes:
CREATE (n1:Node {name: "n1", id: 1, location_code: "lc1"})
CREATE (n2:Node {name: "n2", id: 2, location_code: "lc2"})
CREATE (n3:Node {name: "n3", id: 3, location_code: "lc3"})
CREATE (n4:Node {name: "n4", id: 4, location_code: "lc4"})
CREATE (n5:Node {name: "n5", id: 5, location_code: "lc5"})
CREATE (n7:Node {name: "n7", id: 7, location_code: "lc7"})

// 6: Creating shipments: 
CREATE (s1:Shipment {name: "s1", id: 1, start_node_id: 1, end_node_id: 5, material: "m1", quantity: 1})
CREATE (s2:Shipment {name: "s2", id: 2, start_node_id: 1, end_node_id: 7, material: "m2", quantity: 2})
CREATE (s3:Shipment {name: "s3", id: 3, start_node_id: 2, end_node_id: 5, material: "m3", quantity: 3})

// 7: Creating journey: 
CREATE (j1:Journey {name: "j1", id: 1, start_node_id: 1, end_node_id: 5})
CREATE (j2:Journey {name: "j2", id: 2, start_node_id: 1, end_node_id: 5})
CREATE (j3:Journey {name: "j3", id: 3, start_node_id: 2, end_node_id: 7})

// 8: Creating journey nodes:
CREATE (j11:JourneyNode {name: "j11", start_node_id: 1, end_node_id: 2, transit_time: 10, stoppage_time: 5, journey_id: 1, sequence_no: 1, vehicle_no: "v1", driver_name: "d1"})
CREATE (j12:JourneyNode {name: "j12", start_node_id: 2, end_node_id: 4, transit_time: 5, stoppage_time: 2, journey_id: 1, sequence_no: 2, vehicle_no: "v1", driver_name: "d1"})
CREATE (j13:JourneyNode {name: "j13", start_node_id: 4, end_node_id: 5, transit_time: 15, stoppage_time: 5, journey_id: 1, sequence_no:3, vehicle_no: "v1", driver_name: "d1"})

CREATE (j21:JourneyNode {name: "j21", start_node_id: 1, end_node_id: 3, transit_time: 15, stoppage_time: 5, journey_id: 2, sequence_no:1, vehicle_no: "v2", driver_name: "d2"})
CREATE (j22:JourneyNode {name: "j22", start_node_id: 3, end_node_id: 5, transit_time: 10, stoppage_time: 5, journey_id: 2, sequence_no:2, vehicle_no: "v2", driver_name: "d2"})

CREATE (j31:JourneyNode {name: "j31", start_node_id: 2, end_node_id: 7, transit_time: 8, stoppage_time: 4, journey_id: 3, sequence_no:1, vehicle_no: "v3", driver_name: "d3"})

// 9: Creating journey nodes relationships:
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

// 10: Creating shipment journeys:
CREATE
  (s1)<-[:HAVING]-(j21),
  (s1)<-[:HAVING]-(j22)

CREATE
  (s2)<-[:HAVING]-(j11),
  (s3)<-[:HAVING]-(j12),
  (s3)<-[:HAVING]-(j13)

CREATE
  (s2)<-[:HAVING]-(j31)

// 11: Creating Journey relations:
CREATE
  (j1)-[:FROM]->(j11),
  (j1)-[:TO]->(j13)

CREATE
  (j2)-[:FROM]->(j21),
  (j2)-[:TO]->(j22)

CREATE
  (j3)-[:FROM]->(j31),
  (j3)-[:TO]->(j31)

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
RETURN n_start, rel1, jn, rel2, n_end;

// 14: Top 2 performing routes with driver name and vehicle_number with least transit time:
MATCH (n1:Node)-[rel1:START]-(jn:JourneyNode)-[rel2: END]->(n2:Node)
WHERE n1 <> n2
RETURN n1, rel1, jn, rel2, n2 ORDER BY (jn.transit_time) ASC LIMIT 2;