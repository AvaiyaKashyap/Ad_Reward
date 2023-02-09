import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: testad(),
  ));
}
class testad extends StatefulWidget {
  const testad({Key? key}) : super(key: key);

  @override
  State<testad> createState() => _testadState();
}

class _testadState extends State<testad> {

   RewardedAd? rewardedAd;
   bool isLoaded = false;
   @override
   void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    RewardedAd.load(
        adUnitId: "ca-app-pub-3554066442583190/5020081714",
        request: AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
            onAdLoaded: (ad){
              print("Rewarded Ad Loaded");
              setState(() {
                isLoaded=true;
              });
            },
            onAdFailedToLoad: (error){
              print("Rewarded Ad Failed to Load $error");
            }
        ),
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: (){
            rewardedAd?.show(onUserEarnedReward: (ad, reward){
              print("USer Watched the ad");
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
            height: 100,
            color: Colors.orange,
            child: const Text(
              "Show Rewarded Ad",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35),
            ),
          ),

        ),
      ),
    );
  }
}
