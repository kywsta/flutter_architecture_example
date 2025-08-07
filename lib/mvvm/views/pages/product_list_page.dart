import 'package:flutter/material.dart';
import 'package:flutter_architecture_example/mvvm/models/product.dart';
import 'package:flutter_architecture_example/mvvm/viewModels/product_view_model.dart';
import 'package:flutter_architecture_example/mvvm/views/widgets/product_card.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody());
  }

  AppBar _buildAppBar() {
    return AppBar(title: const Text('Products'));
  }

  Widget _buildBody() {
    final isLoading = context.select<ProductListViewModel, bool>(
      (viewModel) => viewModel.isLoading,
    );
    final productsCount = context.select<ProductListViewModel, int>(
      (viewModel) => viewModel.products.length,
    );
    return isLoading && productsCount == 0
        ? _buildLoadingIndicator()
        : _buildContent();
  }

  Widget _buildLoadingIndicator() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildContent() {
    final error = context.select<ProductListViewModel, String?>(
      (viewModel) => viewModel.error,
    );

    return error != null ? _buildErrorIndicator(error) : _buildProductGrids();
  }

  Widget _buildErrorIndicator(String error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error, size: 48),
            const SizedBox(height: 8),
            Text("Error", style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(error, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _reloadProducts,
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductGrids() {
    final products = context.select<ProductListViewModel, List<Product>>(
      (viewModel) => viewModel.products,
    );

    return RefreshIndicator(
      onRefresh: _reloadProducts,
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverMasonryGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childCount: products.length,
              itemBuilder: (context, index) {
                return ProductCard(product: products[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _reloadProducts() async {
    context.read<ProductListViewModel>().loadProducts();
    return Future.delayed(const Duration(seconds: 2));
  }
}
