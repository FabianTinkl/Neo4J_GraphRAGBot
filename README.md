# Neo4j Knowledge Graphs Tutorial

A comprehensive tutorial series on Knowledge Graphs, Neo4j, and Cypher query language, designed for beginners to advanced practitioners.

## 🎯 Overview

This repository contains interactive Jupyter notebooks that teach Knowledge Graph concepts through hands-on examples using Neo4j and real movie data.

## 📚 Tutorial Contents

### **Main Tutorial: `Knowledge_Graphs_Tutorial.ipynb`**
A complete 13-section tutorial covering:

1. **What are Knowledge Graphs?** - Fundamentals and real-world applications
2. **Introduction to Neo4j** - Architecture and Cypher basics
3. **Environment Setup** - Connection health checks and setup
4. **Cypher Fundamentals** - Core query language concepts
5. **Data Loading from CSV** - Structured data import and management
6. **Basic Cypher Queries** - Node matching and relationship traversal
7. **Data Aggregation** - Analytics and business intelligence
8. **Advanced Patterns** - Complex queries and recommendations
9. **Graph Analysis** - Network metrics and pattern discovery
10. **Practical Applications** - Real business scenarios
11. **Performance Tips** - Query optimization strategies
12. **Index Management & Profiling** - EXPLAIN, PROFILE, and index creation
13. **Conclusion** - Next steps and resources

### **Legacy Tutorial: `L2-query_with_cypher.ipynb`**
Original lesson focusing on basic Cypher query patterns.

## 🚀 Quick Start

### Prerequisites
- Python 3.8+
- Neo4j Aura account (free tier available)
- Jupyter Notebook or JupyterLab

### Setup

1. **Clone the repository:**
   ```bash
   git clone https://github.com/fabiantinkl/Neo4J_GraphRAGBot.git
   cd Neo4J_GraphRAGBot
   ```

2. **Install dependencies:**
   ```bash
   pip install -r requirements.txt
   ```

3. **Configure Neo4j connection:**
   - Create a `.env` file based on the example
   - Add your Neo4j Aura credentials:
   ```env
   NEO4J_URI="neo4j+s://your-instance.databases.neo4j.io"
   NEO4J_USERNAME="neo4j"
   NEO4J_PASSWORD="your-password"
   NEO4J_DATABASE="neo4j"
   ```

4. **Start the tutorial:**
   ```bash
   jupyter notebook Knowledge_Graphs_Tutorial.ipynb
   ```

## 📊 Sample Data

The tutorial uses a movie knowledge graph with:
- **Movies**: Popular films with metadata (title, year, tagline)
- **People**: Actors and directors with birth years
- **Genres**: Movie categories
- **Relationships**: ACTED_IN, DIRECTED, BELONGS_TO

All data is provided in structured CSV files in the `data/` directory.

## 🔧 Features

### **Connection Management**
- Automatic Neo4j Aura health checks
- Connection troubleshooting guidance
- Retry mechanisms for paused instances

### **Progressive Learning**
- Beginner-friendly explanations
- Hands-on executable examples
- Real-world business scenarios
- Performance optimization techniques

### **Production Ready**
- Index management and optimization
- Query profiling with EXPLAIN/PROFILE
- Data quality validation
- Best practices documentation

## 📁 Project Structure

```
Neo4J_GraphRAGBot/
├── Knowledge_Graphs_Tutorial.ipynb    # Main comprehensive tutorial
├── L2-query_with_cypher.ipynb        # Legacy basic tutorial
├── CLAUDE.md                         # Claude Code development guide
├── requirements.txt                  # Python dependencies
├── .env                             # Neo4j credentials (create from template)
└── data/                            # Sample CSV data files
    ├── movies.csv                   # Movie nodes
    ├── people.csv                   # Person nodes
    ├── genres.csv                   # Genre nodes
    ├── acted_in.csv                 # Actor-movie relationships
    ├── directed.csv                 # Director-movie relationships
    └── movie_genres.csv             # Movie-genre relationships
```

## 🎓 Learning Outcomes

After completing this tutorial, you will:

- ✅ Understand Knowledge Graph concepts and applications
- ✅ Master Cypher query language from basics to advanced patterns
- ✅ Know how to design and implement graph data models
- ✅ Be able to perform graph analytics and pattern discovery
- ✅ Understand performance optimization and indexing strategies
- ✅ Have hands-on experience with Neo4j and real data

## 🌟 Advanced Topics (Coming Soon)

- **GraphRAG Integration**: LLM + Knowledge Graph combinations
- **Real-World Data Pipelines**: ETL processes and streaming updates
- **Graph Algorithms**: PageRank, community detection, shortest paths
- **Production Deployment**: Scaling, monitoring, and security

## 🤝 Contributing

Contributions are welcome! Please feel free to submit issues, feature requests, or pull requests.

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🙏 Acknowledgments

- Built with [Neo4j](https://neo4j.com/) and [LangChain](https://langchain.com/)
- Tutorial data inspired by Neo4j's movie database examples
- Developed with assistance from [Claude Code](https://claude.ai/code)

---

**Happy Graph Learning!** 🎊