import 'package:flutter/material.dart';

import '../modules/navigation_item.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  final String title = 'DaGonZai';

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  final List<NavigationItem> navList = [
    const NavigationItem(
      path: '/StencilAreaPage',
      title: '模板用量计算器',
      description: '根据建筑面的宽高，根据不同的放置模式。计算出各种需要的板材数量',
      image: 'assets/images/nav_stencilArea_icon.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // 使用 ListView.builder 动态生成导航项
            Expanded(
              child: ListView.builder(
                itemCount: navList.length,
                itemBuilder: (context, index) {
                  final item = navList[index];
                  return GestureDetector(
                    onTap: () {
                      // 跳转到指定路径
                      Navigator.pushNamed(context, item.path);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            offset: const Offset(2, 2),
                            blurRadius: 16,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // 图片部分
                            SizedBox(
                              width: 100,
                              height: 100,
                              child: Image.asset(
                                item.image,
                                fit: BoxFit.cover,
                              ),
                            ),

                            const SizedBox(width: 16),

                            // 文字部分
                            SizedBox(
                              width: 180,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.title,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Divider(color: Colors.transparent, height: 8),
                                  Text(
                                    item.description,
                                    style: const TextStyle(
                                      color: Colors.black54,
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}