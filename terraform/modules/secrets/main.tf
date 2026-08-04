resource "aws_secretsmanager_secret" "app_secrets" {
  name                    = "ivolve/app-secrets"
  recovery_window_in_days = 0 # Immediately delete if destroyed in test
}

resource "aws_secretsmanager_secret_version" "app_secrets_val" {
  secret_id     = aws_secretsmanager_secret.app_secrets.id
  secret_string = jsonencode({
    DB_PASSWORD      = var.db_password
    DB_ROOT_PASSWORD = var.db_password
    JWT_SECRET       = var.jwt_secret
  })
}