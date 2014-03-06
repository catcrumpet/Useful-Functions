# Converts the types for columns of a data frame (obj) into types specified by a vector (types)
# Returns a data frame

convert.magic <- function(obj,types){
    out <- lapply(1:length(obj),FUN = function(i){FUN1 <- switch(types[i],character = as.character,numeric = as.numeric,factor = as.factor); FUN1(obj[,i])})
    names(out) <- colnames(obj)
    as.data.frame(out)
}