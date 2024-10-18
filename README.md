# SimilarityDistanceCalculate

## Overview
`SimilarityDistanceCalculate` is an R package designed to process numerical data from Excel files. It allows users to calculate both Euclidean distances and cosine similarity between groups of data. The package reads data from Excel files, standardizes the values by column, and calculates the Euclidean distance and cosine similarity between rows (groups). The results are sorted and provided in a convenient format. This package also checks for non-numeric data and provides user-friendly warnings if non-numeric content is detected, ensuring the input data is fully numeric before analysis.

## Installation
First, install the devtools package if you haven't already
```R
install.packages("devtools")
```
Then, install the SimilarityDistanceCalculate package from GitHub
```
devtools::install_github("WilsonWukz/SimilarityDistanceCalculate")
```

## Usage

To use the `SimilarityDistanceCalculate` package, follow these steps:

1. Load the dependent packages and the package:

```R
library(readxl)
library(dplyr)
library(SimilarityDistanceCalculate)
```

2. Process an Excel file by specifying the file path and, if necessary, the sheet number:

```R
file_path <- "path/to/your/excel/file.xlsx"
result <- process_excel_file(file_path, sheet = 1)
```

3. The result will contain the top 5 comparisons for both Euclidean distances and cosine similarities:

```R
print(result)
```
### Example: 
Original Data
![1729244159460](https://github.com/user-attachments/assets/08739565-aefa-4641-8064-c8b76b452ffa)
Standardized Data
![1729244303342](https://github.com/user-attachments/assets/62a7ad73-841a-4baa-82b5-148e44ec3271)
Calculate the Euclidean Distance Obtained
![1729244374815](https://github.com/user-attachments/assets/c6ca711f-5de0-4e2f-bcdb-2d10b3a3bf0d)
Calculate the Cosine Similarity Obtained
![1729244468342](https://github.com/user-attachments/assets/9d3a156c-df5c-44c5-aef4-7e4c8e547226)

The top 5 most similar data sets of the two methods of Euclidean distance and cosine similarity calculation are obtained respectively.
![1729244749088](https://github.com/user-attachments/assets/4f344b24-2e53-4d9a-a0e3-bd21dea3d20a)


## Functions
### Built-in Functions
- `read_matrix_from_excel(file_path, sheet)`: Reads a matrix from an Excel file and checks for non-numeric content.
  
- `standardize_matrix(mat)`: Standardizes the input matrix by column.

- `compute_euclidean_distances(mat)`: Computes the Euclidean distances for the standardized matrix.

- `get_sorted_euclidean_distances(dist_matrix)`: Returns the sorted Euclidean distances.

- `cosine_similarity(x, y)`: Calculates the cosine similarity between two vectors.

- `compute_cosine_similarities(mat)`: Computes the cosine similarities for the standardized matrix.

- `get_sorted_cosine_similarities(sim_matrix)`: Returns the sorted cosine similarities.

- `get_top_5_comparisons(sorted_distances, sorted_similarities)`: Returns the top 5 comparisons for both distances and similarities.

### Using Function
- `process_excel_file(file_path, sheet)`: The main function to process the Excel file and return the top 5 comparisons.

## Author
**WU KEZHAO**  
Maintainer: [WU KEZHAO](mailto:wilsonkwu@gmail.com)

## License
MIT

## Bug Reports
If you encounter any issues, please report them on the [GitHub issues page](https://github.com/WilsonWukz/SimilarityDistanceCalculate/issues).

## URL
[GitHub Repository](https://github.com/WilsonWukz/SimilarityDistanceCalculate)

