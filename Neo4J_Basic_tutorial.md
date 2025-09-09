print("🎯 Practical Applications")
print("=" * 35)

# 1. Content Recommendation System
print("\n1️⃣ Content Recommendation Engine:")
print("   Scenario: User likes 'The Matrix' - what should we recommend?")

result = kg.query("""
// Multi-factor recommendation based on:
// 1. Shared genres
// 2. Shared actors
// 3. Similar release timeframe
MATCH (liked:Movie {title: "The Matrix"})

// Find movies with shared characteristics
MATCH (candidate:Movie)
WHERE candidate <> liked

// Calculate genre similarity
OPTIONAL MATCH (liked)-[:BELONGS_TO]->(sharedGenre:Genre)<-[:BELONGS_TO]-(candidate)
WITH candidate, liked, count(DISTINCT sharedGenre) AS genreScore

// Calculate actor similarity
OPTIONAL MATCH (liked)<-[:ACTED_IN]-(sharedActor:Person)-[:ACTED_IN]->(candidate)
WITH candidate, liked, genreScore, count(DISTINCT sharedActor) AS actorScore

// Calculate time proximity (prefer movies within 5 years)
WITH candidate, liked, genreScore, actorScore,
     CASE WHEN abs(candidate.released - liked.released) <= 5 THEN 1 ELSE 0 END AS timeScore

// Calculate overall recommendation score
WITH candidate, (genreScore * 2 + actorScore * 3 + timeScore) AS recommendationScore,
     genreScore, actorScore, timeScore
WHERE recommendationScore > 0

RETURN candidate.title AS movie, candidate.released AS year,
       recommendationScore, genreScore, actorScore, timeScore
ORDER BY recommendationScore DESC, candidate.released DESC
LIMIT 5
""")

for row in result:
    print(f"   🎬 {row['movie']} ({row['year']}) - Score: {row['recommendationScore']}")
    print(f"       Genre: {row['genreScore']}, Actor: {row['actorScore']}, Time: {row['timeScore']}")

# 2. Influencer Identification
print("\n2️⃣ Influencer Analysis (Key People in Network):")
result = kg.query("""
// Find people who connect different movie communities
MATCH (p:Person)-[:ACTED_IN|DIRECTED]->(m:Movie)-[:BELONGS_TO]->(g:Genre)
WITH p, count(DISTINCT m) AS movieCount, 
     count(DISTINCT g) AS genreSpread,
     collect(DISTINCT g.name) AS genres
WHERE movieCount >= 1 AND genreSpread >= 2
RETURN p.name AS person, movieCount, genreSpread, genres,
       round(toFloat(genreSpread) / movieCount, 2) AS diversityScore
ORDER BY genreSpread DESC, movieCount DESC
LIMIT 5
""")

for row in result:
    genres_str = ", ".join(row['genres'][:4])  # Show first 4 genres
    print(f"   🌟 {row['person']}: {row['movieCount']} movies across {row['genreSpread']} genres")
    print(f"       Diversity score: {row['diversityScore']} - Genres: {genres_str}")

# 3. Market Segmentation
print("\n3️⃣ Market Segmentation (Genre Preferences by Era):")
result = kg.query("""
MATCH (m:Movie)-[:BELONGS_TO]->(g:Genre)
WITH (m.released / 10) * 10 AS decade, g.name AS genre, count(m) AS movieCount
WHERE decade >= 1990  // Focus on recent decades
RETURN decade, genre, movieCount
ORDER BY decade DESC, movieCount DESC
""")

# Group by decade for better presentation
decades = {}
for row in result:
    decade = int(row['decade'])
    if decade not in decades:
        decades[decade] = []
    decades[decade].append((row['genre'], row['movieCount']))

for decade in sorted(decades.keys(), reverse=True):
    print(f"   📅 {decade}s - Top genres:")
    for genre, count in decades[decade][:3]:  # Top 3 per decade
        print(f"       {genre}: {count} movies")

# 4. Risk Assessment (Single Points of Failure)
print("\n4️⃣ Risk Assessment - Critical Dependencies:")
result = kg.query("""
// Find genres that would disappear if we lost certain movies
MATCH (g:Genre)<-[:BELONGS_TO]-(m:Movie)
WITH g, count(m) AS movieCount, collect(m.title) AS movies
WHERE movieCount = 1  // Genres with only one movie
RETURN g.name AS vulnerableGenre, movies[0] AS singleMovie
""")

if result:
    print("   ⚠️ Vulnerable genres (dependent on single movies):")
    for row in result:
        print(f"       {row['vulnerableGenre']} → only in '{row['singleMovie']}'")
else:
    print("   ✅ All genres are represented in multiple movies")

print("\n💡 Business Insights Summary:")
print("   • Recommendation systems can leverage multiple relationship types")
print("   • Network analysis reveals influential people and content")
print("   • Trend analysis shows market evolution over time")
print("   • Risk assessment identifies critical dependencies")