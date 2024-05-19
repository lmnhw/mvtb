import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:mvtb/data/movie_details.dart';
import 'package:mvtb/pages/booking_page.dart';
import 'package:mvtb/utils/styles.dart';
import 'package:mvtb/widgets/svg_icon.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent
    ));
    return Scaffold(
      backgroundColor: Styles.backgroundColor,
      bottomSheet: Container(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 25),
        color: Styles.backgroundColor,
        child: ElevatedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SvgIcon(assetName: 'ticket'),
              Gap(10),
              Text('Đặt vé', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
            ],
          ),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            )
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (_) => const BookingPage()
            ));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.centerLeft,
              children: [
                Image.asset(
                  Styles.imagePath('doraemon.png'),
                  width: double.infinity,
                  fit: BoxFit.fitWidth, height: 160,
                  color: Colors.grey.withOpacity(0.35),
                  colorBlendMode: BlendMode.modulate,
                ),
                Positioned.fill(
                  child: Image.asset(Styles.imagePath('play.png'), color: Colors.grey.withOpacity(0.5),),
                ),
                Positioned(
                  left: 15,
                  top: 130,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(Styles.imagePath('doraemon.png'), fit: BoxFit.contain,)
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 30, left: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Doraemon - Bản\n giao hưởng địa cầu', style: TextStyle(fontSize: 22, color: Colors.white, letterSpacing: 1, fontWeight: FontWeight.bold),),
                            const Gap(15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: movieDetails.map<Widget>((d) {
                                return Container(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                          width: 65,
                                          child: Text(d['key'], style: TextStyle(color: Colors.white.withOpacity(0.35), fontSize: 12),)),
                                      const Gap(20),
                                      Text(d['value'], style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 12),),
                                    ],
                                  ),
                                );
                              }).toList(),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ),
                Positioned(
                  top: 35,
                  left: 0,
                  child: IconButton(
                    icon: const Icon(CupertinoIcons.back, color: Colors.white,),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
            const Gap(200),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 60,
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white.withOpacity(0.2), width: 0.8),
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: List<Icon>.generate(5, (index) {
                                return Icon(index == 4 ? CupertinoIcons.star_lefthalf_fill : CupertinoIcons.star_fill, color: const Color(0xFFFAC921), size: 12,);
                              }),
                            ),
                            const Spacer(),
                            const Text('9.1/10', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),)
                          ],
                        ),
                      ),
                      Container(
                        height: 60,
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 25),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white.withOpacity(0.2), width: 0.8),
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: Column(
                          children: [
                            Text('Thời lượng', style: TextStyle(color: Colors.white.withOpacity(0.35), fontSize: 12)),
                            const Spacer(),
                            const Text('118 phút', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),)
                          ],
                        ),
                      ),
                      Container(
                        height: 60,
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white.withOpacity(0.2), width: 0.8),
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: Column(
                          children: [
                            Text('P-G', style: TextStyle(color: Colors.white.withOpacity(0.35), fontSize: 12)),
                            const Spacer(),
                            const Text('Mọi lứa tuổi', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),)
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  const Center(
                    child: Text('Mô tả phim', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),)
                  ),
                  const Gap(10),
                  Text("""TÁC PHẨM KỶ NIỆM 90 NĂM FUJIKO F FUJIO Chuẩn bị cho buổi hòa nhạc ở trường, Nobita đang tập thổi sáo - nhạc cụ mà cậu dở tệ. Thích thú trước nốt "No" lạc quẻ của Nobita, Micca - cô bé bí ẩn đã mời Doraemon, Nobita cùng nhóm bạn đến "Farre" - Cung điện âm nhạc tọa lạc trên một hành tinh nơi âm nhạc sẽ hóa thành năng lượng. Nhằm cứu cung điện này, Micca đang tìm kiếm "virtuoso" - bậc thầy âm nhạc sẽ cùng mình biểu diễn! Với bảo bối thần kì "chứng chỉ chuyên viên âm nhạc", Doraemon và các bạn đã chọn nhạc cụ, cùng Micca hòa tấu, từng bước khôi phục cung điện. Tuy nhiên, một vật thể sống đáng sợ sẽ xóa số âm nhạc khỏi thế giới đang đến gần, Trái Đất đang rơi vào nguy hiểm... ! Liệu những người bạn nhỏ có thể cứu được "tương lai âm nhạc" và cả địa cầu này?""", 
                  style: TextStyle(fontSize: 12, color: Colors.white.withOpacity(0.4), letterSpacing: 1, fontWeight: FontWeight.w400),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
