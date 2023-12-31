import 'package:flutter/material.dart';
import 'package:sabak_33_capitals_logic_3/constants/app_text_style.dart';
import 'package:sabak_33_capitals_logic_3/model/suroo_joop.dart';

class TestView extends StatefulWidget {
  const TestView({super.key, required this.suroo});
  final List<Suroo> suroo;
  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  int indexText = 0;
  int tuuraJoop = 0;
  int kataJoop = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          Container(
            height: 30,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  //spreadRadius: 5,
                  blurRadius: 7,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '$kataJoop',
                  style: AppTextStyle.num1Style,
                ),
                const Text(
                  '6',
                  style: AppTextStyle.num2Style,
                ),
                Text(
                  '$tuuraJoop',
                  style: AppTextStyle.num3Style,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Text(
            '$kataJoop',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            width: 30,
          ),
          const Icon(
            Icons.favorite,
            color: Colors.red,
          ),
          const Icon(
            Icons.favorite,
            color: Colors.red,
          ),
          const Icon(
            Icons.favorite,
            color: Colors.red,
          ),
          const Icon(Icons.more_vert),
        ],
        // title: const Text('TestView'),
      ),
      body: Column(
        children: [
          Slider(
            activeColor: Colors.black,
            value: indexText.toDouble(),
            onChanged: (v) {},
            min: 0,
            max: 6,
          ),
          Text(
            widget.suroo[indexText].text,
            style: AppTextStyle.capitalsStyle,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Image.asset(
              "assets/capitals/${widget.suroo[indexText].image}",
              width: 250,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.only(
                left: 5,
                right: 5,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.6,
              ),
              itemCount: 4,
              itemBuilder: ((context, index) {
                return Card(
                  color: Colors.grey[400],
                  child: InkWell(
                    onTap: () {
                      if (indexText + 1 == widget.suroo.length) {
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text("Сиздин тест жыйынтыгыныз!"),
                            content: Text("Туура: $tuuraJoop Ката $kataJoop"),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  indexText = 0;
                                  kataJoop = 0;
                                  tuuraJoop = 0;
                                  setState(() {});
                                  Navigator.pop(context);
                                },
                                child: const Text("Cancel"),
                              ),
                            ],
                          ),
                        );
                      } else {
                        if (widget.suroo[indexText].jooptor[index].tuuraJoop ==
                            true) {
                          tuuraJoop++;
                        } else {
                          kataJoop++;
                        }
                      }
                      setState(() {
                        indexText++;
                      });
                    },
                    child: Center(
                      child: Text(widget.suroo[indexText].jooptor[index].text),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
