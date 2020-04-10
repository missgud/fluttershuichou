import 'package:flutter/foundation.dart';

class ItemMoreProvider with ChangeNotifier {
  final categoryList = [
    CategoryModel("全部", true),
    CategoryModel("教育培训", false),
    CategoryModel("技术开发", false),
    CategoryModel("信息技术", false),
    CategoryModel("商业运营", false),
    CategoryModel("商务咨询", false),
    CategoryModel("营销推广", false),
    CategoryModel("专业设计", false),
    CategoryModel("网红包装", false),
    CategoryModel("生活服务", false),
    CategoryModel("业务辅助", false),
    CategoryModel("平台辅助", false),
    CategoryModel("物业管理", false),
    CategoryModel("新媒体运营", false),
    CategoryModel("工业制造", false),
  ];

  void selectCategory(int index) {
    categoryList.forEach((e) => e.status = false);
    categoryList[index].status = true;
    notifyListeners();
  }
}

class CategoryModel {
  final title;
  bool status = false;

  CategoryModel(this.title, this.status);
}
