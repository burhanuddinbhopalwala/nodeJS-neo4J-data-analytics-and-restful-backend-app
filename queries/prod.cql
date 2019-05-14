// 3: ALL RELATIONSHIPS 
MATCH (a: Consigner {name: 'TUBES'})-[r1: FROM]->(b: Trip)-[r2: TO]->(c:Consignee)
RETURN a, r1, b, AVG(b.transit_time) AS avg_transit_hours, AVG(b.stoppage_time) AS avg_stoppage_hours, r2, c 
ORDER BY avg_transit_hours desc;

// 4: GROUP BY CONSIGNER_NAME AND CONSIGNEE_NAME
MATCH (a: Consigner {name: 'TUBES'})-[r1: FROM]->(b: Trip)-[r2: TO]->(c:Consignee)
RETURN a, AVG(b.transit_time) AS avg_transit_hours, AVG(b.stoppage_time) AS avg_stoppage_hours, c 
ORDER BY avg_transit_hours desc;

// 5: MULTI JOIN EXAMPLE DEMO
MATCH (a:ConsignerTrip {consignerCode: "APML", origin: "DDSK", destination: "KOTA"})-[rel1 :TRUCKS]->(b:Truck {isActive: "1"})-[rel2: TRUCKERS]->(c:Trucker) 
RETURN AVG(a.loadingOutTime - a.loadingInTime) AS avg_loading_time, AVG(a.unloadingOutTime - a.unloadingInTime) AS avg_unloading_time, 
AVG(c.unloadingInTime - c.loadingOutTime) AS avg_transit_time ORDER BY avg_transit_time DESC LIMIT 3;

MATCH (a:ConsignerTrip {consignerCode: "APML"})-[rel1 :TRUCKS]->(b:Truck {isActive: "1"})-[rel2: TRUCKERS]->
(c:Trucker {companyName: "APML Market Vehicle"}) return a, b, c;