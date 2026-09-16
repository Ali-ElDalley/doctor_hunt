import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/apps/core/utils/app_images.dart';

class DummyData {
  static final List<DoctorModel> dummyDoctors = [
    DoctorModel(
      id: '1',
      name: 'Dr. Sarah Ahmed',
      specialty: 'Cardiologist',
      imageUrl: 'https://randomuser.me/api/portraits/women/45.jpg',
      rating: 4.5,
      pricePerHour: 28.0,
      isFavorite: false,
      runningCount: 100,
      ongoingCount: 500,
      patientCount: 700,
      services: [
        'Patient care should be the number one priority.',
        'Regular heart checkups and ECG monitoring.',
        'Personalized treatment plans for chronic conditions.',
      ],
    ),
    DoctorModel(
      id: '2',
      name: 'Dr. Fillerup Grab',
      specialty: 'Medicine Specialist',
      imageUrl: 'https://randomuser.me/api/portraits/women/32.jpg',
      rating: 4.0,
      pricePerHour: 35.0,
      isFavorite: true,
      runningCount: 80,
      ongoingCount: 320,
      patientCount: 450,
      services: [
        'General health consultations.',
        'Prescription management and follow-ups.',
        'Referrals to specialists when needed.',
      ],
    ),
    DoctorModel(
      id: '3',
      name: 'Dr. Blessing',
      specialty: 'Dentist Specialist',
      imageUrl: 'https://randomuser.me/api/portraits/women/68.jpg',
      rating: 4.2,
      pricePerHour: 22.0,
      isFavorite: false,
      runningCount: 60,
      ongoingCount: 210,
      patientCount: 300,
      services: [
        'Routine dental checkups and cleaning.',
        'Cavity treatment and fillings.',
        'Teeth whitening and cosmetic dentistry.',
      ],
    ),
    DoctorModel(
      id: '4',
      name: 'Dr. Crick',
      specialty: 'Orthopedic Surgeon',
      imageUrl: 'https://randomuser.me/api/portraits/men/22.jpg',
      rating: 3.7,
      pricePerHour: 38.0,
      isFavorite: false,
      runningCount: 40,
      ongoingCount: 150,
      patientCount: 260,
      services: [
        'Bone and joint injury treatment.',
        'Post-surgery rehabilitation plans.',
        'Sports injury consultations.',
      ],
    ),
    DoctorModel(
      id: '5',
      name: 'Dr. Lachinet',
      specialty: 'Neurologist',
      imageUrl: 'https://randomuser.me/api/portraits/men/51.jpg',
      rating: 2.9,
      pricePerHour: 25.0,
      isFavorite: true,
      runningCount: 30,
      ongoingCount: 90,
      patientCount: 180,
      services: [
        'Diagnosis of nerve-related disorders.',
        'Migraine and headache management.',
        'Consultations for sleep-related neurological issues.',
      ],
    ),
  ];
  static List catagory = [
    {
      "colors": [
        AppColors.secondaryDark,
        AppColors.secondary,
        AppColors.secondaryLight,
      ],
      "image": "${AppImages.home}teeth.svg",
    },
    {
      "colors": [
        AppColors.primaryDark,
        AppColors.primary,
        AppColors.primaryLight,
      ],
      "image": "${AppImages.home}heart.svg",
    },
    {
      "colors": [AppColors.warning, AppColors.warningLight],
      "image": "${AppImages.home}eye.svg",
    },
    {
      "colors": [AppColors.danger, AppColors.dangerLight],
      "image": "${AppImages.home}body_care.svg",
    },
  ];
}
