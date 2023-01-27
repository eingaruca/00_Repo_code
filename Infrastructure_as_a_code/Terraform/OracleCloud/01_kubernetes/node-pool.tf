# Source from https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/containerengine_node_pool

resource "oci_containerengine_node_pool" "oke-node-pool-front" {
    # Required
    cluster_id = oci_containerengine_cluster.oke-cluster.id
    compartment_id = var.compartment_ocid
    kubernetes_version = "v1.25.4"
    name = "front"
    node_config_details{
        placement_configs{
            #availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
            availability_domain = var.availability_domain
            subnet_id = var.subnet_id
        } 
        size = 1

        node_pool_pod_network_option_details {
            #Required
            cni_type = "OCI_VCN_IP_NATIVE"

            #Optional
            pod_subnet_ids = tolist([var.list_subnets])
        }
    }
    node_shape = var.node_shape

    node_shape_config {

        #Optional
        memory_in_gbs = 10
        ocpus = 1
    }

    # Using image Oracle-Linux-7.x-<date>
    # Find image OCID for your region from https://docs.oracle.com/iaas/images/ 
    node_source_details {
         image_id = var.image_ocid
         source_type = "image"
    }
 
    # Optional
    initial_node_labels {
        key = "name"
        value = "my-cluster-label"
    }    
}


resource "oci_containerengine_node_pool" "oke-node-pool-service" {
    # Required
    cluster_id = oci_containerengine_cluster.oke-cluster.id
    compartment_id = var.compartment_ocid
    kubernetes_version = "v1.25.4"
    name = "service"
    node_config_details{
        placement_configs{
            #availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
            availability_domain = var.availability_domain
            subnet_id = var.subnet_id
        } 
        size = 1

        node_pool_pod_network_option_details {
            #Required
            cni_type = "OCI_VCN_IP_NATIVE"

            #Optional
            pod_subnet_ids = tolist([var.list_subnets])
        }
    }
    node_shape = var.node_shape

    node_shape_config {
        memory_in_gbs = 10
        ocpus = 1
    }

    # Using image Oracle-Linux-7.x-<date>
    # Find image OCID for your region from https://docs.oracle.com/iaas/images/ 
    node_source_details {
         image_id = var.image_ocid
         source_type = "image"
    }
 
    # Optional
    initial_node_labels {
        key = "name"
        value = "my-cluster-label"
    }    
}
