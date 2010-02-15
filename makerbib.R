#!/usr/bin/env r
libraries <- c('forecast','R', 'tseries', 'stats', 'MASS', 'its', 'nls2')

# a citekey is useful for citations
cite.by.name <- function(x){
  if (x == 'R'){
    res <- toBibtex(citation())
  }
  else {
    res <- toBibtex(citation(x))
  }
  if (is.list(res)) res <- res[[1]]
  # use a citekey
  res[1] <- sub("{",paste("{",x,sep=''),res[1],fixed=TRUE)
  return(res)
} 
# create a new bib file
write("", file='R.bib')
# generate all citations
for (el in sapply(libraries, cite.by.name )){
  write(el, file='R.bib',append=TRUE)
}
