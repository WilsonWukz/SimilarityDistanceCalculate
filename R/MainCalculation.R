#' Read matrix from Excel file
#' 
#' @param file_path The path to the Excel file.
#' @param sheet The sheet number or name. Default is 1.
#' @return A numeric matrix with row names from the first column.
#' @import readxl dplyr
read_matrix_from_excel <- function(file_path, sheet = 1) {
  data <- read_excel(file_path, sheet = sheet)
  row_names <- data[[1]]
  
  numeric_data <- data[, -1]
  
  if (any(!is.na(as.numeric(row_names)) == FALSE)) {
    stop("Error: Row names (first column) contain non-numeric content. Please make sure that row names in the Excel file are all numeric.")
  }
  
  numeric_data <- as.data.frame(sapply(numeric_data, as.numeric))
  if (any(is.na(numeric_data))) {
    stop("Error: The numeric column contains non-numeric content. Please make sure all numeric data is digitized in the Excel file.")
  }
  
  matrix_data <- as.matrix(numeric_data)
  rownames(matrix_data) <- row_names
  
  return(matrix_data)
}

#' Standardize matrix columns
#' 
#' @param mat A numeric matrix.
#' @return A standardized matrix.
standardize_matrix <- function(mat) {
  apply(mat, 2, function(column) {
    (column - mean(column)) / sd(column)
  })
}

#' Compute Euclidean distances
#' 
#' @param mat A numeric matrix.
#' @return A matrix of Euclidean distances.
compute_euclidean_distances <- function(mat) {
  dist_matrix <- as.matrix(dist(mat, method = "euclidean"))
  return(dist_matrix)
}

#' Get sorted Euclidean distances
#' 
#' @param dist_matrix A matrix of distances.
#' @return A data frame of sorted Euclidean distances.
get_sorted_euclidean_distances <- function(dist_matrix) {
  row_names <- rownames(dist_matrix)
  n <- nrow(dist_matrix)
  distances <- data.frame()
  
  for (i in 1:(n-1)) {
    for (j in (i+1):n) {
      distances <- rbind(distances, data.frame(
        Group1 = row_names[i],
        Group2 = row_names[j],
        Distance = dist_matrix[i, j]
      ))
    }
  }
  
  sorted_distances <- distances[order(distances$Distance),]
  return(sorted_distances)
}

#' Compute cosine similarity
#' 
#' @param x A numeric vector.
#' @param y A numeric vector.
#' @return Cosine similarity between the two vectors.
cosine_similarity <- function(x, y) {
  sum(x * y) / (sqrt(sum(x^2)) * sqrt(sum(y^2)))
}

#' Compute cosine similarities
#' 
#' @param mat A numeric matrix.
#' @return A matrix of cosine similarities.
compute_cosine_similarities <- function(mat) {
  n <- nrow(mat)
  row_names <- rownames(mat)
  
  if (is.null(row_names)) {
    stop("Error: The input matrix must have row names.")
  }
  
  sim_matrix <- matrix(NA, n, n)
  rownames(sim_matrix) <- row_names
  colnames(sim_matrix) <- row_names
  
  for (i in 1:n) {
    for (j in 1:n) {
      sim_matrix[i, j] <- cosine_similarity(mat[i, ], mat[j, ])
    }
  }
  
  return(sim_matrix)
}

#' Get sorted cosine similarities
#' 
#' @param sim_matrix A matrix of similarities.
#' @return A data frame of sorted cosine similarities.
get_sorted_cosine_similarities <- function(sim_matrix) {
  row_names <- rownames(sim_matrix)
  n <- nrow(sim_matrix)
  
  if (is.null(row_names)) {
    stop("Error: Row names of the similarity matrix are missing.")
  }
  
  similarities <- data.frame()
  
  for (i in 1:(n-1)) {
    for (j in (i+1):n) {
      sim_value <- sim_matrix[i, j]
      
      if (!is.na(sim_value)) {
        similarities <- rbind(similarities, data.frame(
          Group1 = row_names[i],
          Group2 = row_names[j],
          Cosine_Similarity = sim_value
        ))
      }
    }
  }
  
  if (nrow(similarities) == 0) {
    stop("Error: No valid cosine similarities found.")
  }
  
  sorted_similarities <- similarities[order(similarities$Cosine_Similarity, decreasing = TRUE),]
  return(sorted_similarities)
}

#' Get top 5 comparisons
#' 
#' @param sorted_distances A data frame of sorted distances.
#' @param sorted_similarities A data frame of sorted similarities.
#' @return A list of top 5 comparisons for distances and similarities.
get_top_5_comparisons <- function(sorted_distances, sorted_similarities) {
  top_5_distances <- head(sorted_distances, 5)
  top_5_similarities <- head(sorted_similarities, 5)
  
  list(
    Top_5_Euclidean_Distances = top_5_distances,
    Top_5_Cosine_Similarities = top_5_similarities
  )
}

#' Process Excel file
#' 
#' @param file_path The path to the Excel file.
#' @param sheet The sheet number or name. Default is 1.
#' @return A list of top 5 comparisons.
process_excel_file <- function(file_path, sheet = 1) {
  mat <- read_matrix_from_excel(file_path, sheet)
  
  standardized_mat <- standardize_matrix(mat)
  
  euclidean_dist_matrix <- compute_euclidean_distances(standardized_mat)
  sorted_euclidean_distances <- get_sorted_euclidean_distances(euclidean_dist_matrix)
  
  cosine_sim_matrix <- compute_cosine_similarities(standardized_mat)
  sorted_cosine_similarities <- get_sorted_cosine_similarities(cosine_sim_matrix)
  
  top_5_comparisons <- get_top_5_comparisons(sorted_euclidean_distances, sorted_cosine_similarities)
  
  return(top_5_comparisons)
}
