import 'package:flutter/material.dart';
import 'package:ptu/src/pages/widgets/area_or_hability_cards.dart';
import 'package:ptu/src/pages/widgets/aviable_test_cards.dart';
import 'package:ptu/src/pages/widgets/ordinal_bar_line_combo_chart.dart';

class SubjectOverviewPage extends StatefulWidget {
  final argument;

  SubjectOverviewPage({Key? key, required this.argument}) : super(key: key);

  @override
  State<SubjectOverviewPage> createState() => _SubjectOverviewPageState();
}

class _SubjectOverviewPageState extends State<SubjectOverviewPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  void _handleTabIndex() {
    setState(() {});
  }

  int setTabSelected(ar) {
    if (ar == 'Lenguaje') {
      return 0;
    }
    if (ar == 'Matemáticas') {
      return 1;
    }
    if (ar == 'Historia') {
      return 2;
    }
    if (ar == 'Ingles') {
      return 3;
    }
    return 0;
  }

  String getImage() {
    if (_tabController.index == 0) {
      return 'https://images.unsplash.com/reserve/uZYSV4nuQeyq64azfVIn_15130980706_64134efc6e_o.jpg?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1734&q=80';
    }
    if (_tabController.index == 1) {
      return 'https://images.unsplash.com/photo-1635070041078-e363dbe005cb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80';
    }
    if (_tabController.index == 2) {
      return 'https://images.unsplash.com/photo-1447069387593-a5de0862481e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1738&q=80';
    }
    if (_tabController.index == 3) {
      return 'https://images.unsplash.com/photo-1565022536102-f7645c84354a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1746&q=80';
    }
    return 'https://images.unsplash.com/reserve/uZYSV4nuQeyq64azfVIn_15130980706_64134efc6e_o.jpg?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1734&q=80';
  }

  @override
  void initState() {
    var args = widget.argument;

    super.initState();
    _tabController = TabController(
        length: 4, vsync: this, initialIndex: setTabSelected(args));
    _tabController.addListener(_handleTabIndex);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabIndex);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        /* appBar: AppBar(
          title: const Text('Cursos'),
          bottom: TabBar(
            controller: _tabController,
            isScrollable: false,
            tabs: const <Widget>[
              Tab(
                icon: Icon(Icons.record_voice_over),
                text: 'Lenguaje',
              ),
              Tab(
                icon: Icon(Icons.add),
                text: 'Matemáticas',
              ),
              Tab(
                icon: Icon(Icons.account_balance),
                text: 'Historia',
              ),
              Tab(
                icon: Icon(Icons.language),
                text: 'Ingles',
              ),
            ],
          ),
        ),*/
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: true,
                pinned: true,
                stretch: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  collapseMode: CollapseMode.parallax,
                  title: const Text(
                    "Cursos",
                    style: TextStyle(
                        shadows: [Shadow(color: Colors.black, blurRadius: 20)]),
                  ),
                  background: Image.network(
                    getImage(),
                    fit: BoxFit.cover,
                  ),
                  stretchModes: const [
                    StretchMode.fadeTitle,
                    StretchMode.blurBackground,
                    StretchMode.zoomBackground,
                  ],
                ),
              ),
              SliverPersistentHeader(
                floating: false,
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    isScrollable: false,
                    controller: _tabController,
                    // labelColor: Colors.black87,
                    // unselectedLabelColor: Colors.grey,
                    labelColor: Theme.of(context).textTheme.bodyText1!.color,
                    unselectedLabelColor:
                        Theme.of(context).textTheme.caption!.color,
                    tabs: const [
                      Tab(
                        icon: Icon(Icons.record_voice_over),
                        text: 'Lenguaje',
                      ),
                      Tab(
                        icon: Icon(Icons.add),
                        text: 'Matemáticas',
                      ),
                      Tab(
                        icon: Icon(Icons.account_balance),
                        text: 'Historia',
                      ),
                      Tab(
                        icon: Icon(Icons.language),
                        text: 'Ingles',
                      ),
                    ],
                  ),
                ),
                pinned: true,
              ),
            ];
          },
          body: SafeArea(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: <Widget>[
                ListView(
                  children: [
                    SizedBox(
                        height: 200, child: OrdinalBarLineComboChart.withSampleData()),
                    AviableTestCards(
                      title: 'Test disponibles',
                    ),
                    AreaOrHabilityCards(
                      title: 'Categorías',
                    )
                  ],
                ),
                ListView(
                  children: [
                    const Placeholder(
                      fallbackHeight: 200,
                    ),
                    AviableTestCards(
                      title: 'Test disponibles',
                    ),
                    AreaOrHabilityCards(
                      title: 'Categorías',
                    ),
                  ],
                ),
                ListView(
                  children: [
                    const Placeholder(
                      fallbackHeight: 200,
                    ),
                    AviableTestCards(
                      title: 'Test disponibles',
                    ),
                    AreaOrHabilityCards(
                      title: 'Categorías',
                    ),
                  ],
                ),
                ListView(
                  children: [
                    const Placeholder(
                      fallbackHeight: 200,
                    ),
                    AviableTestCards(
                      title: 'Test disponibles',
                    ),
                    AreaOrHabilityCards(
                      title: 'Categorías',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: _bottomButtons(),
      ),
    );
  }

  Widget _bottomButtons() {
    if (_tabController.index == 0) {
      return FloatingActionButton(
        tooltip: 'Iniciar ensayo general',
        backgroundColor: Colors.red,
        onPressed: () {
          Navigator.pushNamed(context, '/subject_detail',
              arguments: 'Lenguaje');
        },
        child: const Icon(Icons.play_circle),
      );
    }
    if (_tabController.index == 1) {
      return FloatingActionButton(
        tooltip: 'Iniciar ensayo general',
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.pushNamed(context, '/subject_detail',
              arguments: 'Matemáticas');
        },
        child: const Icon(Icons.play_circle),
      );
    }
    if (_tabController.index == 2) {
      return FloatingActionButton(
        tooltip: 'Iniciar ensayo general',
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.pushNamed(context, '/subject_detail',
              arguments: 'Historia');
        },
        child: const Icon(Icons.play_circle),
      );
    }
    if (_tabController.index == 3) {
      return FloatingActionButton(
        tooltip: 'Iniciar ensayo general',
        backgroundColor: Colors.purple,
        onPressed: () {
          Navigator.pushNamed(context, '/subject_detail', arguments: 'Ingles');
        },
        child: const Icon(Icons.play_circle),
      );
    }
    return FloatingActionButton(
      tooltip: 'Iniciar ensayo general',
      backgroundColor: Colors.red,
      onPressed: () {
        Navigator.pushNamed(context, '/subject_detail', arguments: 'Lenguaje');
      },
      child: const Icon(Icons.play_circle),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    //FIXME: El color del fondo no se actualza en tiempo real, solo al entrar en la pagina
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
