#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "ppport.h"
#include <divsufsort.h>

int
_divsufsort(SV *src, AV *sa, int size) {
    int st, i;
    saidx_t *SA;

    SA = malloc(size * sizeof(saidx_t));
    st = divsufsort(SvPV(src, size), SA, size);
    av_extend(sa, size);
    
    for (i = 0; i < size; i++) {
        // fprintf(stderr, "sa[%d] = %d\n", i, SA[i]);
        av_store(sa, i, newSViv(SA[i]));
    }

    free(SA);

    return st;
}

MODULE = Algorithm::DivSufSort		PACKAGE = Algorithm::DivSufSort		
PROTOTYPES: ENABLE

int
xs_divsufsort(src, sa, size)
    SV *src;
    AV *sa;
    int size;
CODE:
    RETVAL = _divsufsort(src, sa, size);
OUTPUT:
    RETVAL
