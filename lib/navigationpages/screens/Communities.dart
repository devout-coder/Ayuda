import 'dart:math';

import 'package:csi_hackathon/navigationpages/screens/chat.dart';
import 'package:csi_hackathon/states.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class Chat {
  final String name, lastMessage, image, time;
  final bool isActive;

  Chat({
    this.name = '',
    this.lastMessage = '',
    this.image = '',
    this.time = '',
    this.isActive = false,
  });
}

List<ChatMessage> chatMessages = [
  ChatMessage(
    messageContent: "Jordan Peterson' latest video is cool",
    messageType: "receiver",
  ),
  ChatMessage(
    messageContent: "I really love his content, he spits out facts",
    messageType: "receiver",
  ),
  ChatMessage(
    messageContent: "The latest one?",
    messageType: "sender",
  ),
  ChatMessage(
    messageContent: "Yeah",
    messageType: "receiver",
  ),
];

List chatsData = [
  Chat(
    name: "Mindfull Green",
    lastMessage: "Yeah",
    image: "assets/images/user.png",
    time: "3m ago",
    isActive: false,
  ),
  Chat(
    name: "How Mental",
    lastMessage: "Hello Abdullah! I am...",
    image: "assets/images/user_2.png",
    time: "8m ago",
    isActive: true,
  ),
  Chat(
    name: "Focus Learners",
    lastMessage: "Do you have update...",
    image: "assets/images/user_3.png",
    time: "5d ago",
    isActive: false,
  ),
  Chat(
    name: "no need",
    lastMessage: "You’re welcome :)",
    image: "assets/images/user_4.png",
    time: "5d ago",
    isActive: true,
  ),
  Chat(
    name: "soyouwanttotalkabout",
    lastMessage: "Thanks",
    image: "assets/images/user_5.png",
    time: "6d ago",
    isActive: false,
  ),
];

enum ChatMessageType { text, audio, image, video }

enum MessageStatus { not_sent, not_view, viewed }

// class ChatMessage {
//   final String text;
//   final ChatMessageType messageType;
//   final MessageStatus messageStatus;
//   final bool isSender;

//   ChatMessage({
//     this.text = '',
//     required this.messageType,
//     required this.messageStatus,
//     required this.isSender,
//   });
// }

// List demeChatMessages = [
//   ChatMessage(
//     text: "Hi Sajol,",
//     messageType: ChatMessageType.text,
//     messageStatus: MessageStatus.viewed,
//     isSender: false,
//   ),
//   ChatMessage(
//     text: "Hello, How are you?",
//     messageType: ChatMessageType.text,
//     messageStatus: MessageStatus.viewed,
//     isSender: true,
//   ),
//   ChatMessage(
//     text: "",
//     messageType: ChatMessageType.audio,
//     messageStatus: MessageStatus.viewed,
//     isSender: false,
//   ),
//   ChatMessage(
//     text: "",
//     messageType: ChatMessageType.video,
//     messageStatus: MessageStatus.viewed,
//     isSender: true,
//   ),
//   ChatMessage(
//     text: "Error happend",
//     messageType: ChatMessageType.text,
//     messageStatus: MessageStatus.not_sent,
//     isSender: true,
//   ),
//   ChatMessage(
//     text: "This looks great man!!",
//     messageType: ChatMessageType.text,
//     messageStatus: MessageStatus.viewed,
//     isSender: false,
//   ),
//   ChatMessage(
//     text: "Glad you like it",
//     messageType: ChatMessageType.text,
//     messageStatus: MessageStatus.not_view,
//     isSender: true,
//   ),
// ];

class ChatInputField extends StatelessWidget {
  const ChatInputField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(186, 229, 244, 1),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 32,
              color: Colors.grey.withOpacity(0.08)),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  children: const [
                    Icon(
                      Icons.sentiment_satisfied_alt_outlined,
                      color: Color.fromRGBO(8, 8, 38, 1),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Type Message",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Icon(
                      Icons.mic,
                      color: Color.fromRGBO(8, 8, 38, 1),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Boody extends StatefulWidget {
  Function reload;
  Boody({super.key, required this.reload});

  @override
  State<Boody> createState() => _BoodyState();
}

class _BoodyState extends State<Boody> {
  ScrollController _mainController = ScrollController();
  late TextEditingController _controller;
  States states = GetIt.I.get();

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.8,
          child: SingleChildScrollView(
            controller: _mainController,
            child: ListView.builder(
              itemCount: chatMessages.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 10, bottom: 10),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return DelayedDisplay(
                  slidingBeginOffset: Offset(0.2, 0),
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 14, right: 14, top: 10, bottom: 10),
                    child: Align(
                      alignment: (chatMessages[index].messageType == "receiver"
                          ? Alignment.topLeft
                          : Alignment.topRight),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: (chatMessages[index].messageType == "receiver"
                              ? Colors.grey.shade200
                              : Colors.blue[200]),
                        ),
                        padding: EdgeInsets.all(16),
                        child: Text(
                          chatMessages[index].messageContent,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'EuclidCircular',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(35)),
              color: Colors.white,
            ),
            margin: EdgeInsets.only(bottom: 15),
            padding: EdgeInsets.only(left: 5, bottom: 5, top: 10),
            height: 50,
            width: MediaQuery.of(context).size.width * 0.95,
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'EuclidCircular',
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                        hintText: "Write message...",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                FloatingActionButton(
                  onPressed: () async {
                    String query = _controller.text;
                    _controller.text = "";
                    ChatMessage newMessage = ChatMessage(
                        messageContent: query, messageType: "sender");
                    List<ChatMessage> newMessages = [
                      ...chatMessages,
                      newMessage
                    ];
                    setState(() {
                      chatMessages = newMessages;
                    });
                    _mainController.animateTo(
                        _mainController.position.maxScrollExtent,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);
                    FocusManager.instance.primaryFocus?.unfocus();
                    states.lastMessage = query;
                    widget.reload();
                    debugPrint("updated: ${states.lastMessage}");
                  },
                  child: Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 18,
                  ),
                  backgroundColor: Colors.blue,
                  elevation: 0,
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}

// class TextMessage extends StatelessWidget {
//   const TextMessage({
//     super.key,
//     required this.message,
//   });
//   final ChatMessage message;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(top: 16),
//       padding: const EdgeInsets.symmetric(horizontal: 16 * 0.75, vertical: 8),
//       decoration: BoxDecoration(
//         color: const Color.fromRGBO(8, 8, 38, 1)
//             .withOpacity(message.isSender ? 1 : 0.88),
//         borderRadius: BorderRadius.circular(30),
//       ),
//       child: Text(message.text,
//           style: TextStyle(
//               color: message.isSender
//                   ? Colors.white
//                   : const Color.fromRGBO(226, 210, 254, 1))),
//     );
//   }
// }

// class AudioMessage extends StatelessWidget {
//   final ChatMessage? message;

//   const AudioMessage({Key? key, this.message}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width * 0.55,
//       padding: const EdgeInsets.symmetric(
//         horizontal: 5 * 0.75,
//         vertical: 10,
//       ),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(30),
//         color: Colors.green.withOpacity(message!.isSender ? 1 : 0.1),
//       ),
//       child: Row(
//         children: [
//           Icon(
//             Icons.play_arrow,
//             color: message!.isSender
//                 ? Colors.white
//                 : const Color.fromRGBO(8, 8, 38, 1),
//           ),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 5),
//               child: Stack(
//                 clipBehavior: Clip.none,
//                 alignment: Alignment.center,
//                 children: [
//                   Container(
//                     width: double.infinity,
//                     height: 2,
//                     color: message!.isSender
//                         ? Colors.white
//                         : Colors.green.withOpacity(0.4),
//                   ),
//                   Positioned(
//                     left: 0,
//                     child: Container(
//                       height: 8,
//                       width: 8,
//                       decoration: BoxDecoration(
//                         color: message!.isSender ? Colors.white : Colors.green,
//                         shape: BoxShape.circle,
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Text(
//             "0.37",
//             style: TextStyle(
//                 fontSize: 12, color: message!.isSender ? Colors.white : null),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class VideoMessage extends StatelessWidget {
//   const VideoMessage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: MediaQuery.of(context).size.width * 0.45, // 45% of total width
//       child: AspectRatio(
//         aspectRatio: 1.6,
//         child: Stack(
//           alignment: Alignment.center,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(8),
//               child: Image.asset(""),
//             ),
//             Container(
//               height: 25,
//               width: 25,
//               decoration: const BoxDecoration(
//                 color: Colors.green,
//                 shape: BoxShape.circle,
//               ),
//               child: const Icon(
//                 Icons.play_arrow,
//                 size: 16,
//                 color: Colors.white,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Message extends StatelessWidget {
//   const Message({
//     Key? key,
//     required this.message,
//   }) : super(key: key);

//   final ChatMessage message;

//   @override
//   Widget build(BuildContext context) {
//     Widget messageContaint(ChatMessage message) {
//       switch (message.messageType) {
//         case ChatMessageType.text:
//           return TextMessage(message: message);
//         case ChatMessageType.audio:
//           return AudioMessage(message: message);
//         case ChatMessageType.video:
//           return const VideoMessage();
//         default:
//           return const SizedBox();
//       }
//     }

//     return Padding(
//       padding: const EdgeInsets.only(top: 10),
//       child: Row(
//         mainAxisAlignment:
//             message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
//         children: [
//           if (!message.isSender) ...[
//             const CircleAvatar(
//               radius: 12,
//               backgroundImage: AssetImage("assets/images/user_2.png"),
//             ),
//             const SizedBox(width: 5),
//           ],
//           messageContaint(message),
//           if (message.isSender) MessageStatusDot(status: message.messageStatus)
//         ],
//       ),
//     );
//   }
// }

// class MessageStatusDot extends StatelessWidget {
//   final MessageStatus? status;

//   const MessageStatusDot({Key? key, this.status}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     Color dotColor(MessageStatus status) {
//       switch (status) {
//         case MessageStatus.not_sent:
//           return Colors.black;
//         case MessageStatus.not_view:
//           return Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.1);
//         case MessageStatus.viewed:
//           return Colors.yellow;
//         default:
//           return Colors.transparent;
//       }
//     }

//     return Container(
//       margin: const EdgeInsets.only(left: 5),
//       height: 12,
//       width: 12,
//       decoration: BoxDecoration(
//         color: dotColor(status!),
//         shape: BoxShape.circle,
//       ),
//       child: Icon(
//         status == MessageStatus.not_sent ? Icons.close : Icons.done,
//         size: 8,
//         color: Theme.of(context).scaffoldBackgroundColor,
//       ),
//     );
//   }
// }

// class FillOutlineButton extends StatelessWidget {
//   const FillOutlineButton({
//     Key? key,
//     this.isFilled = true,
//     required this.press,
//     required this.text,
//   }) : super(key: key);

//   final bool isFilled;
//   final VoidCallback press;
//   final String text;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialButton(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(30),
//         side: const BorderSide(color: Color.fromRGBO(186, 229, 244, 1)),
//       ),
//       elevation: isFilled ? 2 : 0,
//       color: const Color.fromRGBO(8, 8, 38, 1),
//       onPressed: press,
//       child: Text(
//         text,
//         style: const TextStyle(
//           color: Colors.white,
//           fontSize: 12,
//         ),
//       ),
//     );
//   }
// }

class MessagesScreen extends StatefulWidget {
  Function reload;
  MessagesScreen({super.key, required this.reload});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xffA88BEB), Color(0xffF8CEEC)],
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          // shadowColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              const BackButton(),
              const SizedBox(
                width: 4,
              ),
              const CircleAvatar(
                backgroundImage: AssetImage(""),
              ),
              const SizedBox(width: 16 * 0.75),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Mindfull Green",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'EuclidCircular',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        "19 active ",
                        style: TextStyle(
                            color: Color.fromARGB(255, 205, 205, 205),
                            fontSize: 10,
                            fontFamily: "EuclidCircular"),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          actions: [
            IconButton(icon: const Icon(Icons.videocam), onPressed: () {}),
            const SizedBox(width: 8),
          ],
        ),
        backgroundColor: Colors.transparent,
        body: Boody(reload: widget.reload),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromRGBO(186, 229, 244, 1),
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          const BackButton(),
          const SizedBox(
            width: 4,
          ),
          const CircleAvatar(
            backgroundImage: AssetImage(""),
          ),
          const SizedBox(width: 16 * 0.75),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Mindfull Green",
                style: TextStyle(fontSize: 16),
              ),
              Row(
                children: [
                  const Text(
                    "no.of people active ",
                    style: TextStyle(fontSize: 7),
                  ),
                  Container(
                    height: 14,
                    width: 14,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.greenAccent),
                    child: const Text(
                      "19",
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
      actions: [
        IconButton(icon: const Icon(Icons.videocam), onPressed: () {}),
        const SizedBox(width: 8),
      ],
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  void reload() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: const BoxDecoration(
      //   gradient: LinearGradient(
      //     begin: Alignment.topLeft,
      //     end: Alignment.bottomRight,
      //     colors: [
      //       // Color.fromARGB(255, 216, 216, 216),
      //       // Color.fromARGB(255, 215, 215, 255),
      //       // Color.fromARGB(255, 196, 196, 255),
      //       Color(0xffA88BEB),
      //       Color(0xffF8CEEC)
      //     ],
      //   ),
      // ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
                      shape: StadiumBorder(),
                      backgroundColor: Colors.black),
                  child: Text(
                    "Recent Messages",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontFamily: 'EuclidCircular',
                    ),
                  ),
                ),
                // FillOutlineButton(
                //   press: () {},
                //   text: "Recent Message",
                // ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
                      shape: StadiumBorder(),
                      backgroundColor: Colors.black),
                  child: Text(
                    "Active",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontFamily: 'EuclidCircular',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: chatsData.length,
              itemBuilder: (context, index) => ChatCard(
                index: index,
                chat: chatsData[index],
                press: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MessagesScreen(reload: () {
                      reload();
                    }),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatCard extends StatefulWidget {
  ChatCard({
    super.key,
    required this.chat,
    required this.press,
    required this.index,
  });
  final Chat chat;
  int index;
  final VoidCallback press;

  @override
  State<ChatCard> createState() => _ChatCardState();
}

class _ChatCardState extends State<ChatCard> {
  States states = GetIt.I.get();

  @override
  void initState() {
    debugPrint(states.lastMessage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.press,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16 * 0.75),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 24,
              //backgroundImage: AssetImage(chat.image),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.chat.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'EuclidCircular',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Opacity(
                      opacity: 0.7,
                      child: Text(
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'EuclidCircular',
                          fontWeight: FontWeight.w400,
                        ),
                        widget.index != 0
                            ? widget.chat.lastMessage
                            : states.lastMessage,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Opacity(opacity: 0.7, child: Text(widget.chat.time)),
          ],
        ),
      ),
    );
  }
}

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: buildAppBar(),
      body: Body(),
      backgroundColor: Colors.transparent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(8, 8, 38, 1),
        onPressed: () {},
        child: const Icon(
          Icons.person_add_alt_1,
          color: Color.fromRGBO(226, 210, 254, 1),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      elevation: 0.0,
      title: const Text(
        "Community",
        style: TextStyle(
          fontSize: 22,
          fontFamily: 'EuclidCircular',
          fontWeight: FontWeight.w600,
          color: Color.fromRGBO(
            8,
            8,
            8,
            1,
          ),
        ),
      ),
      actions: [
        IconButton(
          color: const Color.fromRGBO(
            8,
            8,
            38,
            1,
          ),
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
      ],
    );
  }
}
