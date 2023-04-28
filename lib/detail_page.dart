import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    Key? key,
    required this.image,
    required this.userName,
    required this.profile,
    required this.title,
    required this.type,
  }) : super(key: key);

  final String image;
  final String userName;
  final String profile;
  final String title;
  final String type;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final controller = ScrollController();
  bool isTop = true;
  bool isScrollDown = false;

  final projectDesc = Faker().lorem.sentence();
  final commentNick = [
    Faker().internet.userName(),
    Faker().internet.userName(),
    Faker().internet.userName()
  ];
  final comments = [
    Faker().lorem.word(),
    Faker().lorem.word(),
    Faker().lorem.word()
  ];
  final commentDate = [
    Random().nextInt(10) + 1,
    Random().nextInt(10) + 1,
    Random().nextInt(10) + 1,
  ];
  final commentCount = Random().nextInt(50) + 1;

  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        if (controller.position.userScrollDirection ==
            ScrollDirection.forward) {
          isScrollDown = false;
        } else {
          isScrollDown = true;
        }
        if (controller.position.pixels > 10) {
          isTop = false;
        } else {
          isTop = true;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: controller,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 60,
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
                                bottom: 13,
                                left: 7,
                                child: Text(
                                  widget.type,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.title,
                              style: GoogleFonts.roboto(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Icon(
                              Icons.more_vert,
                              size: 26,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 14,
                                  backgroundImage: CachedNetworkImageProvider(
                                      widget.profile),
                                ),
                                const SizedBox(
                                  width: 14,
                                ),
                                Text(
                                  widget.userName,
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                ),
                                borderRadius: BorderRadius.circular(35),
                              ),
                              child: Text(
                                'Follow All',
                                style: GoogleFonts.roboto(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 12,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  ),
                  CachedNetworkImage(imageUrl: widget.image),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return CachedNetworkImage(
                            imageUrl: 'https://picsum.photos/${801 + index}');
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Divider(),
                        Text(
                          widget.title,
                          style: GoogleFonts.roboto(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.thumb_up,
                                  size: 12,
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  Random().nextInt(100).toString(),
                                  style: GoogleFonts.roboto(
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                const Icon(
                                  CupertinoIcons.eye_fill,
                                  size: 12,
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  Random().nextInt(100).toString(),
                                  style: GoogleFonts.roboto(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '${(Random().nextInt(30) + 1).toString().padLeft(2, '0')}/${(Random().nextInt(12) + 1).toString().padLeft(2, '0')}/2023',
                              style: GoogleFonts.roboto(),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(projectDesc),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'View Project Info',
                          style: GoogleFonts.roboto(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Divider(),
                        const SizedBox(
                          height: 15,
                        ),
                        Column(
                          children: List.generate(
                              3,
                              (index) => Padding(
                                    padding: const EdgeInsets.only(bottom: 14),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 12,
                                          backgroundImage:
                                              CachedNetworkImageProvider(
                                            'https://picsum.photos/${80 + index}',
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          commentNick[index],
                                          style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          comments[index],
                                          style: GoogleFonts.roboto(),
                                        ),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          '${commentDate[index]}m',
                                          style: GoogleFonts.roboto(
                                            color: Colors.grey[400],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'View All Comments ($commentCount)',
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 8,
                            ),
                            hintText: 'Leave a Comment',
                            hintStyle: GoogleFonts.roboto(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                  color: Colors.black, width: 0.6),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'More Projects by ${widget.userName} others',
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                            ),
                            itemCount: 6,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 1,
                                      spreadRadius: 0,
                                      offset: Offset(0, 2),
                                    )
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(3),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        'https://picsum.photos/${300 + index}',
                                  ),
                                ),
                              );
                            }),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                ],
              ),
            ),
            Positioned.fill(
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      opacity: isScrollDown ? 0 : 1,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.person_add,
                              size: 20,
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Icon(
                              Icons.ios_share,
                              size: 20,
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Icon(
                              Icons.folder,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      child: const Icon(
                        Icons.thumb_up,
                        color: Colors.white,
                        size: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: isTop ? 0 : 1,
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.grey.withOpacity(0.5),
                      child: const Icon(
                        Icons.clear,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
