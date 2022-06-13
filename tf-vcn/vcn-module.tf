module "vcn" {
  source  = "oracle-terraform-modules/vcn/oci"
  version = "3.4.0"
  # insert the 8 required variables here

    # Required Inputs
  compartment_id = module.access_compartment.compartment-OCID  
  region= var.region
 /*  compartment_id= "ocid1.compartment.oc1..aaaaaaaaabpdzzu55xdifn5ayfpeaxnhv77c6srqxtrjjp5fdzmvucluv2qq"
  region = "ap-mumbai-1" */

  internet_gateway_route_rules = null
  local_peering_gateways = null
  nat_gateway_route_rules = null

  # Optional Inputs
  vcn_name = "Valheim_TF_VCN"
  vcn_dns_label = "Vahelim_TF_DNS"
  vcn_cidrs = ["10.0.0.0/16"]
  
  create_internet_gateway = true
  create_nat_gateway = true
  create_service_gateway = true  

  defined_tags= {} 
  drg_rpc_acceptor_id= null
  drg_rpc_acceptor_region= null 

}