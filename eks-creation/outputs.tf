# output "cluster_name" {
#   value = var.cluster_name
# }

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

# output "node_group_name" {
#   value = var.node_group_name
# }
