enum AlertType { critical, warning, info }

class AlertItem {
  final String title;
  final String subtitle;
  final String severity;
  final String parameter;
  final List<String>? details;
  final AlertType alertType;

  AlertItem({
    required this.title,
    required this.subtitle,
    required this.severity,
    required this.parameter,
    this.details,
    required this.alertType,
  });
}
