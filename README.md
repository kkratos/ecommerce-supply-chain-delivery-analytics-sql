# E-Commerce Fulfillment & Delivery Optimization Analytics (MySQL)

<p align="center">
  <img src="https://github.com/user-attachments/assets/8fdb56f3-4c21-4ed6-b367-c55391d9847a" alt="Centered Image">
</p>

## 📌 Executive Summary
This project analyzes **100K+ order fulfillment records** to identify operational bottlenecks, calculate On-Time In-Full (OTIF) delivery performance, and model revenue exposure resulting from Service Level Agreement (SLA) breaches. Using MySQL, the analysis evaluates last-mile logistics constraints, seller reliability scores, and external factors like weather and traffic congestion to provide actionable supply chain insights.

---

## 🛠️ Tech Stack & SQL Concepts
* **Database Management System:** MySQL
* **SQL Techniques Used:**
  * **Common Table Expressions (CTEs):** Structured multi-stage risk aggregation pipelines.
  * **Window Functions:** Ranking state-level product delay performance via `DENSE_RANK()`.
  * **Conditional Aggregation:** Evaluating delay rates using `CASE WHEN` logic.
  * **Filtering & Grouping:** Data rollups using `GROUP BY`, `HAVING`, and distance binning.

---

## 🔍 Key Analytical Questions Solved
1. **Late Delivery & OTIF Baseline:** Calculated overall delay percentages across 100K+ fulfillment records based on processing and dispatch thresholds.
2. **Geographic & Category Bottlenecks:** Mapped late deliveries across customer states, cities, and product categories to pinpoint network friction.
3. **Seller Reliability & SLA Performance:** Screened seller rating metrics and flagged high-volume sellers failing SLA parameters (>25% late delivery rate).
4. **Distance Tier Analysis:** Binned shipping distances into Short, Medium, and Long tiers to measure dispatch delay correlation.
5. **External Disruption Impact:** Analyzed compound delivery delays under varying weather and traffic conditions.
6. **Revenue at Risk:** Filtered high-value (`>$200`) and high-priority (`High/Critical`) breached orders to quantify localized revenue exposure by state.

---

## 📊 Key Findings & Insights
* **Revenue Exposure:** High-value order delays concentrated in specific states create significant financial risk, highlighting areas needing priority carrier routing.
* **Distance Constraints:** Longer shipping tiers (>1000 km) exhibit higher dispatch latency, pointing to inventory positioning opportunities closer to demand nodes.
* **External Factors:** Severe weather paired with high traffic levels exponentially increases delay rates compared to baseline conditions.

---
