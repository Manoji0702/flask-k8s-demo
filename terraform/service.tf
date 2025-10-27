resource "kubernetes_service" "flask_service" {
  metadata {
    name = "flask-demo-service"
  }

  spec {
    selector = {
      app = "flask"
    }

    port {
      port        = 80
      target_port = 5000
      node_port   = 30081
    }

    type = "NodePort"
  }
}