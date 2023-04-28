import 'package:behance_clone/widgets/post_widget.dart';
import 'package:behance_clone/widgets/story_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        height: 100,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return StoryWidget(index: index);
                              }),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return PostWidget(
                                index: index,
                                userName: Faker().internet.userName(),
                                title: Faker().lorem.word());
                          })
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: Icon(
                      Icons.home_filled,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const Expanded(
                    child: Icon(
                      FontAwesomeIcons.magnifyingGlass,
                      color: Colors.black,
                    ),
                  ),
                  const Expanded(
                    child: Icon(
                      Icons.live_tv,
                      color: Colors.black,
                    ),
                  ),
                  const Expanded(
                    child: Icon(
                      CupertinoIcons.bell_fill,
                      color: Colors.black,
                    ),
                  ),
                  const Expanded(
                    child: CircleAvatar(
                      radius: 15,
                      backgroundImage: CachedNetworkImageProvider(
                          'https://picsum.photos/100'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
