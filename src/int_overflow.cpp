
#include <R.h>
#include <Rdefines.h>

extern "C" {

    // with thanks to Greg Jefferis (https://github.com/eddelbuettel/docker-debian-r/issues/1)
    // 
    // call with a sufficiently large x such as 31
    //
    SEXP intOverflow(SEXP xs) {
        int x, y;
        SEXP res;
        int *pres;

        x = INTEGER_VALUE(xs);
        y = (1 << x)  - 1;  		// BOOM -- (signed) int overflow

        PROTECT(res = NEW_INTEGER(1)); 	// Allocating storage space
        pres = INTEGER_POINTER(res);   	// pointer to SEXP object
        pres[0] = y;
        UNPROTECT(1);
        return res;
    }

}
