variable "default_tags_enabled" {
  description = "Option to enable or disable default tags"
  type        = bool
  default     = true
}

variable "add_tags" {
  description = "Additional tags to associate with resources"
  type        = map(string)
  default     = {}
}
