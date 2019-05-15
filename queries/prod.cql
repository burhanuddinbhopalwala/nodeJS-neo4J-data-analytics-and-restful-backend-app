
/////////////////////////////////////////////////////////////////////

// 1: FINDING A JOURNEY: 
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

// 2: FOR A PARTICULAR SHIPMENT PATH, TOTAL TRANSIT TIME ACROSS MULTIPLE JOURNIES: 
MATCH (s:Shipment {id: 1})<-[r:HAVING]-(jn:JourneyNode)
MATCH (n_start)-[rel1:START]->(jn)-[rel2:END]->(n_end:Node)
RETURN n_start, rel1, jn, rel2, n_end;

// TOTAL TRANSIT TIME/ SHIPMENT:
MATCH (s:Shipment {id: 1})<-[r:HAVING]-(jn:JourneyNode)
MATCH (n_start)-[rel1:START]->(jn)-[rel2:END]->(n_end:Node)
RETURN SUM(jn.transit_time);

// 3: TOP 2 PERFORMING ROUTES WITH DRIVER NAME AND VEHICLE_NUMBER WITH LEAST TRANSIT TIME:
MATCH (n1:Node)-[rel1:START]-(jn:JourneyNode)-[rel2: END]->(n2:Node)
WHERE n1 <> n2
RETURN n1, rel1, jn, rel2, n2 ORDER BY (jn.transit_time) ASC LIMIT 2;
////////////////////////////////////////////////////////////////////////