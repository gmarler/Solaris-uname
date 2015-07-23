#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"

#include <sys/utsname.h>
#include <strings.h>

/* And now the XS code, for C functions we want to access directly from Perl */

MODULE = Solaris::uname              PACKAGE = Solaris::uname

# XS code

PROTOTYPES: ENABLED


HV *
uname()
  PREINIT:
  struct utsname uts;
  HV *           hash;
  CODE:
    (void)uname(&uts);

    hash = newHV();

    hv_store(hash, "sysname", strlen("strlen"),    newSVpv(uts.sysname,0), 0);
    hv_store(hash, "nodename", strlen("nodename"), newSVpv(uts.nodename,0), 0);
    hv_store(hash, "release", strlen("release"),   newSVpv(uts.release,0), 0);
    hv_store(hash, "version", strlen("version"),   newSVpv(uts.version,0), 0);
    hv_store(hash, "machine", strlen("machine"),   newSVpv(uts.machine,0), 0);

    RETVAL = hash;
  OUTPUT:
    RETVAL
