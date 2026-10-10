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
  final double? latitude;
  final double? longitude;
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
    this.latitude,
    this.longitude,
  });
  factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
    id: json['id']?.toString() ?? '',
    name: json['name']?.toString() ?? '',
    specialty: json['specialties'] is Map
        ? (json['specialties'] as Map)['name']?.toString() ?? ''
        : (json['specialty']?.toString() ?? ''),
    imageUrl: json['image_url'] as String? ?? '',
    rating: json['rating'] != null
        ? double.tryParse(json['rating'].toString()) ?? 0.0
        : 0.0,
    pricePerHour: json['price_per_hour'] != null
        ? double.tryParse(json['price_per_hour'].toString()) ?? 0.0
        : 0.0,
    isFavorite: false,
    runningCount: (json['running_count'] as num?)?.toInt() ?? 0,
    ongoingCount: (json['ongoing_count'] as num?)?.toInt() ?? 0,
    patientCount: (json['patient_count'] as num?)?.toInt() ?? 0,
    services: json['services'] != null
        ? (json['services'] as List).map((e) => e.toString()).toList()
        : [],
    latitude: (json['latitude'] as num?)?.toDouble(),
    longitude: (json['longitude'] as num?)?.toDouble(),
  );

  factory DoctorModel.skeletonizer() => DoctorModel(
    id: 'skeleton',
    name: 'Dr. Alexander Bennett',
    specialty: 'Specialist Physician',
    imageUrl: '',
    rating: 4.8,
    pricePerHour: 100.0,
    isFavorite: false,
    runningCount: 120,
    ongoingCount: 45,
    patientCount: 350,
    services: const [
      'General Consultation',
      'Clinical Diagnosis',
      'Treatment Planning',
    ],
  );

  factory DoctorModel.skeleton() => DoctorModel.skeletonizer();
}
