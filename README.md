# Flight Delay Prediction Analysis

A machine learning project that predicts flight delays using logistic regression and identifies flight operational patterns through K-means clustering.

## 🎯 Project Overview

This project addresses the critical aviation industry challenge of flight delay prediction by developing a predictive model using machine learning techniques. The analysis combines:

- **Logistic Regression** for delay probability prediction
- **K-means Clustering** for flight pattern identification
- **Statistical Analysis** for feature importance evaluation

## 📊 Key Results

- **Fog conditions** show highest delay probability (~57%)
- **Flight duration** significantly impacts delay likelihood (p = 0.0365)
- **Four distinct flight patterns** identified through clustering
- **Weather conditions** are the strongest predictors of delays

## 🗂️ Project Structure

```
flight-delay-prediction/
├── data/
│   ├── flights_200.csv
│   └── flights_with_clusters.csv
├── src/
│   ├── FLIGHT PROJECT CODE GLM MODEL.R
│   ├── FLIGHT PROJECT CODE KMEANS CLUSTER.R
│   ├── Determining the Optimal Number of Clusters.R
│   └── Predicting with the Logistic Regression Model.R
├── visualisations/
│   ├── Clusters Visualization.png
│   ├── Delay Rate by Weather Conditions.png
│   ├── FLIGHT DISTRIBUTION DURATION BY DELAY STATUS.png
│   └── Rplot for Optimal Kmeans.png
├── docs/
│   └── SUMMARY.md
├── README.md
```

## 📈 Dataset Description

The dataset contains **200 flight records** with the following features:

| Feature | Type | Description |
|---------|------|-------------|
| Flight_ID | String | Unique flight identifier |
| Airline | Categorical | Airline name (Delta, United, American, Southwest, JetBlue) |
| Scheduled_Departure | Time | Scheduled departure time |
| Flight_Duration | Numeric | Flight duration in minutes (60-240) |
| Day_of_Week | Categorical | Day of week (1-7) |
| Weather_Conditions | Categorical | Weather conditions (Clear, Fog, Rain, Snow, Storm, Windy) |
| Delayed | Binary | Delay status (0 = On-time, 1 = Delayed) |

## 🛠️ Technologies Used

- **R** - Primary programming language
- **Libraries**: 
  - `tidyverse` - Data manipulation and visualisation
  - `caret` - Machine learning and model evaluation
  - `stats` - Statistical analysis

## 🚀 Getting Started

### Prerequisites

- R (version 4.0 or higher)
- RStudio (recommended)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/flight-delay-prediction.git
cd flight-delay-prediction
```

2. Install required R packages:
```r
install.packages(c("tidyverse", "caret"))
```

3. Load the dataset:
```r
flights <- read.csv("data/flights_200.csv")
```

## 📋 Usage

### 1. Run Logistic Regression Model

```r
source("src/logistic_regression_model.R")
```

This will:
- Build the logistic regression model
- Perform train/test split (70/30)
- Generate predictions and a confusion matrix
- Create synthetic test data for validation

### 2. Perform K-means Clustering

```r
source("src/kmeans_clustering.R")
```

This will:
- Standardise the data
- Apply K-means clustering (k=4)
- Generate cluster assignments
- Export results for visualisation

### 3. Determine Optimal Clusters

```r
source("src/optimal_clusters.R")
```

This will create an elbow plot to determine the optimal number of clusters.

### 4. Make Predictions

```r
source("src/prediction_example.R")
```

Example prediction for new flights:
```r
sample_data <- data.frame(
  Flight_Duration = c(150, 90, 200),
  Day_of_Week = factor(c(3, 5, 1), levels = 1:7),
  Weather_Conditions = factor(c("Clear", "Rain", "Snow"))
)

predictions <- predict(glm_model, newdata = sample_data, type = "response")
```

## 📊 Model Performance

### Statistical Significance

| Variable | P-value | Significance | Impact |
|----------|---------|--------------|---------|
| Flight_Duration | 0.0365 | ✅ Significant | Longer flights → Higher delay risk |
| Weather_Fog | 0.0004 | ✅ Highly Significant | Fog → Dramatically increases delays |
| Weather_Snow | 0.0115 | ✅ Significant | Snow → Meaningful delay impact |
| Weather_Storm | 0.0431 | ✅ Significant | Storm → Substantial delay risk |
| Day_of_Week | >0.05 | ❌ Not Significant | Minimal weekday/weekend effect |

### Cluster Analysis

Four distinct flight operational patterns identified:

1. **Cluster 1**: Short-medium flights (60-120 min) across weekdays
2. **Cluster 2**: Longer flights (160-240 min) primarily on weekends
3. **Cluster 3**: Short flights (60-150 min) on early weekdays
4. **Cluster 4**: Medium-long flights (140-240 min) mid-to-late week

## 🎯 Business Applications

### Operational Benefits
- **Proactive Resource Allocation**: Adjust crew scheduling based on delay predictions
- **Passenger Experience**: Early notification systems for likely delays
- **Cost Optimization**: Reduced compensation through proactive management

### Strategic Decision Support
- **Route Planning**: Identify high-risk time-weather combinations
- **Fleet Management**: Allocate aircraft based on delay vulnerability
- **Hub Operations**: Concentrate resources during high-risk periods

## 📈 Visualizations

The project includes several key visualisations:

1. **Flight Clusters Plot**: Shows the four operational patterns
2. **Delay Rate by Weather**: Compares delay rates across weather conditions
3. **Flight Duration Distribution**: Analyzes duration patterns by delay status
4. **Elbow Method Plot**: Demonstrates optimal cluster selection

## 🔮 Future Enhancements

### Recommended Improvements
- **Expanded Dataset**: Incorporate larger, multi-seasonal datasets
- **Additional Features**: Airport congestion, aircraft type, crew experience
- **Advanced Modelling**: Ensemble methods (Random Forest, Gradient Boosting)
- **Real-time Integration**: Live weather and air traffic data feeds

### Limitations
- The dataset size (200 flights) may limit generalizability
- Hour-of-day effects not captured
- External factors (ATC delays, mechanical issues) not included

## 📚 Documentation

Detailed analysis and findings are available in [SUMMARY.md](docs/SUMMARY.md).

## 👥 Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch 
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Aviation industry data insights
- R community for excellent machine learning packages
- Statistical analysis methodologies

## 📞 Contact

Oreoluwa Anjorin - anjorinoreoluwa19@gmail.com

Project Link:https://github.com/OreoluwaAnjorin/flight-prediction-model

---

⭐ **If you found this project helpful, please give it a star!** ⭐
