
INFORMIXDIR='thirdparty/ibm/informix'
INFORMIXSERVER='informixoltp_tcp'
ONCONFIG="onconfig.${INFORMIXSERVER}"
INFORMIXSQLHOSTS="${INFORMIXDIR}/etc/sqlhosts.${INFORMIXSERVER}"

INFORMIXLIBDIR="${INFORMIXDIR}/lib"
INFORMIXLIBS=${INFORMIXLIBDIR}

for d in c++ cli client client/csm csm dmi esql ; do
    if [[ -d "${INFORMIXLIBDIR}/${d}" ]]; then
        INFORMIXLIBS=${INFORMIXLIBS}:${INFORMIXLIBDIR}/${d}
    fi
done

LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${INFORMIXLIBS}

PATH=${INFORMIXDIR}/bin:${PATH}
IFMX_HISTORY_SIZE=10000

export INFORMIXSERVER INFORMIXDIR ONCONFIG INFORMIXSQLHOSTS LD_LIBRARY_PATH PATH IFMX_HISTORY_SIZE