import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_apis_app/constants/constants.dart';
import 'package:movies_apis_app/Get/FavouriteController.dart';

class MovieDetailsScreen extends StatefulWidget {
  final String? posterImage,
      MovieName,
      Language,
      release,
      origTitle,
      rating,
      overview;

  MovieDetailsScreen({
    this.posterImage,
    this.MovieName,
    this.Language,
    this.release,
    this.origTitle,
    this.rating,
    this.overview,
  });

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  final FavouriteController _favouriteController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25)),
              child: Stack(
                children: [
                  Container(
                    height: ScreenSize.screenHeight(context) * .6,
                    width: double.infinity,
                    child: Image.network(
                      widget.posterImage.toString(),
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    bottom: 10,
                    child: Row(
                      children: [
                        Text(
                          widget.Language.toString(),
                          style: GoogleFonts.aBeeZee(
                            fontWeight: FontWeight.w500,
                            color: Colors.cyan,
                            fontSize: ScreenSize.screenWidth(context) * .06,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(top: 10, left: 10, child: BackButton())
                ],
              )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: ScreenSize.screenWidth(context) * .13,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              widget.MovieName?.toString() ?? 'N/A',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.aBeeZee(
                                fontWeight: FontWeight.w500,
                                // color: Colors.white,
                                fontSize: ScreenSize.screenWidth(context) * .07,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Obx(
                            () => IconButton(
                              onPressed: () {
                                if (_favouriteController.isFavorite.value) {
                                 
                                  _favouriteController.RemovefromFav(
                                    widget.MovieName.toString(),
                                    widget.posterImage.toString(),
                                    widget.rating,
                                  );
                                   _favouriteController.isFavorite.value = false;
                                  Get.snackbar(
                                    'Success',
                                    ' removed from Fav',
                                    duration: Duration(seconds: 1),
                                    snackPosition: SnackPosition.BOTTOM,
                                  );
                                } else {
                                
                                  _favouriteController.addToFavList(
                                    widget.MovieName.toString(),
                                    widget.posterImage.toString(),
                                    widget.rating,
                                  );
                                  Get.snackbar(
                                    'Success',
                                    ' added to Fav',
                                      duration: Duration(seconds: 1),
                                      snackPosition: SnackPosition.BOTTOM
                                  );
                                    _favouriteController.isFavorite.value = true;
                                }
                              },
                              icon: _favouriteController.FavouriteListImage
                                      .contains(widget.posterImage)
                                  ? Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    )
                                  : Icon(
                                      Icons.favorite_outline,
                                      // color: Colors.white,
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: ScreenSize.screenHeight(context) * .05,
                  ),
                  Container(
                    height: ScreenSize.screenWidth(context) * .07,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.release?.toString() ?? 'N/A',
                          style: GoogleFonts.aBeeZee(
                              fontWeight: FontWeight.w500,
                              // color: Colors.white,
                              fontSize: ScreenSize.screenWidth(context) * .05),
                        ),
                        Text(
                          (widget.rating != null &&
                                  double.tryParse(widget.rating.toString()) !=
                                      null
                              ? double.parse(widget.rating.toString())
                                  .toStringAsFixed(1)
                              : 'N/A'),
                          style: GoogleFonts.aBeeZee(
                            fontWeight: FontWeight.w500,
                            // color: Colors.white,
                            fontSize: ScreenSize.screenWidth(context) * 0.05,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: ScreenSize.screenWidth(context) * .07,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'release',
                          style: GoogleFonts.aBeeZee(
                              fontWeight: FontWeight.w500,
                              // color: Colors.white30,
                              fontSize: ScreenSize.screenWidth(context) * .05),
                        ),
                        Text(
                          'rating',
                          style: GoogleFonts.aBeeZee(
                              fontWeight: FontWeight.w500,
                              // color: Colors.white30,
                              fontSize: ScreenSize.screenWidth(context) * .05),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: ScreenSize.screenHeight(context) * .03,
                  ),
                  Text(
                    'Overview',
                    style: GoogleFonts.aBeeZee(
                        fontWeight: FontWeight.w500,
                        // color: Colors.white,
                        fontSize: ScreenSize.screenWidth(context) * .07),
                  ),
                  Text(
                    widget.overview?.toString() ?? 'N/A',
                    style: GoogleFonts.aBeeZee(
                        fontWeight: FontWeight.w400,
                        // color: Colors.white60,
                        fontSize: ScreenSize.screenWidth(context) * .05),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: ScreenSize.screenHeight(context) * .02,
          )
        ],
      )),
    );
  }
}
