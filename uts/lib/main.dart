import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[300],
          ),
          child: const Column(
            children: [
              TopBanner(),
              MainRowMenu(),
              Expanded(
                child: Center(
                  child: MenuGrid(),
                ),
              ),
              Expanded(
                child: ImageCarousel(),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.payment),
              label: 'Payment',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class ImageCarousel extends StatelessWidget {
  const ImageCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(height: 200.0),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: const Text(''),
            );
          },
        );
      }).toList(),
    );
  }
}

class MenuGrid extends StatelessWidget {
  const MenuGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 8,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
      ),
      itemBuilder: (context, index) {
        return CustomChip(
          icon: FontAwesomeIcons.blenderPhone,
          label: 'Icon Label $index',
          backgroundColor: Colors.transparent,
          spacing: 16,
          iconSize: 48,
        );
      },
    );
  }
}

class MainRowMenu extends StatelessWidget {
  const MainRowMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 24),
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.white, boxShadow: const [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 4,
        )
      ]),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomChip(
            icon: Icons.payment_outlined,
            label: 'TopUp',
          ),
          CustomChip(
            icon: Icons.phone_android,
            label: 'Send Money',
          ),
          CustomChip(
            icon: FontAwesomeIcons.ticket,
            label: 'Ticket Code',
          ),
          CustomChip(
            icon: FontAwesomeIcons.borderAll,
            label: 'See All',
          ),
        ],
      ),
    );
  }
}

class CustomChip extends StatelessWidget {
  const CustomChip({
    super.key,
    required this.icon,
    required this.label,
    this.iconSize = 36,
    this.backgroundColor = Colors.white,
    this.spacing = 0,
  });
  final IconData icon;
  final String label;
  final double iconSize;
  final Color backgroundColor;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      child: InkWell(
        splashColor: Colors.grey[300],
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              icon,
              size: iconSize,
            ),
            SizedBox(height: spacing),
            Text(label),
          ],
        ),
      ),
    );
  }
}

class TopBanner extends StatelessWidget {
  const TopBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RoundedIcon(
              backgroundColor: Colors.red,
              child: Text('Link Aja!'),
            ),
            Row(
              children: [
                RoundedIcon(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.discount_outlined),
                ),
                SizedBox(width: 8),
                RoundedIcon(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.heart_broken_outlined),
                ),
              ],
            )
          ],
        ),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.red,
          ),
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, SOFTYAN NOOR ARIEF, S.ST, M.KOM',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    _BannerWithBalance('Saldo', 10.184),
                    _BannerWithBalance('Bonus Balance', 0),
                  ],
                ),
              ],
            ),
          ),
        ),
        const Row()
      ],
    );
  }
}

class _BannerWithBalance extends StatelessWidget {
  const _BannerWithBalance(this.title, this.balance);
  final String title;
  final double balance;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            Row(
              children: [
                Text('Rp. $balance', style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(width: 8),
                const Icon(Icons.arrow_forward_rounded),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RoundedIcon extends StatelessWidget {
  const RoundedIcon({
    super.key,
    required this.child,
    required this.backgroundColor,
  });
  final Widget child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: backgroundColor,
      ),
      width: 46,
      height: 46,
      child: child,
    );
  }
}
