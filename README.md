# Google Search Trends Analysis in the US

## Project Overview
This SQL project analyzes daily Google trending searches in the United States to understand public search behavior, identify the most searched topics, examine fast-growing queries, and explore category-level and time-based patterns.

## Objectives
- Explore the dataset structure and key variables
- Identify the top search queries by search volume
- Detect the fastest-growing search topics
- Analyze which categories dominate search trends
- Examine daily search activity over time
- Identify topics that remain trending across multiple days

## Tools Used
- PostgreSQL
- pgAdmin
- SQL

## Dataset
- Source: Daily Google Trending Searches in the US
- Key columns used:
  - query
  - start_date
  - search_volume
  - increase_percentage
  - categories

## Key SQL Analyses
1. Data exploration
2. Top trending search queries
3. Fastest growing search queries
4. Category analysis
5. Daily search activity
6. Trend duration analysis

## Sample Insights
- The query "2026 winter olympics" had the highest total search volume during the observed period.
- Several queries reached the maximum recorded growth rate, suggesting sharp spikes in public attention.
- Topics related to sports, law and government, technology, and entertainment frequently appeared among high-volume trends.
- Some search topics remained trending for multiple days, indicating sustained public interest rather than one-day spikes.

## Files
- `google_trends_analysis.sql` — SQL script for the full analysis
- `README.md` — project summary and findings

## Author
Nhi Vu
