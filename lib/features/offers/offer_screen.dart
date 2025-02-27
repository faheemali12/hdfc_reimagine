import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utills/colors.dart';

class OfferScreen extends StatefulWidget {
  const OfferScreen({super.key});

  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {});
      }
    });
  }

  final List<String> image = [
    "assets/images/offer.jpg",
    "assets/images/offeragain.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryBlue,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(CupertinoIcons.arrow_left, color: Colors.white, size: 20),
        ),
        title: const Text("Offers", style: TextStyle(color: AppColors.whiteGrey,fontSize: 25)),
      ),


      body: _tabBar(),
      backgroundColor: Colors.white,
    );
  }

  Widget _tabBar() {
    return Column(
      children: [
        Container(
          color: Colors.white,
          child: TabBar(
            controller: _tabController,
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            labelPadding: const EdgeInsets.symmetric(vertical: 5),
            tabs: [
              _buildTab(0, Icons.person, "For You"),
              _buildTab(1, Icons.store, "Shop"),
              _buildTab(2, Icons.local_offer, "Deals"),
              _buildTab(3, Icons.card_giftcard, "Vouchers"),
              _buildTab(4, Icons.person_outline, "Profile"),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _forYou(),
              const Center(child: Text("Shop Content")),
              const Center(child: Text("Deals Content")),
              const Center(child: Text("Vouchers Content")),
              const Center(child: Text("Profile Content")),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTab(int index, IconData icon, String label) {
    bool isSelected = _tabController.index == index;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: isSelected ? 36 : 30, color: AppColors.primaryBlue),
        Text(
          label,
          style: TextStyle(
            fontSize: isSelected ? 16 : 14,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _forYou() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              items: image.map((imgPath) {
                return Image.asset(
                  imgPath,
                  fit: BoxFit.cover,
                );
              }).toList(),
              options: CarouselOptions(
                height: 210,
                initialPage: 0,
                enableInfiniteScroll: true,
                clipBehavior: Clip.hardEdge,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.2,
                scrollDirection: Axis.horizontal,
                animateToClosest: true,
                viewportFraction: 1.0,

              ),
            ),
            const SizedBox(height: 40),
            _forYouText(),
            const SizedBox(height: 20),
            _offerDeals(),
            const SizedBox(height: 40),
            _topCategories(),
            const SizedBox(height: 20),
            _emiDeals(),
            const SizedBox(height: 40),
            _branFocus(),
            const SizedBox(height: 20),
            _brandDeals(),
          ],
        ),
      ),
    );
  }

  Widget _forYouText() {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Offer and Deals",
              style: TextStyle(
                color: AppColors.darkGrey,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "View All",
              style: TextStyle(
                color: AppColors.secondaryBlue,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _offerDeals() {
    return SizedBox(
      height: 250,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        // Enable horizontal scrolling
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 15,
          mainAxisSpacing: 10,
          childAspectRatio: 1.4,
        ),
        itemCount: 3,
        itemBuilder: (context, index) {
          List<Map<String, String>> offers = [
            {
              "image": "assets/images/sketchers.jpg",
              "title": "Sketchers",
              "description": "Get 10% Discount on first Order"
            },
            {
              "image": "assets/images/zomato.png",
              "title": "Zomato",
              "description": "Get 20% Discount on your next meal"
            },
            {
              "image": "assets/images/amaazon.jpg",
              "title": "Amazon",
              "description": "Special offers for Prime members"
            },
          ];

          return _offerCard(
            offers[index]["image"]!,
            offers[index]["title"]!,
            offers[index]["description"]!,
          );
        },
      ),
    );
  }

  Widget _offerCard(String imagePath, String title, String description) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 60,
                width: 60,
                decoration: const BoxDecoration(color: Colors.white),
                child: Image.asset(
                  imagePath, // Dynamic image path
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              title, // Dynamic title
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              description, // Dynamic description
              style: const TextStyle(fontSize: 12, color: Colors.grey),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "View Details",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _topCategories() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Top Categories on EMI",
          style: TextStyle(
            color: AppColors.darkGrey,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          "View All",
          style: TextStyle(
            color: AppColors.secondaryBlue,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    );
  }

  Widget _emiDeals() {
    List<Map<String, String>> emi = [
      {"image": "assets/images/emiamazon.jpeg"},
      {"image": "assets/images/emiflipkart.jpeg"},
      {"image": "assets/images/emioffer.jpeg"},
    ];

    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        itemCount: emi.length,
        itemBuilder: (context, index) {
          return _emiDealCard(emi[index]["image"]!);
        },
      ),
    );
  }

  Widget _emiDealCard(String imagePath) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [const BoxShadow(color: Colors.black26, blurRadius: 4)],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _branFocus() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Brand In Focus",
          style: TextStyle(
            color: AppColors.darkGrey,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          "View All",
          style: TextStyle(
            color: AppColors.secondaryBlue,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    );
  }

  Widget _brandCard(String imagePath) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [const BoxShadow(color: Colors.black26, blurRadius: 4)],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _brandDeals() {
    List<Map<String, String>> brand = [
      {"image": "assets/images/levis.png"},
      {"image": "assets/images/jockey.png"},
      {"image": "assets/images/wrogn.png"},
    ];

    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        itemCount: brand.length,
        itemBuilder: (context, index) {
          return _brandCard(brand[index]["image"]!);
        },
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
