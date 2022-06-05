import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/constants.dart';

class DetailsPage extends StatefulWidget {
  final heroTag;
  final foodName;
  final description;
  final calories;
  final proteins;
  final vitamins;
  final weight;
  const DetailsPage(
      {this.heroTag,
      this.foodName,
      this.description,
      this.calories,
      this.proteins,
      this.vitamins,
      this.weight});
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  var selectedCard = 'WEIGHT';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.white,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: const Text('Details',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 40.0,
                  color: Colors.white)),
          centerTitle: true,
          actions: <Widget>[],
        ),
        body: ListView(children: [
          Stack(children: [
            Container(
                height: MediaQuery.of(context).size.height - 82.0,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent),
            Positioned(
                top: 75.0,
                child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45.0),
                          topRight: Radius.circular(45.0),
                        ),
                        color: Colors.white),
                    height: MediaQuery.of(context).size.height - 100.0,
                    width: MediaQuery.of(context).size.width)),
            Positioned(
                top: 30.0,
                left: (MediaQuery.of(context).size.width / 2) - 100.0,
                child: Hero(
                    tag: Image.network(widget.heroTag),
                    child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(widget.heroTag),
                                fit: BoxFit.fill)),
                        height: 215.0,
                        width: 215.0))),
            Positioned(
                top: 250.0,
                left: 25.0,
                right: 25.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.foodName,
                        style: const TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Container(
                        height: 150.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            _buildInfoCard('WEIGHT', '${widget.weight}', 'Gm'),
                            const SizedBox(width: 10.0),
                            _buildInfoCard(
                                'CALORIES', '${widget.calories}', 'Cal'),
                            const SizedBox(width: 10.0),
                            _buildInfoCard(
                                'VITAMINS', '${widget.vitamins}', 'Vit'),
                            const SizedBox(width: 10.0),
                            _buildInfoCard(
                                'PROTEINS', '${widget.proteins}', 'Pro')
                          ],
                        )),
                    const SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Container(
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0),
                                  bottomLeft: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0)),
                              color: Color.fromARGB(255, 146, 175, 226)),
                          height: 180.0,
                          child: Center(
                            child: Text('${widget.description}',
                                style: const TextStyle(
                                  fontSize: 17.0,
                                  color: Color.fromARGB(255, 46, 39, 39),
                                  fontFamily: 'Montserrat',
                                )),
                          )),
                    )
                  ],
                ))
          ])
        ]));
  }

  Widget _buildInfoCard(String cardTitle, String info, String unit) {
    return InkWell(
        onTap: () {
          selectCard(cardTitle);
        },
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: cardTitle == selectedCard
                  ? const Color(0xFF7A9BEE)
                  : Color.fromARGB(218, 202, 244, 247),
              border: Border.all(
                  color: cardTitle == selectedCard
                      ? Colors.transparent
                      : Colors.grey.withOpacity(0.3),
                  style: BorderStyle.solid,
                  width: 0.75),
            ),
            height: 100.0,
            width: 100.0,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 15.0),
                    child: Text(cardTitle,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16.0,
                          color: cardTitle == selectedCard
                              ? Colors.white
                              : Colors.grey.withOpacity(0.7),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, bottom: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(info,
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 16.0,
                                color: cardTitle == selectedCard
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.bold)),
                        Text(unit,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12.0,
                              color: cardTitle == selectedCard
                                  ? Colors.white
                                  : Colors.black,
                            ))
                      ],
                    ),
                  )
                ])));
  }

  selectCard(cardTitle) {
    setState(() {
      selectedCard = cardTitle;
    });
  }
}
