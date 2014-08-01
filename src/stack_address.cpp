
#include <R.h>
#include <Rdefines.h>

extern "C" {

    // cf https://code.google.com/p/address-sanitizer/wiki/ExampleStackOutOfBounds 
    SEXP stackAddressSanitize(SEXP xs) {
        int x, y;
        int stack_array[100];
        SEXP res;
        int *pres;

        x = INTEGER_VALUE(xs);
        stack_array[1] = 0;
        y = stack_array[x + 100]; 	// BOOM

        PROTECT(res = NEW_INTEGER(1)); 	// Allocating storage space
        pres = INTEGER_POINTER(res);   	// pointer to SEXP object
        pres[0] = y;
        UNPROTECT(1);
        return res;
    }
 
}
