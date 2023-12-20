import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Giới thiệu",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.orangeAccent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              width: 800,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "VietShoe",
                      style: TextStyle(
                        fontSize: 70,
                        fontWeight: FontWeight.bold,
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Text(
              "Chào mừng bạn đến với Shop của chúng tôi! Chúng tôi cung cấp các sản phẩm chất lượng với giá trị tốt nhất. Hãy khám phá các sản phẩm mới nhất và hấp dẫn của chúng tôi. Shop chúng tôi ra đời vào năm 2023, và từ đó chúng tôi đã không ngừng phát triển và mở rộng. Với sự tin tưởng và ủng hộ của khách hàng, chúng tôi đã trở thành một trong những cửa hàng trực tuyến hàng đầu Việt Nam, cung cấp hàng ngàn sản phẩm đa dạng về các hãng giày lớn của thế giới. Chúng tôi cam kết mang đến cho khách hàng trải nghiệm mua sắm trực tuyến tốt nhất với dịch vụ chăm sóc khách hàng chu đáo, giao hàng nhanh chóng và chính sách đổi trả linh hoạt.",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20),
            Text("Cảm ơn bạn đã chọn chúng tôi!",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),
            SizedBox(height: 20),
            Text("Đây là những sản phẩm bán chạy nhất ở bên shop chúng tôi",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black45,
              ),
            ),
            SizedBox(height: 20),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              children: List.generate(8, (index) {
                return Container(
                  child: Card(
                    child: Image.asset('images/${index+1}.jpg', fit: BoxFit.cover),
                  ),
                );
              }),
            ),
            SizedBox(height: 20),
            // Thêm các thông tin khác nếu cần
          ],
        ),
      ),
    );
  }
}
