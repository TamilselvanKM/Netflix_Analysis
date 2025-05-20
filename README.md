
![logo](https://github.com/user-attachments/assets/71ad1e42-c8ef-4cdf-af00-3a5967a49153)

# Netflix Data Analysis Using SQL

This project provides insights into Netflix content using SQL queries. It is designed to answer 15 practical business questions that help in understanding the distribution, popularity, and trends in Netflix's dataset.

---

## Dataset

Assumed table: `Netflix`  
Contains columns such as:
- `show_id`, `type`, `title`, `director`, `casts`, `country`, `date_added`, `release_year`, `rating`, `duration`, `listed_in`, `description`
---

## Business Problems & SQL Solutions
### 1. Count of Movies vs TV Shows
- **Goal:** Compare the volume of Movies and TV Shows.
- **Query:** `GROUP BY type` with a `COUNT(*)`.

### 2. Most Common Rating per Type
- **Goal:** Identify the most frequent content rating for each type.
- **Techniques:** `RANK()` window function over grouped count.

### 3. Movies Released in 2020
- **Goal:** Filter movies by a specific release year.
- **Condition:** `WHERE type='Movie' AND release_year=2020`.

### 4. Top 5 Countries with Most Content
- **Goal:** Identify countries producing the most Netflix content.
- **Technique:** Use `unnest(string_to_array(...))` to normalize multiple countries.

### 5. Longest Movie on Netflix
- **Goal:** Find the movie with the maximum duration.
- **Technique:** `MAX(duration)`.

### 6. Content Added in the Last 5 Years
- **Goal:** Recent content analysis.
- **Technique:** Convert `date_added` to date and compare with current date using interval.

### 7. Content by Director 'Rajiv Chilaka'
- **Goal:** Find all works by a specific director.

### 8. TV Shows with More Than 5 Seasons
- **Goal:** Identify long-running shows.
- **Technique:** Parse the numeric part of `duration` for filtering.

### 9. Count of Content per Genre
- **Goal:** Determine content volume per genre.
- **Technique:** Normalize multi-genre entries using `unnest()`.

### 10. Top 5 Years with Highest Avg Content Released in India
- **Goal:** Identify peak years of Indian content production.
- **Technique:** Calculate yearly count and average proportion.

### 11. Movies That Are Documentaries
- **Goal:** Filter for documentary content.
- **Technique:** Case-insensitive match in `listed_in`.

### 12. Content Without Directors
- **Goal:** Detect incomplete metadata.
- **Condition:** `WHERE director IS NULL`.

### 13. Salman Khan Movies in the Last 10 Years
- **Goal:** Actor-specific search with a time filter.
- **Condition:** Match cast and filter by `release_year`.

### 14. Top 10 Actors in Indian Movies
- **Goal:** Rank actors by frequency in Indian content.
- **Technique:** Use `unnest()` on `casts`.

### 15. Categorize Content Based on Description
- **Goal:** Label content as 'Good' or 'Bad' based on keywords.
- **Logic:** If `description` contains 'kill' or 'violence' ➝ `Bad_content`; else ➝ `Good_content`.

---

## Tools & Technologies
- PostgreSQL
- SQL functions: `GROUP BY`, `ORDER BY`, `RANK()`, `CASE`, `ILIKE`, `UNNEST`, `TO_DATE`, `INTERVAL`, `EXTRACT`

---

## Outcomes
This analysis helps:
- Understand content trends across years, genres, countries, and actors.
- Identify data quality issues (like missing directors).
- Classify content sentiment based on description.
- Provide strategic insights for content planning and regional preferences.

---

