output "function_app_url" {
  value = azurerm_function_app.weather_app.default_hostname
}
