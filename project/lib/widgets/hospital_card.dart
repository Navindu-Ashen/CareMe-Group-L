import 'package:flutter/material.dart';
import 'package:project/screens/map_hospital.dart';

class HospitalCard extends StatefulWidget {
  const HospitalCard({
    super.key,
    required this.hospitalName,
    required this.imageUrl,
    required this.latitude,
    required this.longitude,
  });

  final hospitalName;
  final imageUrl;
  final double latitude;
  final double longitude;

  @override
  State<HospitalCard> createState() => _HospitalCardState();
}

class _HospitalCardState extends State<HospitalCard> {
  void test() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MapHospitalScreen(
          latitude: widget.latitude,
          longitude: widget.longitude,
          hospitalName: widget.hospitalName,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Color.fromARGB(255, 156, 188, 238),
          ),
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          child: Column(
            children: [
              if (widget.imageUrl == null)
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromARGB(255, 217, 217, 217),
                  ),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              if (widget.imageUrl != null)
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        widget.imageUrl,
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromARGB(255, 217, 217, 217),
                  ),
                ),
              SizedBox(
                height: 16,
              ),
              if (widget.hospitalName != null)
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromARGB(255, 66, 89, 121),
                  ),
                  child: Text(
                    widget.hospitalName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              if (widget.hospitalName == null)
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromARGB(255, 66, 89, 121),
                  ),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              SizedBox(
                height: 8,
              ),
              GestureDetector(
                onTap: test,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromARGB(255, 66, 89, 121),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/Gmap_logo2.png",
                        width: 80,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Hospital Location",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
