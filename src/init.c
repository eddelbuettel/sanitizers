#include <R.h>
#include <Rinternals.h>
#include <stdlib.h> // for NULL
#include <R_ext/Rdynload.h>

/* FIXME: 
   Check these declarations against the C/Fortran source code.
*/

/* .Call calls */
extern SEXP heapAddressSanitize(void *);
extern SEXP intOverflow(void *);
extern SEXP stackAddressSanitize(void *);

static const R_CallMethodDef CallEntries[] = {
    {"heapAddressSanitize",  (DL_FUNC) &heapAddressSanitize,  1},
    {"intOverflow",          (DL_FUNC) &intOverflow,          1},
    {"stackAddressSanitize", (DL_FUNC) &stackAddressSanitize, 1},
    {NULL, NULL, 0}
};

void R_init_sanitizers(DllInfo *dll)
{
    R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
    R_useDynamicSymbols(dll, FALSE);
}
