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

List chatsData = [
  Chat(
    name: "Mindfull Green",
    lastMessage: "Hope you are doing well...",
    image: "assets/mindfullGreen.png",
    time: "3m ago",
    isActive: false,
  ),
  Chat(
    name: "How Mental",
    lastMessage: "Hello Abdullah! I am...",
    image: "assets/howMental.png",
    time: "8m ago",
    isActive: true,
  ),
  Chat(
    name: "Self care is a priority",
    lastMessage: "Do you have update...",
    image: "assets/selfCare.png",
    time: "5d ago",
    isActive: false,
  ),
  Chat(
    name: "no need",
    lastMessage: "You’re welcome :)",
    image: "assets/noNeed.png",
    time: "5d ago",
    isActive: true,
  ),
  Chat(
    name: "soyouwanttotalkabout",
    lastMessage: "Thanks",
    image: "assets/talkAbout.png",
    time: "6d ago",
    isActive: false,
  ),
  Chat(
    name: "Foodies",
    lastMessage: "wanna know best burger joints?",
    image: "assets/foodies.png",
    time: "3m ago",
    isActive: false,
  ),
  Chat(
    name: "group of 3",
    lastMessage: "Did you see that...",
    image: "assets/friends.png",
    time: "8m ago",
    isActive: true,
  ),
  Chat(
    name: "besties",
    lastMessage: "i have to go.....",
    image: "assets/besties.png",
    time: "5m ago",
    isActive: false,
  ),
];
