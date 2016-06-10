CompareNA <- function(v1, v2) {
	# This function returns TRUE wherever elements are the same, including NA's,
	# and FALSE everywhere else.
	# Source: http://www.cookbook-r.com/Manipulating_data/Comparing_vectors_or_factors_with_NA/
	same <- (v1 == v2) | (is.na(v1) & is.na(v2))
	same[is.na(same)] <- FALSE
	return(same)
}