import 'package:flutter/material.dart';
import 'package:flutter_architecture_example/mvvm/services/product_service.dart';
import 'package:flutter_architecture_example/mvvm/viewModels/product_list_view_model.dart';
import 'package:flutter_architecture_example/mvvm/views/pages/product_list_page.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MVVM Example',
      theme: ThemeData.light(useMaterial3: true),
      home: MultiProvider(
        providers: [
          Provider(create: (context) => ProductService()),
          ChangeNotifierProvider<ProductListViewModel>(
            create: (context) => ProductListViewModel(
              productService: context.read<ProductService>(),
            )..loadProducts(),
          ),
        ],
        child: const ProductListPage(),
      ),
    );
  }
}
