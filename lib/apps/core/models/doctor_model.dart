class DoctorModel {
  final String id;
  final String name;
  final String specialty;
  final String imageUrl;
  final double rating;
  final double pricePerHour;
  final bool isFavorite;
  final int runningCount;
  final int ongoingCount;
  final int patientCount;
  final List<String> services;

  DoctorModel({
    required this.id,
    required this.name,
    required this.specialty,
    required this.imageUrl,
    required this.rating,
    required this.pricePerHour,
    required this.isFavorite,
    required this.runningCount,
    required this.ongoingCount,
    required this.patientCount,
    required this.services,
  });
}