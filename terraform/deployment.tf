resource "kubernetes_deployment" "flask_app" {
  metadata {
    name = "flask-demo"
    labels = {
      app = "flask"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "flask"
      }
    }

    template {
      metadata {
        labels = {
          app = "flask"
        }
      }

      spec {
        container {
          image = var.image
          name  = "flask"
          port {
            container_port = 5000
          }
        }
      }
    }
  }
}