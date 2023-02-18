import 'dart:math';

import 'package:djhackathon/backend/database/comment.dart';
import 'package:djhackathon/backend/database/spotlight.dart';
import 'package:djhackathon/backend/functions/fun.dart';
import 'package:djhackathon/frontend/components/custom_text_field.dart';
import 'package:djhackathon/size.dart';
import 'package:djhackathon/theme.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class NewsBody extends StatefulWidget {
  const NewsBody({super.key, required this.spots});
  final Spots spots;

  @override
  State<NewsBody> createState() => _NewsBodyState();
}

class _NewsBodyState extends State<NewsBody> {
  bool isReady = false;
  List<Comment> comments = [];
  late FirebaseDatabase database = FirebaseDatabase.instance;
  late Fun fun;
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    fun = Fun(database);
    database
        .ref("news/${widget.spots.cat}/${widget.spots.title}/comments")
        .get()
        .then((value) {
      print("Here:");
      // String name = "", date = "", message = "", photo = "";
      // print(value.children.first.value);
      // int i = 0;
      print(value.children.length);
      if (value.children.isEmpty) {
        setState(() {
          isReady = true;
        });
      }
      // for (var element in value.children) {
      //   i = 0;
      //   for (var data in element.children) {
      //     print(data.value);
      //     // if (i == 0) {
      //     //   date = data.value.toString();
      //     // } else if (i == 1) {
      //     //   name = data.value.toString();
      //     // } else if (i == 2) {
      //     //   photo = data.value.toString();
      //     // } else if (i == 3) {
      //     //   message = data.value.toString();
      //     // }
      //     i++;
      //   }
      //   // comments.add(Comment(name, message, photo, date));
      // }

      // setState(() {
      //   isReady = true;
      // });
    });

    database
        .ref("news/${widget.spots.cat}/${widget.spots.id}/comments")
        .onChildAdded
        .listen((event) {
      // print(event.snapshot.child("message").value);
      setState(() {
        if (!isReady) isReady = true;
        comments.add(
          Comment(
            event.snapshot.child("name").value.toString(),
            event.snapshot.child("message").value.toString(),
            event.snapshot.child("photo").value.toString(),
            event.snapshot.child("date").value.toString(),
          ),
        );
      });
    });
    super.initState();
  }

  void addComment(String message) {
    controller.clear();
    DateTime dateTime = DateTime.now();
    Map<String, dynamic> comment = {
      "message": message,
      "name": GetStorage().read("name"),
      "photo": GetStorage().read("photo"),
      "date": "${dateTime.day}/${dateTime.month}/${dateTime.year}",
    };
    fun.pushData(
        "news/${widget.spots.cat}/${widget.spots.id}/comments", comment);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Pallete pallete = Pallete(context);
    return isReady
        ? Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: SizeConfig.width,
                      height: getWidth(400),
                      child: Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          Positioned(
                            top: 0,
                            child: Container(
                              width: SizeConfig.width,
                              height: getWidth(400),
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                color: pallete.primaryDark().withOpacity(0.7),
                                // borderRadius: BorderRadius.circular(20),
                              ),
                              child: Stack(
                                fit: StackFit.expand,
                                alignment: AlignmentDirectional.bottomCenter,
                                children: [
                                  ClipRRect(
                                    child: Image.network(
                                      widget.spots.img,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: FractionalOffset.topCenter,
                                        end: FractionalOffset.bottomCenter,
                                        colors: [
                                          Colors.transparent,
                                          Colors.black.withOpacity(0.1),
                                          Colors.black.withOpacity(0.2),
                                          Colors.black.withOpacity(0.3),
                                          Colors.black.withOpacity(0.8),
                                          Colors.black.withOpacity(0.9),
                                        ],
                                        stops: const [
                                          0.0,
                                          0.2,
                                          0.3,
                                          0.4,
                                          0.8,
                                          0.9,
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Positioned(
                                    top: 0,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        borderRadius: BorderRadius.circular(17),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: pallete.primaryDark(),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(6),
                                            child: Icon(
                                              Icons.arrow_back_ios_new_rounded,
                                              color: pallete.background(),
                                              size: getWidth(20),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Text(
                                  widget.spots.title,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                  style: TextStyle(
                                    color: pallete.background(),
                                    fontSize: getWidth(30),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TopBar(
                            pallete: pallete,
                            spots: widget.spots,
                          ),
                          SizedBox(height: getWidth(20)),
                          Text(
                            "About",
                            style: TextStyle(
                              color: pallete.primaryDark(),
                              fontSize: getWidth(22),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: getWidth(10)),
                          Text(
                            widget.spots.desc,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                            style: TextStyle(
                              color: pallete.primaryDark(),
                              fontSize: getWidth(14),
                            ),
                          ),
                          SizedBox(height: getWidth(20)),
                          Text(
                            "Comments",
                            style: TextStyle(
                              color: pallete.primaryDark(),
                              fontSize: getWidth(16),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: getWidth(10)),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.network(
                                  GetStorage().read("photo"),
                                  width: getWidth(50),
                                ),
                              ),
                              SizedBox(width: getWidth(10)),
                              Expanded(
                                child: SizedBox(
                                  height: getWidth(40),
                                  child: CustomTextField(
                                    onChanged: addComment,
                                    controller: controller,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: getWidth(20)),
                          ...List.generate(
                            comments.length,
                            (index) => CommentCard(
                              pallete: pallete,
                              index: index,
                              length: comments.length,
                              comment: comments[index],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : Center(
            child: CircularProgressIndicator(color: pallete.primary()),
          );
  }
}

class CommentCard extends StatelessWidget {
  const CommentCard({
    Key? key,
    required this.pallete,
    required this.index,
    required this.length,
    required this.comment,
  }) : super(key: key);

  final Pallete pallete;
  final int index, length;
  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.network(
                comment.photo,
                width: getWidth(50),
              ),
            ),
            SizedBox(width: getWidth(10)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        comment.name,
                        style: TextStyle(
                          color: pallete.primaryDark(),
                          fontSize: getWidth(14),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        comment.date,
                        style: TextStyle(
                          color: pallete.primaryDark(),
                          fontSize: getWidth(14),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: getWidth(5)),
                  Text(
                    comment.message,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: pallete.primaryDark(),
                      fontSize: getWidth(14),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        if (index != length - 1) SizedBox(height: getWidth(20)),
      ],
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
    required this.pallete,
    required this.spots,
  }) : super(key: key);

  final Pallete pallete;
  final Spots spots;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            color: pallete.primary().withOpacity(0.3),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            child: Text(
              spots.author,
              style: TextStyle(
                  color: pallete.primaryDark(), fontSize: getHeight(12)),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: pallete.primary().withOpacity(0.3),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.timelapse_rounded,
                  size: getWidth(20),
                ),
                SizedBox(width: getWidth(5)),
                Text(
                  DateFormat.jm().format(spots.time).toLowerCase(),
                  style: TextStyle(
                    color: pallete.primaryDark(),
                    fontSize: getHeight(12),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: pallete.primary().withOpacity(0.3),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.remove_red_eye_rounded,
                  size: getWidth(20),
                ),
                SizedBox(width: getWidth(5)),
                Text(
                  "${Random().nextInt(500 + 2)} Views",
                  style: TextStyle(
                    color: pallete.primaryDark(),
                    fontSize: getHeight(12),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
