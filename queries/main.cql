// 0: DDL: 
:server switch success

////////////////////DML////////////////////////
// 1: Operators: 
  Comparison operator: =, >=, <=, >, <, <>
  Boolean operator: AND, OR, NOT, IN

  MATCH (crew_member: Crew {name: "Tom", born: 1956}) 
  RETURN crew_member 
  LIMIT 10;

  MATCH (a: Person)-[rel1: HAS_CONTACT]->(b: Person)-[rel2: HAS_CONTACT]->(c: Person)
  WHERE a <> c
  RETURN a.name, b.name , c.name 
  LIMIT 10;
  

// 2: MATCH(||)/ OPTIONAL MATCH (&&)
  MATCH (creation: Person)-[rel:CODED_BY | REVIEWED_BY]->(coder: Person) 
  WHERE creation.name >= 'T'
  RETURN creation, rel, coder
  LIMIT 10;

  OPTIONAL MATCH (director: Person)-[rel1: DIRECTED]->(movie: Movie)<-[rel2: ACTED]-[director: Person]
  WHERE NOT (director.born IN [1956, 1957, 1958]) AND director.gender = "male"
  RETURN DISTINCT movie.name as movie_name, director.name as director_name
  ORDER BY movie.budget DESC
  LIMIT 10
  SKIP 10; // TOP 10-20

  MATCH (movie: Movie {name: "Unforgiven"})-->(person: Person)
  WHERE NOT ((person)->[rel: DIRECTED]->(movie))
  ORDER BY movie.budget DESC
  RETURN person 

// 3: Regular expressions: 
  MATCH (movie: Movie)
  WHERE movie.title =~ "(?i).+The .*" // Case insensitive + atleast one character before "the"
  return movie.title

// 4: Aggregations (COUNT, AVG, SUM, MIN, MAX): 
  MATCH (director: Person {name: "John Doe"})-[rel: DIRECTED]->(movie: Movie)
  RETURN COUNT(movie) AS movie_count 

  MATCH (director: Person {name: "John Doe"})-[role: ACTED_IN]->(movie: Movie)
  RETURN AVG(role.earnings) AS avg_earnings, SUM(role.earnings) AS total_earnings 
  // Similarly for SUM, MIN, MAX

// 5: Builtin functions:
  RETURN lower(trim(toString("A demo string"))), lower(trim(toString(11.5))), lower(trim(toString(true)))
  RETURN upper(replace("Hello World", 'l', 'r'))

  haversin // See documentation for more details
  RETURN floor(0.5), ceil(0.5), round(0.6) // Nearest integer
  // Ref: Neo4j browser -> Documentation -> Developer mannual

  MATCH (actor: Person)->[role: ACTED_IN]->(movie: Movie)
  RETURN upper(actor.name) as actor_name, round(SUM(role.earnings)) as total_earnings
  ORDER BY total_earnings DESC
  LIMIT 1; // Top earning actor 
  