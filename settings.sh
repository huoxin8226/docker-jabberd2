#!/bin/bash

FNAME=/etc/jabberd2/router.xml

cp ${FNAME} ${FNAME}.bak
xmlstarlet ed -u "/router/local/secret" -v ${SERVER_ROUTER_PASS} ${FNAME}.bak > ${FNAME}

cp ${FNAME} ${FNAME}.bak
xmlstarlet ed -u "/router/aci/acl/user" -v ${SERVER_ROUTER_USER} ${FNAME}.bak > ${FNAME}

FNAME=/etc/jabberd2/sm.xml

cp ${FNAME} ${FNAME}.bak
xmlstarlet ed -u "/sm/router/user" -v ${SERVER_ROUTER_USER} ${FNAME}.bak > ${FNAME}

cp ${FNAME} ${FNAME}.bak
xmlstarlet ed -u "/sm/router/pass" -v ${SERVER_ROUTER_PASS} ${FNAME}.bak > ${FNAME}

cp ${FNAME} ${FNAME}.bak
xmlstarlet ed -u "/sm/local/id" -v ${SERVER_DOMAIN} ${FNAME}.bak > ${FNAME}

cp ${FNAME} ${FNAME}.bak
xmlstarlet ed -u "/sm/aci/acl/jid" -v "${SERVER_ADMIN}@${SERVER_DOMAIN}" ${FNAME}.bak > ${FNAME}

FNAME=/etc/jabberd2/s2s.xml

cp ${FNAME} ${FNAME}.bak
xmlstarlet ed -u "/s2s/router/user" -v ${SERVER_ROUTER_USER} ${FNAME}.bak > ${FNAME}

cp ${FNAME} ${FNAME}.bak
xmlstarlet ed -u "/s2s/router/pass" -v ${SERVER_ROUTER_PASS} ${FNAME}.bak > ${FNAME}

FNAME=/etc/jabberd2/c2s.xml

cp ${FNAME} ${FNAME}.bak
xmlstarlet ed -u "/c2s/router/user" -v ${SERVER_ROUTER_USER} ${FNAME}.bak > ${FNAME}

cp ${FNAME} ${FNAME}.bak
xmlstarlet ed -u "/c2s/router/pass" -v ${SERVER_ROUTER_PASS} ${FNAME}.bak > ${FNAME}

cp ${FNAME} ${FNAME}.bak
xmlstarlet ed -u "/c2s/local/id[@register-enable=mu]" -v ${SERVER_DOMAIN} ${FNAME}.bak > ${FNAME}
