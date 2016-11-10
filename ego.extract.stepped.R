ego.extract.stepped <- function (dat, ego = NULL, steps = 1)
{
  # Extracts an egocentric network from network dat for all nodes.
  # Alternatively, can extract egocentric networks for a set of nodes.
  # Egocentric network size can be defined using geodesic distance using step.
  # Function adapted from ego.extract() from the 'sna' package.
	
  d <- geodist(dat)[[2]]
  
  if (is.null(ego))
    ego <- 1:NROW(d)
  
  enet <- list()
  for (i in 1:length(ego)) {
    sel <- (1:NROW(d))[(d[ego[i],] <= steps) | (d[, ego[i]] <= steps)]
    if (length(sel) > 0)
      sel <- c(ego[i], sel[sel != ego[i]])
    else
      sel <- ego[i]
    enet[[i]] <- ifelse(d[sel, sel, drop = FALSE] == 1, 1, 0)
  }
  if (!is.null(rownames(d)))
    names(enet) <- rownames(d)[ego]
  else if (!is.null(colnames(d)))
    names(enet) <- colnames(d)[ego]
  else
    names(enet) <- ego
  enet
}
