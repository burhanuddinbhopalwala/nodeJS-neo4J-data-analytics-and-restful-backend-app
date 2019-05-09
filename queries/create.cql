// MATCH (node) DETACH DELETE node;

// 1: Creating everything
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
