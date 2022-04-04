import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BelajarAppBar(),
    );
  }
}

class BelajarAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("My Music",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      )),
                  background: Image(
                    image: AssetImage('asset/image/music.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    labelColor: Colors.black87,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      new Tab(icon: new Icon(Icons.audiotrack), text: "Songs"),
                      new Tab(icon: new Icon(Icons.playlist_play), text: "Playlist"),
                      new Tab(icon: new Icon(Icons.favorite), text: "Favorit"),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(children: <Widget>[
            Songs(),
            Playlist(),
            Favorit(),
          ]),
        ),
      ),
    );
  }
}

class Songs extends StatelessWidget {
  final List lagu = [
    "Rizki Febian - Cukup Tau",
    "Tiara Andini - Merasa Indah",
    "Mahalini - Sisa Rasa",
    "Lyodra - Pesan Terakhir",
    "Tulus - Pamit",
    "Admesh - Bisa Tanpamu",
    "Tulus - Diri",
    "Kaleb J - It's Only Me",
    "Denny Caknan - Pingal",
    "Happy Asmara - Ojo Nangis",
    "Adele - Easy On Me",
    "Sezairi - It's You"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
                title: Text(lagu[index], style: TextStyle(fontSize: 18)),
                subtitle: Text('putar lagu dari ' + lagu[index]),
                leading: CircleAvatar(
                  child: Text(lagu[index][0], // ambil karakter pertama text
                      style: TextStyle(fontSize: 30)),
                )),
          );
        },
        itemCount: lagu.length,
      ),
    );
  }
}

class Playlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(crossAxisCount: 2, children: <Widget>[
        Container(
          child: Card(
            elevation: 10.0,
            child: Column(children: <Widget>[
              Image.asset(
                "asset/image/popp.jpg",
                height: 150.0,
                width: 200.0,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 1.0),
              Text(
                'Music Pop',
                style: TextStyle(color: Colors.red, fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ]),
          ),
        ),
        Container(
          child: Card(
            elevation: 10.0,
            child: Column(children: <Widget>[
              Image.asset(
                "asset/image/jazz1.jpg",
                height: 150.0,
                width: 200.0,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 1.0),
              Text(
                'Music Jazz',
                style: TextStyle(color: Colors.red, fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ]),
          ),
        ),
        Container(
          child: Card(
            elevation: 10.0,
            child: Column(children: <Widget>[
              Image.asset(
                "asset/image/rock1.jpg",
                height: 150.0,
                width: 200.0,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 1.0),
              Text(
                'Music Rock',
                style: TextStyle(color: Colors.red, fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ]),
          ),
        ),
        Container(
          child: Card(
            elevation: 10.0,
            child: Column(children: <Widget>[
              Image.asset(
                "asset/image/koplo.jpg",
                height: 150.0,
                width: 200.0,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 1.0),
              Text(
                'Music Koplo',
                style: TextStyle(color: Colors.red, fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ]),
          ),
        ),
      ]),
    );
  }
}

class Favorit extends StatelessWidget {
  final List musc = [
    "Rizki Febian - Hingga Tua Bersama",
    "Happy Asmara - Ojo Nangis",
    "Mahalini - Janji Kita",
    "Lyodra - Pesan Terakhir",
    "Tulus - Monokrom",
    "Admesh - Bisa Tanpamu",
    "Tulus - Diri",
    "Kaleb J - It's Only Me",
    "Tulus - Pamit",
    "Happy Asmara - Pingal",
    "Justin Bieaber - Anyone",
    "Sezairi - It's You"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
                title: Text(musc[index], style: TextStyle(fontSize: 18)),
                subtitle: Text('putar lagu fav - ' + musc[index]),
                leading: CircleAvatar(
                  child: Text(musc[index][0], // ambil karakter pertama text
                      style: TextStyle(fontSize: 30)),
                )),
          );
        },
        itemCount: musc.length,
      ),
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
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
