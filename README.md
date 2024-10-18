# SimilarityDistanceCalculate

## Overview
`SimilarityDistanceCalculate` is an R package designed to process numerical data from Excel files. It allows users to calculate both Euclidean distances and cosine similarity between groups of data. The package reads data from Excel files, standardizes the values by column, and calculates the Euclidean distance and cosine similarity between rows (groups). The results are sorted and provided in a convenient format. This package also checks for non-numeric data and provides user-friendly warnings if non-numeric content is detected, ensuring the input data is fully numeric before analysis.

## Installation

You can install the package from CRAN using the following command:

```R
install.packages("SimilarityDistanceCalculate")
```

Alternatively, you can install the package directly from the GitHub repository:
# First, install the devtools package if you haven't already
```R
install.packages("devtools")
```
# Then, install the SimilarityDistanceCalculate package from GitHub
```
devtools::install_github("WilsonWukz/SimilarityDistanceCalculate")
```

## Usage

To use the `SimilarityDistanceCalculate` package, follow these steps:

1. Load the package:

```R
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

## Functions

- `read_matrix_from_excel(file_path, sheet)`: Reads a matrix from an Excel file and checks for non-numeric content.
  
- `standardize_matrix(mat)`: Standardizes the input matrix by column.

- `compute_euclidean_distances(mat)`: Computes the Euclidean distances for the standardized matrix.

- `get_sorted_euclidean_distances(dist_matrix)`: Returns the sorted Euclidean distances.

- `cosine_similarity(x, y)`: Calculates the cosine similarity between two vectors.

- `compute_cosine_similarities(mat)`: Computes the cosine similarities for the standardized matrix.

- `get_sorted_cosine_similarities(sim_matrix)`: Returns the sorted cosine similarities.

- `get_top_5_comparisons(sorted_distances, sorted_similarities)`: Returns the top 5 comparisons for both distances and similarities.

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
```

