import 'package:blog_app_flutter_pocketbase_getx/models/category_model.dart';
import 'package:blog_app_flutter_pocketbase_getx/models/post_model.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:pocketbase/pocketbase.dart';

class BlogController extends GetxController {
  final pb = PocketBase('http://192.168.1.106:8090');

  /// on init
  @override
  void onInit() {
    super.onInit();
    getAllCategories();
  }

  /// vars
  bool isLoading = false;
  List<CategoryModel> categories = [];
  List<PostModel> categoryPosts = [];
  List<PostModel> latestPosts = [];
  List<PostModel> searchResult = [];

  /// get categories
  void getAllCategories() async {
    try {
      isLoading = true;
      update();
      final records = await pb.collection('categories').getFullList(sort: '-created');
      List<CategoryModel> categoriesList = records.map((record) => CategoryModel.fromJson(record.toJson())).toList();
      isLoading = false;
      categories = categoriesList;
      if (categories.isNotEmpty) {
        getPostsOfCategory(categories[0].id);
      }
      update();
    } catch (e) {
      isLoading = false;
      update();
      print(e);
    }
  }

  /// get posts of category
  void getPostsOfCategory(String categoryId) async {
    try {
      isLoading = true;
      update();
      final records = await pb.collection('posts').getFullList(sort: '-created', filter: 'category ~ "$categoryId"');
      final List<PostModel> postsList = records.map((record) => PostModel.fromJson(record.toJson())).toList();
      categoryPosts = postsList;
      isLoading = false;
      update();
    } catch (e) {
      isLoading = false;
      update();
      print(e);
    }
  }

  /// get search result
  void getSearchResult(String querySearch) async {
    try {
      isLoading = true;
      update();
      final records = await pb.collection('posts').getFullList(sort: '-created', filter: 'title ~ "$querySearch"');
      final List<PostModel> postsList = records.map((record) => PostModel.fromJson(record.toJson())).toList();
      isLoading = false;
      searchResult = postsList;
      update();
    } catch (e) {
      isLoading = false;
      update();
      print(e);
    }
  }

  /// get latest posts
  void getLatestPosts() async {
    try {
      isLoading = true;
      update();
      final records = await pb.collection('posts').getList(
            sort: '-created',
            page: 1,
            perPage: 10,
          );
      final List<PostModel> postsList = records.items.map((record) => PostModel.fromJson(record.toJson())).toList();
      isLoading = false;
      latestPosts = postsList;
      update();
    } catch (e) {
      isLoading = false;
      update();
      print(e);
    }
  }
}
