import 'package:coffee_bloom/helper/app_constants.dart';
import 'package:coffee_bloom/view/login_screen.dart';
import 'package:coffee_bloom/view/sign_up_screen.dart';
import 'package:coffee_bloom/view/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(24),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          fillColor: AppTheme.secColor,
                          filled: true,
                          hintText: AppConstants.msTextFieldTxt,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: AppTheme.blackColor),
                          ),
                        ),
                      ),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.3,
                width: double.infinity,
                child: FlutterMap(
                  options: MapOptions(
                    initialCenter: LatLng(51.509364, -0.128928),
                    initialZoom: 9.2,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          AppConstants.msLocationTxt,
                          style: Theme.of(context).textTheme.bodySmall,
                          maxLines: 3,
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Icon(
                              Icons.directions,
                              size: 24,
                              color: AppTheme.primaryColor,
                            ),
                            Text(AppConstants.msGetDirTxt),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 22),
                    Text(
                      AppConstants.msOpenHrsTxt,
                      style: GoogleFonts.offside(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 14),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              AppConstants.msSunTxt,
                              style: GoogleFonts.oldStandardTt(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              AppConstants.msMonTxt,
                              style: GoogleFonts.oldStandardTt(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              AppConstants.msTueTxt,
                              style: GoogleFonts.oldStandardTt(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              AppConstants.msWedTxt,
                              style: GoogleFonts.oldStandardTt(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              AppConstants.msThursTxt,
                              style: GoogleFonts.oldStandardTt(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              AppConstants.msFriTxt,
                              style: GoogleFonts.oldStandardTt(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              AppConstants.msSatTxt,
                              style: GoogleFonts.oldStandardTt(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 8),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              AppConstants.msSunTimeTxt,
                              style: GoogleFonts.oldStandardTt(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              AppConstants.msMonTimeTxt,
                              style: GoogleFonts.oldStandardTt(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              AppConstants.msMonTimeTxt,
                              style: GoogleFonts.oldStandardTt(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              AppConstants.msMonTimeTxt,
                              style: GoogleFonts.oldStandardTt(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              AppConstants.msMonTimeTxt,
                              style: GoogleFonts.oldStandardTt(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              AppConstants.msMonTimeTxt,
                              style: GoogleFonts.oldStandardTt(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              AppConstants.msMonTimeTxt,
                              style: GoogleFonts.oldStandardTt(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 8),
                          ],
                        ),
                        SizedBox(width: 50),
                      ],
                    ),
                    SizedBox(height: 25,),
                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                        child: Text(AppConstants.msContinueTxt, style: Theme.of(context).textTheme.headlineMedium,),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
