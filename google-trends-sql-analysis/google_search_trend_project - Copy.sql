-- =========================================
-- PROJECT: Google Search Trends in the US
-- OBJECTIVE: Understand trending search behavior in the US
-- by analyzing search volume, growth rate, categories,
-- and daily search activity.
-- =========================================

-- Relevant columns for this analysis:
-- query, start_date, search_volume, increase_percentage, categories

CREATE TABLE google_trends (
query TEXT,
start_date TIMESTAMP,
end_date TIMESTAMP,
active BOOLEAN,
search_volume INT,
increase_percentage FLOAT,
categories TEXT,
trend_breakdown TEXT
);
-- =========================================
-- 1. DATA EXPLORATION
-- =========================================

-- Check total number of records
SELECT COUNT(*)
FROM google_trends;

-- Preview first 10 rows
SELECT *
FROM google_trends
LIMIT 10;

-- Check categories
SELECT DISTINCT categories
FROM google_trends;

-- Check completeness of key columns
SELECT
    COUNT(*) AS total_rows,
    COUNT(query) AS query_not_null,
    COUNT(start_date) AS start_date_not_null,
    COUNT(search_volume) AS volume_not_null,
    COUNT(increase_percentage) AS increase_pct_not_null,
    COUNT(categories) AS categories_not_null
FROM google_trends;

	-- Result:
	-- All key analytical columns contain no missing values.
	-- Therefore, no data cleaning for missing values is required.
	
--=========================================
-- 2. TREND ANALYSIS
--=========================================

-- =========================================
-- 2.1 TOP TRENDING SEARCH QUERIES
-- Which search query has the highest search volume?

	SELECT
		query,
		sum(search_volume) AS total_search_volume
	FROM google_trends
	GROUP BY query
	ORDER BY total_search_volume DESC
	LIMIT 10;
	
		-- Insight:
		-- The query "2026 winter olympics" has the highest total search volume

-- =========================================
-- 2.2 FASTEST GROWING SEARCH QUERIES
--Which queries are growing the fastest?
	SELECT
	query,
	increase_percentage,
	search_volume
	FROM google_trends
	ORDER BY increase_percentage DESC, search_volume DESC
	LIMIT 10;

	-- Insight:
	-- Several queries show the maximum growth rate (1000%).
	-- To identify the most impactful trends, search_volume is used
	-- as a secondary ranking factor.

-- =========================================
-- 2.3 MOST POPULAR CATEGORIES
-- =========================================

	SELECT
	categories,
	AVG(search_volume) AS avgg_search_volume
	FROM google_trends
	GROUP BY categories
	ORDER BY avgg_search_volume DESC
	LIMIT 10;
	-- Insight:
	-- Categories related to Law and Government and Sports
	-- appear among the highest in average search volume,
	-- suggesting strong public interest in political events
	-- and major sports topics during this period.

-- =========================================
-- 3.1 DAILY SEARCH ACTIVITY
--How does search activity change over time?

	SELECT
	DATE(start_date) as trend_date,
	SUM(search_volume) AS total_search_volume
	FROM google_trends
	GROUP BY trend_date
	ORDER BY trend_date;

-- =========================================
-- 3.2 NUMBER OF TRENDING QUERIES PER DAY

	SELECT
	DATE(start_date) as trend_date,
	COUNT(query) AS total_trending_queries
	FROM google_trends
	GROUP BY trend_date
	ORDER BY trend_date;

-- =========================================
-- 4. TREND DURATION
--Which search topics stay popular for multiple days?

 	SELECT
	query,
	COUNT(DISTINCT DATE(start_date)) AS days_trending
	FROM google_trends
	GROUP BY query
	ORDER BY days_trending DESC
	LIMIT 10;
	
	-- Insight:
	-- Several topics remain in the trending list for multiple days,
	-- indicating sustained public interest rather than short-lived spikes.