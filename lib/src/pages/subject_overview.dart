import 'package:flutter/material.dart';

class SubjectOverview extends StatefulWidget {
  final argument;

  SubjectOverview({Key? key, required this.argument}) : super(key: key);

  @override
  State<SubjectOverview> createState() => _SubjectOverviewState();
}

class _SubjectOverviewState extends State<SubjectOverview>
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
    final args = ModalRoute.of(context)!.settings.arguments as String;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cursos'),
          bottom: TabBar(
            controller: _tabController,
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
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            Center(
              child: Text('Lenguaje'),
            ),
            Center(
              child: Text('Matemáticas'),
            ),
            Center(
              child: Text('Historia'),
            ),
            Center(
              child: Text('Ingles'),
            ),
          ],
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
        child: Icon(Icons.play_circle),
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
        child: Icon(Icons.play_circle),
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
        child: Icon(Icons.play_circle),
      );
    }
    if (_tabController.index == 3) {
      return FloatingActionButton(
        tooltip: 'Iniciar ensayo general',
        backgroundColor: Colors.purple,
        onPressed: () {
          Navigator.pushNamed(context, '/subject_detail', arguments: 'Ingles');
        },
        child: Icon(Icons.play_circle),
      );
    }
    return FloatingActionButton(
      tooltip: 'Iniciar ensayo general',
      backgroundColor: Colors.red,
      onPressed: () {
        Navigator.pushNamed(context, '/subject_detail', arguments: 'Lenguaje');
      },
      child: Icon(Icons.play_circle),
    );
  }
}
