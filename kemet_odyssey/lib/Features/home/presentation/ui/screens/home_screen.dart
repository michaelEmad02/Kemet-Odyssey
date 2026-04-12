import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:kemet_odyssey/core/theme/app_colors.dart';
import 'package:kemet_odyssey/features/home/domain/entities/city_entity.dart';
import 'package:kemet_odyssey/features/home/domain/entities/place_entity.dart';
import 'package:kemet_odyssey/features/home/domain/entities/plan_entity.dart';
import 'package:kemet_odyssey/features/home/presentation/ui/widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static final List<CityEntity> _cities = [
    CityEntity(
      name: 'Cairo',
      description:
          'The city of a thousand minarets where ancient history meets bustling modern life.',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuDWjwvFLPB1ghGVGu2RSdEjMeLp1TymbkUADOfduaOoWEofXAR3OtEx_qY1r4aIAdJ6Vqe0EQIIIsIGA3qaWCQY87Rc6ojEwc1VxSaeaYFl9Y8yT9q6bxUhSioZZb9nIHPP6rtyR1w8hah1sYAFJW6EmWNBtOOLdz8DVbXjTpMORBgecvJv5ln0n6GKmpouHiMmWpWcYBOekxHledLk0YigiR7bzSuCcpf4Z095FApR11KknltdPALdQzcCqZw7nBlAGNkB0UiaN5U',
      categories: [],
      places: [],
    ),
    CityEntity(
      name: 'Luxor',
      description:
          'The world\'s greatest open-air museum, home to the Valley of the Kings.',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuDyWLAPUZ19gzdN6dFK_vEhV0AK7MOewf3-og1DTkJZeP68Sr4uGOp4VgoFGoJfNaDimZ4yiizLglovmME14zu2oYP7zqANLCsh9JgolMv39bmdDiBrq8hCO9hJzWsTUdZLEYXIvJJTSoynvFCOFsKIHsk9vayOqrMS6wFxcb2kgW8gSuz2Ey07jzuEsp0lHC5PPpZtlZF4J78vURvzBwFFTT7leXkcfh1yURJQpyLeMb6fhFyw2_k5-a4CuZYGIxzdzvKYR2Q1APc',
      categories: [],
      places: [],
    ),
    CityEntity(
      name: 'Aswan',
      description:
          'A serene landscape of Nile cataracts and Nubian culture in Upper Egypt.',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuBoq2_zjp5QgINAtTLTyxi9DH7zlY_98LI23Wzc_2Hgqnu2Az2-nmEtu2FR6ZSp-truPKU01WIKkNMQy0ZhsRgH5sf26MdnPc3_dl7nENyKiDbbJ53iE1POZUjgJ6HbwKAmOACGLSlCKIbCrC2Mb8TqCM1qjqgQuYSsVYfJPY6FawJ_16b1_dEL9C72uh4Ywj4VG8x6PzWFaX70Qh8fA73A82Dy2e4Gnzt-niC5oJ7VltK0qhT96XeYLlYhft9tQiBUJEdAfQX2Ll8',
      categories: [],
      places: [],
    ),
  ];

  static final List<PlaceEntity> _places = [
    PlaceEntity(
      name: 'Abu Simbel',
      mainImage:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuACfdTmkOGRi6AG2e3oIz-g2zhtOswBLiGhCOFTGgNCXDOJjzJWLC5CmJ_k2YGbe8U_IyXnhvG4rK6-D5pNZtK299YotN7astCmkNj27YKDqk6uYJ9sI60wf4ew5Oyd9Xnba9R7qsJ0UttpykSfejVli91O7JPuO-gqmBk6D0bT1_LVexd1ew5AoiAxt0bpee_ruE6g6Bux1TDTVTHnhEhLd4gXyBVpM4qVyu-lErFiRfMl9tV4NdYrphdcTwT2s25AZj6eagEOtLc',
      category: "test",
      description: "sfhjhsfhsfhjhsf",
      price: [],
      id: 1,
    ),
    PlaceEntity(
      name: 'Khan el-Khalili',
      mainImage:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuCFbznnxaEknApvS4UkuY60pGtGb6l55YyNF6kL3feJgF1eKQmyPvBzOZFNuTQrWcYvttlL06x6r0ReBikiiZKyn0Xg9UBsmwzhtRCAcPpX9sKKNRcf47XjdZTXLm-IZVgn0kH7XcWbEcBORCGd7PL6PUEEAMHvNO-T1bkuK7X_pWuh3V5tg1tFhLLfaOpsiPjGLlR740DfWVnHcP6pyWTN8n4zv5ddFrdMOxpuIhltYY3p55lVK-M2_qV2211H3RZAb-XzhBXxkFk',
      category: "test",
      description: "sfhjhsfhsfhjhsf",
      price: [],
      id: 2,
    ),
    PlaceEntity(
      name: 'Old Cataract',
      mainImage:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuDta3nunMBIYyyp8pKypdhIjBkyNuhMwi8nwg9TYVmYIB262KARCVN36_BgUXd-DHGG0fhnjq2ADb-HHadroZcWj-tiRpTJ5lwp-NlTssag7PHUpfjOTs8LyZgXoHlHBYSDBmMLDpYDAAtIdFcFh7Zm2TiJz1LHLSb7NAfhNWQU5a_vh7qB0uBlh9J4apDuk4r0q7ju5NXo8pc2gOxdN-ixri9T9tcQmEJQXhbz647Vw6ELhDr6ObxwbPUhyNzjplMHmHi_BVJGMuU',
      category: "test",
      description: "sfhjhsfhsfhjhsf",
      price: [],
      id: 3,
    ),
  ];

  static const List<PlanEntity> _plans = [
    PlanEntity(
      id: '1',
      duration: '7 DAYS',
      city: 'Cairo',
      categories: ['Archeologist','tsrtd','sfdsg','sdgsdgsdgsdg'],
      imageUrl: "",
      isPremium: false,
      price: 0,
      averageRating: 4,
      ratingCount: 50,
      subscribers: 0,
    ),
    PlanEntity(
      id: '2',
      duration: '4 DAYS',
      city: 'Giza',
      categories: ['tejkdsjhsdu'],
      imageUrl: "",
      isPremium: false,
      price: 0,
      averageRating: 3.9,
      ratingCount: 70,
      subscribers: 0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    // Responsive logic
   // final screenWidth = MediaQuery.of(context).size.width;
    // Define card widths relatively based on screen size, with reasonable caps.
    // final cityCardWidth = (screenWidth * 0.60).clamp(250.0, 400.0);
    // final placeCardWidth = (screenWidth * 0.60).clamp(240.0, 350.0);
    // final planCardWidth = (screenWidth * 0.85).clamp(320.0, 450.0);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: buildAppBar(theme, isDark),
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.only(bottom: 24.0), // Above bottom nav
      //   child: FloatingActionButton(
      //     onPressed: () {},
      //     backgroundColor:
      //         isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
      //     foregroundColor: AppColors.darkOnPrimary, // Always dark for gold
      //     elevation: 8,
      //     child: const Icon(Icons.add),
      //   ),
      // ),
      body: HomeBody(
        theme: theme,
        isDark: isDark,
        cities: _cities,
        places: _places,
        plans: _plans,
      ),
    );
  }

  AppBar buildAppBar(ThemeData theme, bool isDark) {
    return AppBar(
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(color: Colors.transparent),
        ),
      ),
      backgroundColor: theme.scaffoldBackgroundColor.withOpacity(0.8),
      leading: IconButton(
        icon: Icon(Icons.menu,
            color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary),
        onPressed: () {},
      ),
      title: Text(
        'Kemet Odyssey',
        style: theme.textTheme.headlineSmall?.copyWith(
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
          color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: theme.colorScheme.primary.withOpacity(0.3), width: 2),
              image: const DecorationImage(
                image: CachedNetworkImageProvider(
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuD6pHsVOsiAvczga7MnXb1sOcBqTGSjd9iLP2EsfBOubH_UEL-Op-EtRQ0K6_jnDggiuP1ep7L_1lP202NiLqTB5LvWCXGCOuPLIX1mUvnFNH66aui6RiXAjU8d-6JbgO0cjjv33B7TnVueFG_GLBSbqpA-6iBepjx184JEe_4aydvtDZ-giujvpDoSkDn-sEEMJLn03wwfAqvrrj8UJTxd2B3wtOAuaGZk8bujrTWX36XJUGn1uZbBrAJaEFZmlu-6aY2swb0lX4g'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
      ],
    );
  }
}
