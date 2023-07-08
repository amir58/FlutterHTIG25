import 'package:flutter/material.dart';
import 'package:flutter25/blog/add_blog_screen.dart';
import 'package:flutter25/blog/blog.dart';
import 'package:flutter25/blog/edit_blog_screen.dart';
import 'package:flutter25/blog/story_view_screen.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({Key? key}) : super(key: key);

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  final String imageUrl =
      "https://blog.logrocket.com/wp-content/uploads/2021/05/intro-dart-flutter-feature.png";

  final String name = "Amir Mohammed";

  List<Blog> blogs = [
    Blog(
      title: "Piano",
      content:
          "a large keyboard musical instrument with a wooden case enclosing a soundboard and metal strings, which are struck by hammers when the keys are depressed. The strings' vibration is stopped by dampers when the keys are released and can be regulated for length and volume by two or three pedals.",
      imageUrl:
          "https://cdn1.img.sputnikarabic.ae/img/104012/71/1040127161_0:171:4032:2439_600x0_80_0_0_bf877107b21a7dab90c7ce76c503464d.jpg",
    ), // 0
    Blog(
      title: "Titanic submarine",
      content:
          "Missing Titanic submarine LIVE: Can bodies be retrieved after implosion? Experts weigh in",
      imageUrl:
          "https://phantom-marca.unidadeditorial.es/e78616bbda77fe6fbc6b1ed5a05d3232/resize/828/f/webp/assets/multimedia/imagenes/2023/06/21/16873550466244.png",
    ), // 1
    Blog(
      title: "Customization Cars",
      content:
          "Two Customized Cars Rolling Through A City Street Photo Photo of two customized cars on a city side street. One car is raised up and the other is very low.",
      imageUrl:
          "https://burst.shopifycdn.com/photos/two-customized-cars-rolling-through-a-city-street.jpg",
    ), // 2
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Blog"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => navigateToAddBlogScreen(),
        backgroundColor: blogs.length < 2 ? Colors.blueGrey : Colors.white,
        child: Icon(
          Icons.add,
          color: blogs.length < 2 ? Colors.white : Colors.blueGrey,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
            child: ListView.builder(
              itemCount: 8,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => navigateToStoryViewScreen(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(imageUrl),
                            ),
                            const CircleAvatar(
                              radius: 11,
                              backgroundColor: Colors.white,
                            ),
                            const CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.green,
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Text(name.length > 7
                            ? "${name.substring(0, 7)}..."
                            : name),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: blogs.length,
              itemBuilder: (context, index) {
                return blogItem(index);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget blogItem(int index) {
    final blog = blogs[index];

    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.blueGrey,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(25),
              topLeft: Radius.circular(25),
            ),
            child: Image.network(
              blog.imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    blog.title,
                    style: const TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                IconButton(
                  onPressed: () => navigateToEditBlogScreen(index),
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    blogs.removeAt(index);
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              blog.content,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }

  navigateToAddBlogScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddBlogScreen(),
      ),
    ).then((value) {
      print(value);
      blogs.add(value);
      setState(() {});
    });
  }

  navigateToEditBlogScreen(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditBlogScreen(
          title: blogs[index].title,
          content: blogs[index].content,
          imageUrl: blogs[index].imageUrl,
        ),
      ),
    ).then((value) {
      print(value);
      // blogs.add(value);
      blogs[index] = value;
      setState(() {});
    });
  }

  navigateToStoryViewScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const StoryViewScreen(),
      ),
    );
  }
}
