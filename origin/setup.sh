# This is needed to access github
iptables -F

# Registry settings
oc create serviceaccount registry -n default
oadm policy add-scc-to-user privileged system:serviceaccount:default:registry
oadm registry --credentials=./openshift.local.config/master/openshift-registry.kubeconfig --service-account=registry --mount-host="/mnt/registry"

# For JBoss Middleware Imagestreams
oc create -f https://raw.githubusercontent.com/jboss-openshift/application-templates/master/jboss-image-streams.json -n openshift
oc create -f https://raw.githubusercontent.com/jboss-openshift/application-templates/master/datagrid/datagrid65-basic.json -n openshift
oc create -f https://raw.githubusercontent.com/jboss-openshift/application-templates/master/eap/eap64-basic-s2i.json -n openshift
oc create -f https://raw.githubusercontent.com/jboss-openshift/application-templates/master/eap/eap70-basic-s2i.json -n openshift

# For routing
oc create sa router
oadm policy add-scc-to-user hostnetwork -z router
oadm router --credentials='/var/lib/origin/openshift.local.config/master/openshift-router.kubeconfig' --service-account=router
