import 'dart:math';

import 'package:behance_clone/detail_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const types = [
  'Ph',
  'Gr',
  'UI',
];

class PostWidget extends StatelessWidget {
  const PostWidget(
      {Key? key,
      required this.index,
      required this.userName,
      required this.title})
      : super(key: key);

  final int index;
  final String userName;
  final String title;
  @override
  Widget build(BuildContext context) {
    final type = types[Random().nextInt(types.length)];
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => DetailPage(
                    image: 'https://picsum.photos/${800 + index}',
                    userName: userName,
                    profile: 'https://picsum.photos/${80 + index}',
                    title: title,
                    type: type,
                  )),
        );
      },
      child: Container(
        height: 350,
        margin: const EdgeInsets.only(
          bottom: 15,
          left: 4,
          right: 4,
        ),
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                offset: const Offset(2, 2),
                blurRadius: 6,
                spreadRadius: 0,
              )
            ]),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl: 'https://picsum.photos/${800 + index}',
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                      Positioned(
                        right: 20,
                        child: SizedBox(
                          height: 100,
                          width: 33,
                          child: Stack(
                            children: [
                              Container(
                                width: 26,
                                height: 30,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              Positioned(
                                right: 0,
                                top: 20,
                                child: Icon(
                                  CupertinoIcons.bookmark_fill,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  size: 40,
                                ),
                              ),
                              Positioned(
                                bottom: 55,
                                left: 7,
                                child: Text(
                                  type,
                                  style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 14,
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 10,
                        backgroundImage: CachedNetworkImageProvider(
                            'https://picsum.photos/${80 + index}'),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        userName,
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
