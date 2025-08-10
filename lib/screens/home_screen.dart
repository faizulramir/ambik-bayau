import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/category_grid.dart';
import '../widgets/side_scroller_item.dart';
import '../widgets/side_scroller_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 16.0),
          child: Column(
            children: [
              _buildCategorySection(),
              const SizedBox(height: 16),
              _buildQuickActionsSection(),
              const SizedBox(height: 20),
              _buildFoodSection('Order food again', _buildOrderAgainCards()),
              const SizedBox(height: 12),
              _buildFoodSection('Recommended restaurants', _buildRecommendedCards()),
              const SizedBox(height: 12),
              _buildFoodSection('People love food from', _buildPopularCards()),
            ],
          ),
        ),
      ),
      floatingActionButton: _buildFloatingCartButton(),
    );
  }

  Widget _buildCategorySection() {
    return const CategoryGrid();
  }

  Widget _buildQuickActionsSection() {
    return SizedBox(
      height: 60,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        children: const [
          SideScrollerItem(
            title: 'View Balance',
            topDescription: 'GrabPay Wallet',
          ),
          SizedBox(width: 12),
          SideScrollerItem(
            title: 'Ride to airport',
            topDescription: 'Schedule',
          ),
          SizedBox(width: 12),
          SideScrollerItem(
            title: 'Nasi Ayam Ayah - Batu 3',
            topDescription: 'Rate',
          ),
          SizedBox(width: 12),
          SideScrollerItem(
            title: 'Nasi Ayam Ayah - Batu 3',
            topDescription: 'Rate',
          ),
          SizedBox(width: 12),
          SideScrollerItem(
            title: '147',
            topDescription: 'GrabRewards',
          ),
        ],
      ),
    );
  }

  Widget _buildFoodSection(String title, Widget cardsList) {
    return Column(
      children: [
        _buildSectionHeader(title),
        const SizedBox(height: 12),
        cardsList,
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Container(
            width: 24,
            height: 24,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 223, 235, 238),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.arrow_forward,
              size: 14,
              color: Color.fromARGB(255, 32, 110, 58),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderAgainCards() {
    return SizedBox(
      height: 230,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        children: const [
          SideScrollerCard(
            shopName: 'Abe Roti Canai - Seksyen 13',
            distance: '10.2',
            discount: '15',
          ),
          SizedBox(width: 12),
          SideScrollerCard(
            shopName: 'McDonalds - Shell Section 13 375',
            distance: '10.1',
          ),
          SizedBox(width: 12),
          SideScrollerCard(
            shopName: 'Tara Burger - Menara U2',
            distance: '9.7',
            discount: '15',
          ),
          SizedBox(width: 12),
          SideScrollerCard(
            shopName: 'KFC - Pavilion KL',
            distance: '8.5',
            discount: '20',
          ),
          SizedBox(width: 12),
          SideScrollerCard(
            shopName: 'Pizza Hut - KLCC',
            distance: '12.3',
            discount: '10',
          ),
          SizedBox(width: 12),
          SideScrollerCard(
            shopName: 'Subway - Mid Valley',
            distance: '7.8',
            discount: '25',
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendedCards() {
    return SizedBox(
      height: 230,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        children: const [
          SideScrollerCard(
            shopName: 'Abe Roti Canai - Seksyen 13',
            distance: '10.2',
            discount: '15',
          ),
          SizedBox(width: 12),
          SideScrollerCard(
            shopName: 'McDonalds - Shell Section 13 375',
            distance: '10.1',
          ),
          SizedBox(width: 12),
          SideScrollerCard(
            shopName: 'Tara Burger - Menara U2',
            distance: '9.7',
            discount: '15',
          ),
          SizedBox(width: 12),
          SideScrollerCard(
            shopName: 'KFC - Pavilion KL',
            distance: '8.5',
            discount: '20',
          ),
          SizedBox(width: 12),
          SideScrollerCard(
            shopName: 'Pizza Hut - KLCC',
            distance: '12.3',
            discount: '10',
          ),
          SizedBox(width: 12),
          SideScrollerCard(
            shopName: 'Subway - Mid Valley',
            distance: '7.8',
            discount: '25',
          ),
        ],
      ),
    );
  }

  Widget _buildPopularCards() {
    return SizedBox(
      height: 230,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        children: const [
          SideScrollerCard(
            shopName: 'Abe Roti Canai - Seksyen 13',
            distance: '10.2',
            discount: '15',
          ),
          SizedBox(width: 12),
          SideScrollerCard(
            shopName: 'McDonalds - Shell Section 13 375',
            distance: '10.1',
          ),
          SizedBox(width: 12),
          SideScrollerCard(
            shopName: 'Tara Burger - Menara U2',
            distance: '9.7',
            discount: '15',
          ),
          SizedBox(width: 12),
          SideScrollerCard(
            shopName: 'KFC - Pavilion KL',
            distance: '8.5',
            discount: '20',
          ),
          SizedBox(width: 12),
          SideScrollerCard(
            shopName: 'Pizza Hut - KLCC',
            distance: '12.3',
            discount: '10',
          ),
          SizedBox(width: 12),
          SideScrollerCard(
            shopName: 'Subway - Mid Valley',
            distance: '7.8',
            discount: '25',
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingCartButton() {
    return FloatingActionButton(
      onPressed: () {
        // Handle cart button press
      },
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      child: Stack(
        children: [
          Icon(
            Icons.shopping_bag_outlined,
            color: Colors.black.withOpacity(0.5),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
