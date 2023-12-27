import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text('About'),
      ),
      body: Column(
        children: [
          // Bức ảnh chiếm 1/3 màn hình ở phía trên
          Container(
            height: MediaQuery.of(context).size.height / 3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/login.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Dòng trống giữa ảnh và các icon
          SizedBox(height: 16),
          // Cột chứa 3 icon và dividers
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "User");
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 35,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15,top: 5),
                        child: Text('Thông tin khách hàng',
                          style: TextStyle(
                          fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black45,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Divider(color: Colors.black45,thickness: 1),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "aboutus");
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_rounded,
                        color: Colors.white,
                        size: 35,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15,top: 5),
                        child: Text('Thông tin về cửa hàng',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            color: Colors.black45,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Divider(color: Colors.black45,thickness: 1),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/");
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back,
                        size: 35,
                        color: Colors.redAccent,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text('Đăng xuất',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


