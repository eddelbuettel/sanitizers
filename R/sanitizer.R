
stackAddressSanitize <- function(x=10) {
    .Call("stackAddressSanitize", x, PACKAGE="sanitizers")
}

heapAddressSanitize <- function(x=10) {
    .Call("heapAddressSanitize", x, PACKAGE="sanitizers")
}

intOverflowSanitize <- function(x=31) {
    .Call("intOverflow", x, PACKAGE="sanitizers")
}

