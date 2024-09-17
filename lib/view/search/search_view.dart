import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'search_view_model.dart';

bool isSelected = true;

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late FocusNode _focusNode;
  @override
  void initState() {
    _focusNode = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final viewModel = Provider.of<SearchViewModel>(context, listen: false);
    if (viewModel.isRouted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        FocusScope.of(context).requestFocus(_focusNode);
        viewModel.setIsRouted(false); // Reset the flag
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    log('en tepe build çalıştı bişeyler yapın');
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildSearchHeader(context),
            Expanded(child: _buildPlaces(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaces(BuildContext context) {
    return Consumer<SearchViewModel>(
      builder: (context, value, child) {
        log('sadece grid çalıştı aferin');
        if (value.predictions.isEmpty) {
          return _buildEmptyState();
        } else {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1, childAspectRatio: 5 / 1),
            itemCount: value.predictions.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {},
                  child: Card(
                    child: Center(
                        child: Text(
                      value.predictions[index].structuredFormatting?.mainText ?? 'Bulamadım',
                      textAlign: TextAlign.center,
                    )),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }

  Widget _buildSearchHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Arama',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          _buildSearchBar(context),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Consumer<SearchViewModel>(
        builder: (context, ref, child) => TextField(
          focusNode: context.read<SearchViewModel>().isRouted ? _focusNode : null,
          onChanged: (value) {
            if (ref.isRouted == true) {
              ref.setIsRouted(false);
            }
            ref.getPredictions(value);
          },
          decoration: const InputDecoration(
            hintText: 'Bir Yer Arayın',
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off, size: 80, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'Sonuç bulunamadı',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
