import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Stack headerStack = Stack(
      alignment: Alignment.topCenter,
      children: const [
        Image(
          width: 600,
          height: 150,
          fit: BoxFit.fill,
          image: AssetImage("assets/images/spring-lake.jpg"),
        ),
        Padding(
          padding: EdgeInsets.only(top: 100),
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 47,
              backgroundImage: AssetImage("assets/images/black_cat.jpg"),
            ),
          ),
        ),
      ],
    );

    Padding personalDescription = Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        children: const [
          Text(
            "Black Panther",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(height: 8),
          Text(
            "Odio, ullam nostrum quae placeat adipisci sed temporibus quidem. Nam, natus libero?",
            style: TextStyle(color: Colors.black54),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );

    Padding editButtonsBar = Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ElevatedButton(
                onPressed: () => {}, child: const Text("Modifier le profil")),
          ),
          Container(width: 24),
          CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 16,
            child: IconButton(
              color: Colors.white,
              onPressed: () => {},
              icon: const Icon(
                Icons.edit,
                size: 16,
              ),
            ),
          )
        ],
      ),
    );

    Padding aboutMeSection = Padding(
      padding: const EdgeInsets.all(16),
      child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
        Text(
          "A propos de moi",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        AboutMeSectionRow(icon: Icons.home, text: "Ma cabane au Canada"),
        AboutMeSectionRow(icon: Icons.work, text: "Bûcheron au Sahara"),
        AboutMeSectionRow(icon: Icons.favorite, text: "Célibataire"),
      ]),
    );

    Column friendsSection = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Amis",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 140,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
            scrollDirection: Axis.horizontal,
            children: [
              for (var imageName in [
                "duck",
                "cat",
                "sunflower",
                "sitting_kitty"
              ])
                FriendTile(
                    title: imageName,
                    image: "assets/images/tuto/$imageName.jpg")
            ],
          ),
        )
      ],
    );

    var postsSection =
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          "Actualités",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      const SizedBox(height: 8),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const Post(
                posterImage: "assets/images/black_cat.jpg",
                posterName: "Black Panther",
                hoursSincePosted: 1,
                postImage: "assets/images/hintersee.jpg",
                description: "Just chilling on the lake!",
                likes: 7,
                comments: 2),
            const Post(
                posterImage: "assets/images/black_cat.jpg",
                posterName: "Black Panther",
                hoursSincePosted: 5,
                postImage: "assets/images/tuto/playa.jpg",
                description: "Working on my tan...",
                likes: 142,
                comments: 61),
            const Post(
                posterImage: "assets/images/black_cat.jpg",
                posterName: "Black Panther",
                hoursSincePosted: 12,
                postImage: "assets/images/tuto/carnaval.jpg",
                description: "Had a blast chasing all those lights!",
                likes: 192,
                comments: 23),
            const Post(
                posterImage: "assets/images/tuto/duck.jpg",
                posterName: "Duck Norris",
                hoursSincePosted: 18,
                postImage: "assets/images/tuto/mountain.jpg",
                description:
                    "Fresh air is cool but there are no ponds here, only frozen water... brrr",
                likes: 79,
                comments: 17),
          ],
        ),
      ),
    ]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Basics'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            headerStack,
            personalDescription,
            editButtonsBar,
            const Divider(),
            aboutMeSection,
            const Divider(),
            friendsSection,
            const Divider(),
            postsSection
          ],
        ),
      ),
    );
  }
}

class Post extends StatelessWidget {
  final String posterImage;
  final String posterName;
  final int hoursSincePosted;
  final String postImage;
  final String description;
  final int likes;
  final int comments;

  const Post(
      {Key? key,
      required this.posterImage,
      required this.posterName,
      required this.hoursSincePosted,
      required this.postImage,
      required this.description,
      required this.likes,
      required this.comments})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.grey[300],
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                              radius: 16,
                              backgroundImage: AssetImage(
                                posterImage,
                              )),
                          const SizedBox(width: 8),
                          Text(posterName),
                        ],
                      ),
                      Text("Il y a $hoursSincePosted heures")
                    ]),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 200,
                  width: 600,
                  child: Image(
                    image: AssetImage(postImage),
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
                            color: Colors.grey[400],
                            child: Text(
                              description,
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.black87),
                            ),
                          ),
                        )
                      ],
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.favorite, color: Colors.red),
                        const SizedBox(width: 4),
                        Text("$likes")
                      ],
                    ),
                    SizedBox(
                        width: 55,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(Icons.message, color: Colors.blue),
                            const SizedBox(width: 4),
                            Text("$comments")
                          ],
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class FriendTile extends StatelessWidget {
  final String image;
  final String title;

  const FriendTile({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Column(children: [
          Container(
            width: 100,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.grey,
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(height: 4),
          Text(title)
        ]));
  }
}

class AboutMeSectionRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const AboutMeSectionRow({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Icon(icon), Container(width: 4), Text(text)],
    );
  }
}
