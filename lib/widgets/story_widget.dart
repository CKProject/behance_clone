import 'package:cached_network_image/cached_network_image.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StoryWidget extends StatelessWidget {
  const StoryWidget({Key? key, required this.index}) : super(key: key);

  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: SizedBox(
        width: 62,
        child: Column(
          children: [
            CircleAvatar(
              radius: 31,
              backgroundColor:
                  index == 0 ? Colors.white : Theme.of(context).primaryColor,
              child: CircleAvatar(
                radius: 29.5,
                backgroundColor: index == 0 ? Colors.black : Colors.white,
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: index == 0 ? Colors.black : null,
                  backgroundImage: index == 0
                      ? null
                      : CachedNetworkImageProvider(
                          'https://picsum.photos/12$index',
                        ),
                  child: index == 0
                      ? const Icon(
                          Icons.camera_alt_rounded,
                          color: Colors.white,
                        )
                      : null,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              index == 0 ? '+ add' : Faker().internet.userName(),
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w300,
                fontSize: 12,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
