ReadKey <- function() {
	# Source: http://stackoverflow.com/questions/15272916/how-to-wait-for-a-keypress-in-r
   invisible(readline(prompt="Press [enter] to continue"))
}

ReadKey2 <- function() {
    cat("[press [enter] to continue]")
    number <- scan(n=1)
}
