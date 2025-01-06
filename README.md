**PROJECT OVERVIEW: DATALEUM LIMITED SALES ANALYSIS**

This project focuses on analyzing sales data to extract valuable insights for reporting and decision-making. The analysis involves importing and transforming raw data into a structured format suitable for analytical tasks, such as counting orders, identifying product trends, and extracting valuable patterns across sales channels, states, and prices.


**Project Goals:**

•	**Data Extraction & Import:** Import data from multiple sources (e.g., sales_data, sales_channel, sales_state, sales_product) into a new database (dataleum_2).

•	**Data Cleaning & Transformation:** Ensure data is clean and usable by identifying and handling missing values and transforming certain columns for better readability and analysis.

•	**Data Analysis:** Perform various analytical queries to identify trends in sales channels, products, and states.

•	**Reporting & Insights:** Provide key insights, such as sales performance per state, sales channel, price analysis, product trends, and order counts.

**Execution Steps:**

**1.	Database Creation and Setup:**

-	Create a new database: dataleum_2.

-	Use the database: Set up the database for the queries.

-	Check tables: View the tables available in the database to understand the data structure (sales_data, sales_channel, sales_product, sales_state, etc.).

**2.	Data Inspection:**

-	Check for missing values: Identify if any columns contain NULL values using queries like:
  
-	Validate completeness: Ensure no missing values in critical columns (orderid, orderdate) for further analysis.
  
**3.	Data Transformation:**
-	Column Transformation: Transform numeric identifiers (like chanelkey) into meaningful text labels for easier understanding. For example, changing chanelkey = 1 to "Store", etc.
  
-	State Filtering: Filter data for specific states such as "Lagos", "Oyo", and "Ekiti", to focus analysis on certain regions.
  
**4.	Data Analysis & Query Execution:**

- Count Orders per Channel: Calculate the number of orders by sales channel to identify which channel performs best.
  
-	Total Orders by State: Determine the total number of orders per state and sort by the most orders to identify top-performing states.
  
-	Max Price per Channel: Identify the maximum price per sales channel to understand price variance across channels.
  
-	Product Analysis: Retrieve products containing specific keywords (e.g., "bluetooth") and count distinct occurrences of such products.
  
-	Price Analysis: Perform price filtering to understand product price distribution, for example, filtering orders between N200 and N500.

**5.	Execution of Stored Procedures:**

- Stored Procedure for Channel Analysis: Wrap the order counting query for specific channels into a stored procedure (ShowOrders) for reusable analysis. The procedure takes a channel name as input and returns the order count for that channel.
You can call this procedure to retrieve order counts for a specific channel, such as "Online".

**6.	Data Filtering & Complex Queries:**

- Filtering for Specific States and Conditions:
  
For example, filter orders from "Lagos" with prices greater than N700:
                                     where state = "Lagos" and price > 700;
                                     
**Transformation for Analytics:**

•	Data Cleansing: Ensure that missing values (NULLs) are handled appropriately, and necessary columns are transformed (e.g., channel keys to readable categories).

•	Joins: Data from related tables are merged using LEFT JOIN to bring in additional columns (e.g., state, product name, etc.) to enrich the analysis.

•	Filtering: Use WHERE and IN clauses to filter data by states or price ranges to focus on relevant segments for analysis.

•	Aggregations: Use aggregation functions (e.g., COUNT, MAX, SUM) to derive key metrics like total orders, peak price, etc.

**Analysis Results:**

•	Sales Channel Performance: By counting orders per sales channel, we can identify which channels (e.g., Store, Online, Mobile_Outlet) generate the most orders.

•	State-Based Trends: States like "Lagos" may show higher order volumes, helping target strategies for certain regions.

•	Price Insights: Identifying max prices per channel and filtering orders by price ranges allows for understanding the pricing dynamics and identifying high-value transactions.

•	Product Trends: Analyzing product names and keywords, like those with "bluetooth", allows businesses to understand which types of products are trending.

**Conclusion:**

This project uses SQL queries to clean, transform, and analyze sales data. The insights derived can guide business decisions, such as adjusting marketing strategies for specific states or channels, optimizing pricing, or focusing on high-demand products. The procedure encapsulation enhances reusability, while the structured approach to analysis ensures that the project is scalable for future data expansions.


