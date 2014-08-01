
#include <R.h>
#include <Rdefines.h>

extern "C" {

    // https://code.google.com/p/address-sanitizer/wiki/ExampleHeapOutOfBounds 
    SEXP heapAddressSanitize(SEXP xs) {
        int *array = new int[100];
        int x, y;
        SEXP res;
        int *pres;

        array[0] = 0;
        x = INTEGER_VALUE(xs);
        y = array[x + 100];  		// BOOM
        delete [] array;

        PROTECT(res = NEW_INTEGER(1)); 	// Allocating storage space
        pres = INTEGER_POINTER(res);   	// pointer to SEXP object
        pres[0] = y;
        UNPROTECT(1);
        return res;
    }

}

