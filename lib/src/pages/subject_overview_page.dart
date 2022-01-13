import 'package:flutter/material.dart';
import 'package:ptu/src/pages/widgets/aviable_test.dart';

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
                    title: const Text("Cursos"),
                    background: Image.network(
                      "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                      fit: BoxFit.cover,
                    ),stretchModes: const [
                  StretchMode.fadeTitle,
                  StretchMode.blurBackground,
                  StretchMode.zoomBackground,
                ],),
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
                    unselectedLabelColor: Theme.of(context).textTheme.caption!.color,
                    tabs:const [
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
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: <Widget>[
              Column(
                children: [
                  AviableTest(
                    title: 'Test rápido',
                  ),
                  AviableTest(
                    title: 'Test completo',
                  )
                ],
              ),
              Column(
                children: [
                  AviableTest(
                    title: 'Test rápido',
                  ),
                  AviableTest(
                    title: 'Test completo',
                  )
                ],
              ),
              Column(
                children: [
                  AviableTest(
                    title: 'Test rápido',
                  ),
                  AviableTest(
                    title: 'Test completo',
                  )
                ],
              ),
              Column(
                children: [
                  AviableTest(
                    title: 'Test rápido',
                  ),
                  AviableTest(
                    title: 'Test completo',
                  )
                ],
              ),
            ],
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
