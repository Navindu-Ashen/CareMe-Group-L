class PatientData {
  PatientData({
    required this.databaseId,
    required this.patientId,
    required this.patientName,
    required this.patientAge,
    required this.patientGender,
    required this.patientState,
    required this.patientDescription,
    required this.travelTime,
    required this.ambulanceNumber,
    required this.pickedLocation,
    required this.isHandedOver,
  });
  final String databaseId;
  final String patientId;
  final String patientName;
  final String patientAge;
  final String patientGender;
  final String patientState;
  final String patientDescription;
  final String travelTime;
  final String ambulanceNumber;
  final String pickedLocation;
  final bool isHandedOver;
}
