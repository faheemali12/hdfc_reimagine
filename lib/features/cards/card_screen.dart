import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hdfc_reimagine/features/cards/credit_card/creditcard_screen.dart';
import '../../utills/colors.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryBlue,
        title: Text("Cards",
            style: TextStyle(color: AppColors.whiteGrey, fontSize: 25)),
      ),
      body: _buildBody(),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            _debitText(),
            SizedBox(height: 10),
            _cardScroll(),
            SizedBox(height: 20),
            _creditText(),
            SizedBox(height: 10),
            _creditCard(),
            SizedBox(height: 20),
            _action(),
            SizedBox(height: 10),
            _actionList(CupertinoIcons.plus_rectangle, "Purchase Forex Card"),
            SizedBox(height: 4),
            _actionList(CupertinoIcons.gift, "Buy e-GiftPlus Card"),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _debitText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Debit Cards",
          style: TextStyle(
            color: AppColors.darkGrey,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          "Add Card",
          style: TextStyle(
            color: AppColors.secondaryBlue,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    );
  }

  Widget _debitCard(String card_title) {
    return Center(
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [AppColors.primaryBlue, AppColors.secondaryBlue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              spreadRadius: 2,
              offset: Offset(0, 5),
            ),
          ],
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  card_title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "BALANCE",
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                    Text(
                      "₹7,500",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15),
            Text(
              "6795  ****  ****  5673",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                letterSpacing: 2,
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "CARD HOLDER NAME",
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                    Text(
                      "JOHN REGO",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "VALID",
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                    Text(
                      "06/24",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    "Visa",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardScroll() {
    return CarouselSlider(
      items: [_debitCard("TITANIUM"), _debitCard("REGALIA")],
      options: CarouselOptions(
        height: 210,
        initialPage: 0,
        clipBehavior: Clip.hardEdge,
        enableInfiniteScroll: false,
        reverse: false,
        autoPlay: false,
        enlargeCenterPage: true,
        enlargeFactor: 0.2,
        scrollDirection: Axis.horizontal,
        animateToClosest: true,
        pageSnapping: true,
        viewportFraction: 1.0,
      ),
    );
  }

  Widget _creditText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Credit Cards",
          style: TextStyle(
            color: AppColors.darkGrey,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          "Add Card",
          style: TextStyle(
            color: AppColors.secondaryBlue,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    );
  }

  Widget _creditCard() {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CreditcardScreen()));
        },
        child: Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [Colors.black, AppColors.darkGrey],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(0, 5),
              ),
            ],
          ),
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "PLATINIUM",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "BALANCE",
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                      Text(
                        "₹9,70,500",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15),
              Text(
                "6795  ****  ****  5673",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "CARD HOLDER NAME",
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                      Text(
                        "JOHN REGO",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "VALID",
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                      Text(
                        "06/24",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text(
                      "Visa",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _action() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Actions",
          style: TextStyle(
              color: AppColors.darkGrey,
              fontSize: 18,
              fontWeight: FontWeight.w700),
        )
      ],
    );
  }

  Widget _actionList(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: AppColors.secondaryBlue),
      title: Text(
        title,
        style: TextStyle(
            color: AppColors.darkGrey,
            fontWeight: FontWeight.w200,
            fontSize: 15),
      ),
      trailing: Icon(
        CupertinoIcons.right_chevron,
        color: Colors.black,
      ),
    );
  }
}
