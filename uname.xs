#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"

/* And now the XS code, for C functions we want to access directly from Perl */

MODULE = Solaris::uname              PACKAGE = Solaris::uname

# XS code

PROTOTYPES: ENABLED


SV *
uname(void)
  PREINIT:
  struct utsname uts;
  HV *           rval;
  CODE:
  (void)uname(&uts);
  RETVAL = rval;
  OUTPUT:
  RETVAL
