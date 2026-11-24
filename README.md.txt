# CareLoop Clinics — No-Show Guard

## 1. Project Overview

CareLoop Clinics — No-Show Guard is a data analytics and machine learning project that analyses missed medical appointments and predicts the risk of patient no-shows.

The project combines Python, SQL, Machine Learning, and Generative AI to generate useful insights and support better patient follow-up.

## 2. Project Objectives

- Clean and prepare appointment data.
- Analyse appointment trends using SQL.
- Identify factors associated with missed appointments.
- Build and evaluate machine learning models.
- Predict patient no-show risk.
- Analyse patient follow-up notes using Gemini AI.
- Validate AI-generated responses using Pydantic.

## 3. Technologies Used

- Python
- Pandas and NumPy
- MySQL
- Scikit-learn
- Google Gemini API
- Pydantic
- Google Colab

## 4. Project Structure

- `01_ingest_clean.ipynb` – Data ingestion and cleaning.
- `02_queries.sql` – SQL queries and analysis.
- `03_model.ipynb` – Machine learning model development.
- `04_genai.ipynb` – Generative AI integration.
- `appointments_clean.csv` – Cleaned appointment data.
- `clinics_enriched.csv` – Enriched clinic data.
- `followup_notes.csv` – Original patient follow-up notes.
- `notes_analysed.csv` – AI-analysed patient notes.
- `load_data.sql` – SQL data loading script.
- `rejected_rows.json` – Rejected data records.
- `test_risk_scores.csv` – Predicted risk scores.
- `data/` – Original project datasets.

## 5. Data Analysis

The project analysed 990 appointments across 8 clinics.

- Total appointments: 990
- No-show appointments: 218
- Attended appointments: 772
- Overall no-show rate: 22.02%

SQL analysis identified patterns related to appointment lead time, reminders, and clinic-level no-show rates.

## 6. Machine Learning

Three machine learning approaches were compared:

- Logistic Regression
- Decision Tree
- Random Forest

Logistic Regression was selected based on cross-validation ROC-AUC performance.

The selected classification threshold was 0.35.

Final test results:

- Accuracy: 78.79%
- Precision: 57.14%
- Recall: 57.14%
- F1 Score: 57.14%
- ROC-AUC: 0.7889

## 7. Generative AI Integration

Google Gemini Flash Lite was used to analyse patient follow-up notes and identify possible reasons for missed appointments.

Pydantic was used to validate the structured AI responses.

In the first 10 notes:
- 9 responses were successfully validated.
- 1 blank note was skipped.

## 8. How to Run the Project

1. Download or clone this repository.
2. Open the notebooks using Google Colab or Jupyter Notebook.
3. Upload the required datasets.
4. Run the notebooks in the correct order.
5. Use MySQL for the SQL analysis.
6. Configure your own Gemini API key securely before running the GenAI notebook.

## 9. Important Note

This is an educational project. Model predictions are risk indicators and should not be treated as medical decisions or guaranteed predictions.

The observed relationships in the data do not establish causation.

**Security:** Never upload API keys, passwords, or private patient information to GitHub.

## 10. Conclusion

This project demonstrates how data cleaning, SQL analytics, machine learning, and Generative AI can work together to analyse appointment no-shows and support improved patient follow-up processes.