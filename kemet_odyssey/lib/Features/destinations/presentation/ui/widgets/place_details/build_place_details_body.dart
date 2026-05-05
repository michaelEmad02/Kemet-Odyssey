import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kemet_odyssey/features/destinations/presentation/manager/cubit/fetch_place_details_cubit.dart';
import 'package:kemet_odyssey/features/destinations/presentation/ui/widgets/place_details/build_gallary_images.dart';
import 'package:kemet_odyssey/features/destinations/presentation/ui/widgets/place_details/build_place_details_contant.dart';

class BuildPlaceDetailsBody extends StatefulWidget {
  const BuildPlaceDetailsBody({super.key, required this.theme});
  final ThemeData theme;

  @override
  State<BuildPlaceDetailsBody> createState() => _BuildPlaceDetailsBodyState();
}

class _BuildPlaceDetailsBodyState extends State<BuildPlaceDetailsBody> {
  // final List<String> _galleryImages = [
  //   'https://lh3.googleusercontent.com/aida-public/AB6AXuA8SawCbqzLUh9l5fMMBb8huup49NkjiOuGBO3g5E-87Zj-HbHagVQTC_lCdfOZNvg5CD3slTRhZ1hFRFY5ykNIP4A7FE9lSaiLpPNRiKLE5WxzUwWW-6HAwT8THB7vL-h0z2nC6trx2SzMRNTl9g8Tt0Lb7O_WCjyTJJHCm4yRyVSHaCqLO95bGS3JxXaMoEf_PtbRufzKHzcRGcGrE6EGtMidPuLhE44KTeoUK3h2bfhYX4pxoHCvbjTOeoaitWgvf2hX25W0Q2Q',
  //   'https://lh3.googleusercontent.com/aida-public/AB6AXuBlhvykn9kuNoKxYuByWLhUvEVLz8FOMFgHNts6AzloBc5rbH5Tjwrtq10qNsC7Fzi4dJ0ZOcizfnghQbHiaX59Iug0hZP16auckdqugoOwHeN7xWPE9lFgEbZZDITrZkZlJh8IvLdYZVf8e15g_XF8vvx2Z6-2pVzOfjpkWlQxrv974gTFOEuZF-kXWhy2PbJdyH8Q2MlilEcsMFavjDLgtOgkqBxI43Wcfa_0YMru7PIchXPFOTu4oP01BBcp5HozXTRmMIUb2Xs',
  //   'https://lh3.googleusercontent.com/aida-public/AB6AXuBh0TGGNtyPQXhY3HTL3DbIR0767fsZ_s95wf2XIOHY8QQqoX9zYLlsWg5y09vJi5c0kQeqkDdMGuAUR3Fz19PTH-zEc3M55qoHXlLPEhuYCPZJssRLtvkti3ltG2uFipMtrMEQhWWP_UgFYBHvOeEsnn5qkAK-Zk7O-DLX0Rul5j3wy9001d0_WNkupbHxPcwWZF_3gIk2Jct8g5HcTbGb662I_pryFv3QOmNNITNoaIATJKYLMw9RMbtojsFownHomyzjcHb1QmE',
  // ];

  // // Operating schedule data
  // final List<Map<String, String>> _schedule = [
  //   {'day': 'MON', 'open': '06:00', 'close': '17:30'},
  //   {'day': 'TUE', 'open': '06:00', 'close': '17:30'},
  //   {'day': 'WED', 'open': '06:00', 'close': '17:30'},
  //   {'day': 'THU', 'open': '06:00', 'close': '17:30'},
  //   {'day': 'FRI', 'open': '08:00', 'close': '16:00'},
  //   {'day': 'SAT', 'open': '06:00', 'close': '17:30'},
  //   {'day': 'SUN', 'open': '06:00', 'close': '17:30'},
  // ];
  @override
  Widget build(BuildContext context) {
    final isDark = widget.theme.brightness == Brightness.dark;
    final today = DateTime.now().weekday;
    return BlocBuilder<FetchPlaceDetailsCubit, FetchPlaceDetailsState>(
      builder: (context, state) {
        if (state is FetchPlaceDetailsLoading) {
          return const CircularProgressIndicator();
        } else if (state is FetchPlaceDetailsFailure) {
          return Center(
            child: Text(state.errorMessage),
          );
        }
        final place = (state as FetchPlaceDetailsLoaded).place;
        final List<String> images = [];
        images.add(place.mainImage);
        images.add(place.mainImage);
        images.add(place.mainImage);
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),

                // ── Hero Gallery with Dot Indicators ──────────────────────────
                BuildGalleryImages(
                  // galleryImages: place.gallery, // because we do not have the gallery now
                  galleryImages: images,
                  isDark: isDark,
                ),

                BuildPlaceDetailsContant(
                  place: place,
                  today: today,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
