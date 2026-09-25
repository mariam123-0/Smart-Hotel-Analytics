# 🏨 Hotel Data Analysis & Prediction System

> A data-driven Business Intelligence & AI system that transforms raw hotel operational data into structured insights, interactive dashboards, and predictive models.

**Digital Egypt Builders Initiative — Final Project**
Supervised by **Mohamed Hamed**

[![SQL Server](https://img.shields.io/badge/Database-SQL%20Server-CC2927?logo=microsoftsqlserver&logoColor=white)](#)
[![Python](https://img.shields.io/badge/ETL-Python-3776AB?logo=python&logoColor=white)](#)
[![Power BI](https://img.shields.io/badge/Dashboard-Power%20BI-F2C811?logo=powerbi&logoColor=black)](#)
[![scikit-learn](https://img.shields.io/badge/ML-scikit--learn-F7931E?logo=scikitlearn&logoColor=white)](#)
[![Streamlit](https://img.shields.io/badge/App-Streamlit-FF4B4B?logo=streamlit&logoColor=white)](#)

---

## 📌 Table of Contents

- [Overview](#-overview)
- [Problem Statement](#-problem-statement)
- [Objectives](#-objectives)
- [System Architecture](#-system-architecture)
- [Data Schema](#-data-schema)
- [ETL & Data Engineering Pipeline](#-etl--data-engineering-pipeline)
- [Data Warehouse Design](#-data-warehouse-design-star-schema)
- [AI / Predictive Modeling](#-ai--predictive-modeling)
- [Power BI Dashboard](#-power-bi-dashboard)
- [Streamlit Application](#-streamlit-application)
- [Tools & Technologies](#-tools--technologies)
- [Project Structure](#-project-structure)
- [Getting Started](#-getting-started)
- [Results & Key Insights](#-results--key-insights)
- [Future Work](#-future-work)
- [Team](#-team)
- [References](#-references)

---

## 📖 Overview

Hotels generate large volumes of operational data daily — bookings, guests, rooms, branches, and payments — but traditional transactional (OLTP) systems are not built for historical trend analysis or forecasting. This project builds a complete **BI + AI pipeline** that:

- Consolidates hotel operational data into a structured **Data Warehouse** (Star Schema)
- Automates data cleaning and transformation through a **Python ETL pipeline**
- Delivers **Power BI dashboards** for occupancy, revenue, and branch performance
- Applies **machine learning** to forecast booking cancellations and occupancy trends

---

## ❗ Problem Statement

Hotels struggle to extract meaningful insights from operational data due to:

- Limited visibility into customer booking patterns and preferences
- High cancellation rates with no predictive early-warning system
- Poor visibility into financial performance (payments, refunds, pending amounts)
- Lack of interactive, real-time dashboards for management decisions
- No AI-driven forecasting for occupancy and revenue

---

## 🎯 Objectives

- [x] Design and build a Data Warehouse based on a Star Schema (Fact + Dimensions)
- [x] Automate the ETL process using Python
- [x] Build analytical dashboards in Power BI
- [x] Train AI/ML models to forecast cancellations and occupancy
- [ ] Deploy an interactive Streamlit app for self-service exploration

---

## 🏗 System Architecture

```
Raw Data (Branches, Rooms, Guests, Bookings)
            │
            ▼
   ┌─────────────────────┐
   │   Python ETL Layer   │   ← Extract, Clean, Transform
   └─────────────────────┘
            │
            ▼
   ┌─────────────────────┐
   │  SQL Server (DWH)    │   ← Star Schema: Fact_Booking + Dimensions
   └─────────────────────┘
            │
   ┌────────┴────────┐
   ▼                 ▼
Power BI          ML Models (scikit-learn)
Dashboards        Cancellation / Occupancy Prediction
   │                 │
   └────────┬────────┘
            ▼
     Streamlit App
  (Interactive exploration layer)
```

---

## 🗂 Data Schema

The operational data model links **Branches → Rooms → Bookings → Guests**, capturing hotel structure, room-level attributes, and reservation details.

> 📷 *[Insert Data Schema diagram here]*
>
> `docs/images/data_schema.png`

**Core entities:**

| Entity | Key Fields |
|---|---|
| **Branches** | Branch_id, Branch_name, Location, Contact, Email |
| **Rooms** | room_id, Branch_id, room_num, type, price, floor_num, status |
| **Guests** | guest_id, guest_name, email, phone, room_id, booking_date |
| **Bookings** | booking_id, guest_id, room_id, check_in, check_out, payment, Branch_id |

---

## ⚙️ ETL & Data Engineering Pipeline

This is the backbone of the project — a fully automated **Python ETL pipeline** that converts messy operational data into analytics-ready warehouse tables.

### 1. Extract
- Ingest raw datasets: `branches`, `rooms`, `guests`, `bookings`
- Source formats: CSV / SQL Server operational tables

### 2. Transform
- **Data cleaning:** handle nulls, remove duplicates, standardize categorical values
- **Type conversion:** normalize date fields (`check_in`, `check_out`, `booking_date`)
- **Feature engineering:**
  - `Stay_Duration` = `check_out` − `check_in`
  - `Revenue` = `room price` × `Stay_Duration`
- **Validation:** enforce referential integrity between guests, rooms, and branches before load

### 3. Load
- Load cleaned, modeled data into **SQL Server** using a dimensional (Star Schema) design
- Incremental-load friendly structure to support scalability and reproducibility

> 📷 *[Insert ETL pipeline flow diagram / screenshot here]*
>
> `docs/images/etl_pipeline.png`

**Why this matters:** the ETL layer is what turns raw, operational, error-prone data into a **trusted single source of truth** — every dashboard KPI and every AI prediction downstream depends on the quality of this stage.

---

## 🏛 Data Warehouse Design (Star Schema)

| Table | Type | Description |
|---|---|---|
| `Fact_Booking` | Fact | Booking transactions — revenue, stay duration, cancellation status |
| `Dim_Date` | Dimension | Calendar attributes for time-based trend analysis |
| `Dim_Guest` | Dimension | Guest demographic and contact attributes |
| `Dim_Room` | Dimension | Room type, price tier, floor, status |
| `Dim_Branch` | Dimension | Branch name, location, contact info |

This design supports fast aggregation (revenue, occupancy, cancellations) across time, branch, room type, and guest segments — the foundation for both the Power BI dashboards and the ML feature set.

---

## 🤖 AI / Predictive Modeling

Machine learning models (via **scikit-learn**) were trained on historical booking data to support:

- **Room/Revenue clustering** — segmenting rooms into pricing tiers (e.g., VIP, Premium, Popular) using K-Means, evaluated with Silhouette Score
- **Cancellation forecasting** — predicting booking cancellations from guest and booking history
- **Occupancy forecasting** — estimating occupancy trends per branch/season

> 📷 *[Insert AI results — cluster plots, revenue-by-cluster, price distribution, model metrics here]*
>
> `docs/images/ai_results.png`

**Key result:** room clustering achieved a Silhouette Score of **0.65**, identifying 3 distinct pricing/performance tiers across the room portfolio.

---

## 📊 Power BI Dashboard

Interactive dashboards built on top of the Data Warehouse, covering:

- Total payments, total bookings, and recent booking activity
- Revenue by branch
- Bookings by room type
- Branch-level payment distribution and share

> 📷 *[Insert Power BI dashboard screenshot(s) here]*
>
> `docs/images/dashboard.png`

---

## 🖥 Streamlit Application

An interactive Streamlit app exposes the warehouse and model outputs for self-service exploration outside of Power BI — useful for demos and portfolio presentation.

> 📷 *[Insert Streamlit app screenshot / demo GIF here]*
>
> `docs/images/streamlit_app.png`

**Planned features:**
- Filter bookings by branch, room type, and date range
- View live occupancy and revenue KPIs
- Run cancellation prediction on sample/new booking inputs

```bash
# Run locally
streamlit run app/streamlit_app.py
```

---

## 🛠 Tools & Technologies

| Category | Tools |
|---|---|
| Database | SQL Server |
| ETL / Data Processing | Python (Pandas) |
| Visualization | Power BI, Matplotlib, Seaborn |
| Machine Learning | scikit-learn |
| App Layer | Streamlit |
| Development | Visual Studio / VS Code |
| Documentation | Microsoft Word, Canva |

---

## 📁 Project Structure

```
hotel-data-analysis/
├── data/
│   ├── raw/                  # Original source datasets
│   └── processed/            # Cleaned, transformed data
├── etl/
│   └── etl_pipeline.py       # Extract–Transform–Load scripts
├── sql/
│   └── warehouse_schema.sql  # Star schema DDL
├── models/
│   └── cancellation_model.pkl
├── notebooks/
│   └── eda_ai_modeling.ipynb
├── app/
│   └── streamlit_app.py
├── dashboards/
│   └── hotel_dashboard.pbix
├── docs/
│   └── images/
├── README.md
└── requirements.txt
```

---

## 🚀 Getting Started

```bash
# 1. Clone the repository
git clone https://github.com/<your-username>/hotel-data-analysis.git
cd hotel-data-analysis

# 2. Install dependencies
pip install -r requirements.txt

# 3. Run the ETL pipeline
python etl/etl_pipeline.py

# 4. Launch the Streamlit app
streamlit run app/streamlit_app.py
```

---

## 📈 Results & Key Insights

- ✅ The Data Warehouse successfully stores and preserves historical booking data
- ✅ ETL automation significantly reduced manual data processing effort
- ✅ Power BI dashboards revealed seasonal demand shifts and top-performing branches
- ✅ The predictive model achieved strong accuracy in forecasting booking cancellations
- ✅ Combining BI + AI enables proactive decisions — identifying overbooked seasons, forecasting demand, and optimizing pricing

---

## 🔮 Future Work

- Integrate real-time streaming data from live hotel systems
- Apply AI-driven dynamic pricing optimization
- Deploy dashboards and the Streamlit app to the cloud for remote access
- Expand the ML pipeline with revenue forecasting models

---

## 👥 Team

| ID | Name |
|---|---|
| 21088506 | Mariam Tarek |
| 21081477 | Shahd Farghaly |
| 21026189 | Mawadda Karam |
| 21076970 | Kenzy Mohamed |
| 21051740 | Mariam Ahmed |

**Supervisor:** Mohamed Hamed
**Program:** Digital Egypt Builders Initiative — Final Project

---

## 📚 References

- Antonio, N., de Almeida, A., & Nunes, L. (2022). Hotel booking demand prediction using machine learning techniques. *Journal of Hospitality and Tourism Technology, 13*(3), 350–367.
- Guillet, B. D., & Chu, A. M. Y. (2023). Hotel business intelligence and analytics adoption: A systematic literature review. *International Journal of Contemporary Hospitality Management, 35*(6), 2397–2420.
- Radanliev, P. (2021). Data analytics and business intelligence frameworks in digital supply chain management. *International Journal of Information Management, 58*, 102–123.
- Statista Research Department. (2024). Revenue impact of business intelligence adoption in hospitality. *Statista Market Insights.*
- Xiao, Y., & Kumar, V. (2020). Forecasting hotel room demand using machine learning and time-series models. *Tourism Management, 77*, 104–120.
#
