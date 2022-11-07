import 'package:flutter/material.dart';
import '../constants.dart';
import 'busline_view.dart';
import 'favorites_view.dart';
import 'home_view.dart';
import '../viewmodels/home_viewmodel.dart';
import '../router.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<HomeViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Bus App"),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.amberAccent,
            height: 400,
          ),
          Container(
            child: Column(
              children: const [
                TextField(),
                TextField(),
                Text("Nearest buses"),
              ],
            ),
          ),
          const SingleChildScrollView(
            physics: ScrollPhysics(),
            child: BusList(),
          ),
        ],
      ),
    );
  }
}

class BusList extends StatefulWidget {
  const BusList({super.key});

  @override
  State<BusList> createState() => _BusListState();
}

class _BusListState extends State<BusList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: /*1*/ (context, i) {
        if (i.isOdd) return const Divider(); /*2*/

        final index = i ~/ 2; /*3*/
        if (index >= viewModel.buses.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }

        final alreadySaved = _saved.contains(_suggestions[index]);
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10)); /*4*/
        }
        return ListTile(
          title: Text(
            _suggestions[index].asPascalCase,
            style: _biggerFont,
          ),
          trailing: GestureDetector(
            child: Icon(
              alreadySaved ? Icons.favorite : Icons.favorite_border,
              color: alreadySaved ? Colors.red : null,
              semanticLabel: alreadySaved ? 'Remove from saved' : 'Save',
            ),
            onTap: () {
              setState(() {
                if (alreadySaved) {
                  _saved.remove(_suggestions[index]);
                } else {
                  _saved.add(_suggestions[index]);
                }
              });
            },
          ),
          onTap: () {
            Navigator.pushNamed(context, '/new');
          },
        );
      },
    );
    ;
  }
}
