variable "image" {
  description = "Docker image to deploy"
  type        = string
  default     = "manoj0207/flask-k8s-demo"
}

variable "kubeconfig_path" {
  description = "Path to kubeconfig file"
  type        = string
  default     = "D:\\Kube_Config\\admin.conf"
}