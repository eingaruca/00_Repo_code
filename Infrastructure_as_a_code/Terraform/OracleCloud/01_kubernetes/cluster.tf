# Source from https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/containerengine_cluster
# https://docs.oracle.com/en-us/iaas/developer-tutorials/tutorials/tf-cluster/01-summary.htm
# Values
# https://docs.oracle.com/en-us/iaas/tools/python/2.90.3/api/container_engine/models/oci.container_engine.models.OciVcnIpNativeClusterPodNetworkOptionDetails.html#oci.container_engine.models.OciVcnIpNativeClusterPodNetworkOptionDetails.CNI_TYPE_OCI_VCN_IP_NATIVE

resource "oci_containerengine_cluster" "oke-cluster" {
    # Required
    compartment_id = var.compartment_ocid
    kubernetes_version = "v1.25.4"
    name = var.cluster_name
    vcn_id = var.vcn_id

    cluster_pod_network_options {
        cni_type = "OCI_VCN_IP_NATIVE"
    }
    #Endpoint
    endpoint_config {

        #Optional
        subnet_id = var.subnet_id
    }

    # Optional
    options {
        add_ons{
            is_kubernetes_dashboard_enabled = false
            is_tiller_enabled = false
        }
        kubernetes_network_config {
            pods_cidr = "10.244.0.0/16"
            services_cidr = "10.96.0.0/16"
        }
        #service_lb_subnet_ids = [oci_core_subnet.vcn-public-subnet.id]
    }  
}