import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import '../../../utills/colors.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  bool isLightTheme = false;
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  bool useFloatingAnimation = true;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final OutlineInputBorder border = OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey.withOpacity(0.7),
      width: 2.0,
    ),
  );

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      isLightTheme ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light,
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(leading: InkWell(onTap: () {
        Navigator.pop(context);
      }, child: Icon(CupertinoIcons.left_chevron, color: Colors.black,)),
        backgroundColor: Colors.transparent,),
      body: Builder(
        builder: (BuildContext context) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage(
                  isLightTheme
                      ? 'assets/images/bg-dark.png'
                      : 'assets/images/bg-light.png',
                ),
                fit: BoxFit.fill,
              ),
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  CreditCardWidget(
                    enableFloatingCard: true,
                    floatingConfig: const FloatingConfig(
                      isGlareEnabled: true,
                      isShadowEnabled: true,
                      shadowConfig: FloatingShadowConfig(
                        offset: Offset(10, 10),
                        color: Colors.black,
                        blurRadius: 15,
                      ),
                    ),
                    glassmorphismConfig: _getGlassmorphismConfig(),
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: cardHolderName,
                    cvvCode: cvvCode,
                    bankName: 'Axis Bank',
                    // frontCardBorder: useGlassMorphism
                    //     ? null
                    //     : Border.all(color: Colors.grey),
                    // backCardBorder: useGlassMorphism
                    //     ? null
                    //     : Border.all(color: Colors.grey),
                    showBackView: isCvvFocused,
                    cardBgColor: AppColors.primaryBlue,
                    obscureCardNumber: true,
                    obscureCardCvv: true,
                    isHolderNameVisible: true,
                    backgroundImage:
                    useBackgroundImage ? 'assets/images/card_bg.png' : null,
                    isSwipeGestureEnabled: true,
                    onCreditCardWidgetChange:
                        (CreditCardBrand creditCardBrand) {},
                    customCardTypeIcons: <CustomCardTypeIcon>[
                      CustomCardTypeIcon(
                        cardType: CardType.mastercard,
                        cardImage: Image.asset(
                          'assets/images/mastercard.png',
                          height: 48,
                          width: 48,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          CreditCardForm(
                            formKey: formKey,
                            obscureCvv: true,
                            obscureNumber: true,
                            cardNumber: cardNumber,
                            cvvCode: cvvCode,
                            isHolderNameVisible: true,
                            isCardNumberVisible: true,
                            isExpiryDateVisible: true,
                            cardHolderName: cardHolderName,
                            expiryDate: expiryDate,
                            inputConfiguration: const InputConfiguration(
                              cardNumberDecoration: InputDecoration(
                                labelText: 'Number',
                                hintText: 'XXXX XXXX XXXX XXXX',
                              ),
                              expiryDateDecoration: InputDecoration(
                                labelText: 'Expired Date',
                                hintText: 'XX/XX',
                              ),
                              cvvCodeDecoration: InputDecoration(
                                labelText: 'CVV',
                                hintText: 'XXX',
                              ),
                              cardHolderDecoration: InputDecoration(
                                labelText: 'Card Holder',
                              ),
                            ),
                            onCreditCardModelChange: onCreditCardModelChange,
                          ),
                          const SizedBox(height: 20),
                          _buildSwitch('Glassmorphism', useGlassMorphism,
                                  (val) =>
                                  setState(() => useGlassMorphism = val)),
                          _buildSwitch(
                              'Card Image',
                              useBackgroundImage,
                                  (val) =>
                                  setState(() => useBackgroundImage = val)),
                          _buildSwitch(
                              'Floating Card',
                              useFloatingAnimation,
                                  (val) =>
                                  setState(() => useFloatingAnimation = val)),
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: _onValidate,
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: <Color>[
                                    AppColors.primaryBlue,
                                    AppColors.lightBlue,
                                    AppColors.primaryBlue,
                                  ],
                                  begin: Alignment(-1, -4),
                                  end: Alignment(1, 4),
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              alignment: Alignment.center,
                              child: const Text(
                                'Validate',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'halter',
                                  fontSize: 14,
                                  package: 'flutter_credit_card',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSwitch(String title, bool value, Function(bool) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(title),
          const Spacer(),
          Switch(
            value: value,
            inactiveTrackColor: Colors.grey,
            activeColor: Colors.white,
            activeTrackColor: AppColors.lightBlue,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  void _onValidate() {
    if (formKey.currentState?.validate() ?? false) {
      print('valid!');
    } else {
      print('invalid!');
    }
  }

  Glassmorphism? _getGlassmorphismConfig() {
    if (!useGlassMorphism) {
      return null;
    }

    return Glassmorphism(
      blurX: 8.0,
      blurY: 16.0,
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: <Color>[Colors.grey.withAlpha(50), Colors.grey.withAlpha(50)],
        stops: const <double>[0.3, 0],
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
