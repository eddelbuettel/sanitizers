
stackAddressSanitize <- function(x=10) {
    .Call(c_stackAddressSanitize, x)
}

heapAddressSanitize <- function(x=10) {
    .Call(c_heapAddressSanitize, x)
}

intOverflowSanitize <- function(x=31) {
    .Call(c_intOverflow, x)
}

