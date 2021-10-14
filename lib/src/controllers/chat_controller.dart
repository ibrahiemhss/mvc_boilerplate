// @dart=2.9
import 'package:mvc_boilerplate/src/di/locators/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../generated/l10n.dart';
import '../models/chat.dart';
import '../models/conversation.dart';
import 'package:mvc_boilerplate/src/data/repository/chat_repository.dart';
import 'package:mvc_boilerplate/src/data/repository/notification_repository.dart';
import 'package:mvc_boilerplate/src/data/repository/user_repository.dart';

class ChatController extends ControllerMVC {
  Conversation conversation;
  ChatRepository _chatRepository;
  Stream<QuerySnapshot> conversations;
  Stream<QuerySnapshot> chats;
  GlobalKey<ScaffoldState> scaffoldKey;
  NotificationRepository notificationRepo = getIt<NotificationRepository>();

  ChatController() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
    _chatRepository = new ChatRepository();
    _createConversation(conversation);
  }

  signIn() {
    _chatRepository.signUpWithEmailAndPassword(currentUser.value.email, currentUser.value.apiToken);
    _chatRepository.signInWithToken(currentUser.value.apiToken);
  }

  _createConversation(Conversation _conversation) async {
    _conversation.lastMessageTime = DateTime.now().toUtc().millisecondsSinceEpoch;
    _conversation.readByUsers = [currentUser.value.id];
    setState(() {
      conversation = _conversation;
    });
    _chatRepository.createConversation(conversation).then((value) {
      listenForChats(conversation);
    });
  }

  listenForConversations() async {
    _chatRepository
        .getUserConversations(currentUser.value.id)
        .then((snapshots) {
      setState(() {
        conversations = snapshots;
      });
    });
  }

  listenForChats(Conversation _conversation) async {
    _conversation.readByUsers.add(currentUser.value.id);
    _chatRepository.getChats(_conversation).then((snapshots) {
      setState(() {
        chats = snapshots;
      });
    });
  }

  addMessage(BuildContext context, Conversation _conversation, String text) {
    Chat _chat = new Chat(text, DateTime.now().toUtc().millisecondsSinceEpoch,
        currentUser.value.id);
    if (_conversation.id == null) {
      _conversation.id = UniqueKey().toString();
      _createConversation(_conversation);
    }
    _conversation.lastMessage = text;
    _conversation.lastMessageTime = _chat.time;
    _conversation.readByUsers = [currentUser.value.id];
    _chatRepository.addMessage(_conversation, _chat).then((value) {
      _conversation.users.forEach((_user) {
        if (_user.id != currentUser.value.id) {
          notificationRepo.sendNotification(
              text,
              S.of(context).newMessageFrom + " " + currentUser.value.name,
              _user);
        }
      });
    });
  }

  orderSnapshotByTime(AsyncSnapshot snapshot) {
    final docs = snapshot.data.documents;
    docs.sort((QueryDocumentSnapshot a, QueryDocumentSnapshot b) {
      var time1 = a.get('time');
      var time2 = b.get('time');
      return time2.compareTo(time1) as int;
    });
    return docs;
  }
}
