// 0: 
:help cypher

// RETURNING NEO4J SERVER CREDENTIALS:
:server switch success;

// RETURN ENTIRE GRAPH W/O LIMIT:
MATCH (anything)
RETURN anything
LIMIT 25;

////////////////////DML////////////////////////
// 1: INTRODUCTION: 

  // OPERATORS: 
  Comparison operator: =, >=, <=, >, <, <>
  Boolean operator: AND, OR, NOT, IN

  // BASIC QUERY:
  MATCH (crew_member: Crew {name: "Tom", born: 1956}) 
  RETURN crew_member 
  LIMIT 10;

  MATCH (a: Person)-[rel1: HAS_CONTACT]->(b: Person)-[rel2: HAS_CONTACT]->(c: Person)
  WHERE a <> c
  RETURN a.name, b.name , c.name 
  LIMIT 10;

// 2: MATCH(||) + OPTIONAL MATCH (IF FOUND ELSE NULL) + FILTERING: 
  MATCH (creation: Person)-[rel:CODED_BY | REVIEWED_BY]->(coder: Person) 
  WHERE creation.name >= 'T' // Name after 'T'
  RETURN creation, rel, coder
  LIMIT 10;

  MATCH (director: Person)-[rel1: DIRECTED]->(movie: Movie)
  OPTIONAL MATCH (movie: Movie)<-[rel2: ACTED]-[director: Person]
  WHERE NOT (director.born IN [1956, 1957, 1958]) AND director.gender = "male"
  RETURN DISTINCT movie.name AS movie_name, director.name AS director_name
  ORDER BY movie.budget DESC
  LIMIT 10
  SKIP 10; // TOP 10-20

  MATCH (movie: Movie {name: "Unforgiven"})-[rel]->(person: Person)
  WHERE NOT ((person)->[rel: DIRECTED]->(movie))
  ORDER BY movie.budget DESC
  RETURN person; 

// 3: REGULAR EXPRESSIONS: 
  MATCH (movie: Movie)
  WHERE movie.title =~ "(?i).+The .*" // Case insensitive + atleast one character before "the"
  return movie.title;

// 4: AGGREGATIONS (COUNT, AVG, SUM, MIN, MAX): 
  MATCH (director: Person {name: "John Doe"})-[rel: DIRECTED]->(movie: Movie)
  RETURN COUNT(movie) AS movie_count; 

  MATCH (director: Person {name: "John Doe"})-[role: ACTED_IN]->(movie: Movie)
  RETURN AVG(role.earnings) AS avg_earnings, SUM(role.earnings) AS total_earnings;
  // Similarly for SUM, MIN, MAX

// 5: BUILTIN FUNCTIONS:
  RETURN lower(trim(toString("A demo string"))), lower(trim(toString(11.5))), lower(trim(toString(true)))
  RETURN upper(replace("Hello World", 'l', 'r'));

  haversin // See documentation for more details
  RETURN floor(0.5), ceil(0.5), round(0.6) // Nearest integer
  // Ref: Neo4j browser -> Documentation -> Developer mannual

  MATCH (actor: Person)->[role: ACTED_IN]->(movie: Movie)
  RETURN upper(actor.name) AS actor_name, round(SUM(role.earnings)) AS total_earnings
  ORDER BY total_earnings DESC
  LIMIT 1; // Top earning actor 
  
