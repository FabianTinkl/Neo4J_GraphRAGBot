# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Neo4j GraphRAG Bot project that demonstrates querying knowledge graphs using Cypher queries through LangChain's Neo4j integration. The project consists of a Jupyter notebook that teaches Cypher query patterns for interacting with a movie knowledge graph database.

## Development Environment

### Prerequisites
- Python with Jupyter notebook support
- Neo4j Aura database instance (must be resumed/active)
- Required Python packages: `dotenv`, `langchain_community`, `pandas`

### Running the Project
- Start Jupyter: `jupyter notebook` or `jupyter lab`
- Open `Knowledge_Graphs_Tutorial.ipynb` (comprehensive tutorial) or `L2-query_with_cypher.ipynb` (original)
- **Important**: Run the connection health check first - it will guide you if your Aura instance needs to be resumed

### Neo4j Aura Management
- Free Aura instances automatically pause after 3 days of inactivity
- Use the built-in health check function to diagnose connection issues
- Manual resume: Go to https://console.neo4j.io → Find instance → Click "Resume" → Wait 60 seconds

## Architecture

### Core Components
- **Environment Configuration**: Neo4j connection details stored in `.env`
- **Database Integration**: Uses LangChain's `Neo4jGraph` wrapper for Neo4j connectivity
- **Query Patterns**: Demonstrates progressive Cypher query complexity from basic node matching to relationship traversals

### Neo4j Connection
The notebook connects to a Neo4j Aura instance using:
- URI: Neo4j+s secure connection
- Authentication via username/password
- Database name configuration

### Knowledge Graph Structure
- **Nodes**: `Movie` and `Person` entities
- **Relationships**: `ACTED_IN`, `WORKS_WITH`
- **Properties**: Movies have `title`, `released`, `tagline`; Persons have `name`

## Key Cypher Patterns Demonstrated
- Node counting and filtering by labels
- Property-based node matching
- Conditional matching with `WHERE` clauses
- Multi-node relationship traversals
- Co-actor discovery through shared movies
- Data manipulation (CREATE, DELETE, MERGE)

## Environment Variables
Required in `.env`:
- `NEO4J_URI`: Database connection string
- `NEO4J_USERNAME`: Database username
- `NEO4J_PASSWORD`: Database password
- `NEO4J_DATABASE`: Database name
- `AURA_INSTANCEID`: Neo4j Aura instance identifier
- `AURA_INSTANCENAME`: Instance display name