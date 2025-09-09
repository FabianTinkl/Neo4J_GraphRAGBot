#!/bin/bash

# Commands to push to GitHub after creating the repository
# Run these after creating the repository at https://github.com/new

echo "🚀 Pushing Neo4j Knowledge Graphs Tutorial to GitHub..."
echo ""

# Add the remote repository (replace 'fabiantinkl' with your GitHub username if different)
git remote add origin https://github.com/fabiantinkl/Neo4J_GraphRAGBot.git

# Set main branch and push
git branch -M main
git push -u origin main

echo ""
echo "✅ Repository pushed successfully!"
echo "🌐 View at: https://github.com/fabiantinkl/Neo4J_GraphRAGBot"
echo ""
echo "Next steps:"
echo "1. Add repository description in GitHub"
echo "2. Add topics/tags: neo4j, knowledge-graph, cypher, tutorial, jupyter"
echo "3. Enable GitHub Pages if desired"