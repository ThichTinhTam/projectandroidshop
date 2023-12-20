import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:projectandroid/models/notifical.dart';

import '../controller/notifical.dart';
import 'detailnotifical.dart';

class NotificalTest extends StatefulWidget {
  const NotificalTest({Key? key}) : super(key: key);

  @override
  _NotificalTestState createState() => _NotificalTestState();
}

class _NotificalTestState extends State<NotificalTest> {
  late List<bool> dotVisibility;

  @override
  void initState() {
    super.initState();
    dotVisibility = List.generate(10, (index) => true);
    updateNotificationStatus();
  }

  void updateNotificationStatus() {
    Get.find<NotificationController>().updateUnreadNotificationStatus(dotVisibility);
    final NotificationController notificationController = Get.put(NotificationController());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text('Thông báo'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Notification').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Đã xảy ra lỗi: ${snapshot.error}'),
            );
          }
          final List<DocumentSnapshot> documents = snapshot.data!.docs;

          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              final notificationData = documents[index].data() as Map<String, dynamic>;
              NotificationModel notification = NotificationModel.fromMap(notificationData);
              final bool isRead = notificationData['isread'] ?? false;

              return Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    title: Row(
                      children: [
                        Visibility(
                          visible: !isRead, // Hiển thị nếu thông báo chưa đọc
                          child: Container(
                            width: 10,
                            height: 10,
                            margin: EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            notification.title,
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                    subtitle: Text(notification.description),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(notification.imageUrl),
                    ),
                    onTap: () async {
                      if (!isRead) {
                        // Cập nhật trạng thái isread khi thông báo được đọc
                        await documents[index].reference.update({'isread': true});
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            title: notification.title,
                            description: notification.description,
                            imageUrl: notification.imageUrl,
                          ),
                        ),
                      );
                    },
                  ),
                  Divider(
                    color: Colors.grey,
                    thickness: 1,
                    height: 1,
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}



