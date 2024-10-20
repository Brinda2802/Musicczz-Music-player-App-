import 'package:bt_print_service/pages/songpages.dart';
import 'package:bt_print_service/themes/dark_mode.dart';
import 'package:bt_print_service/themes/light_mode.dart';
import 'package:bt_print_service/themes/themeprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'componenets/my_drawer.dart';
import 'models/playlist_provider.dart';
import 'models/song_models.dart';



void main() {
  runApp(
    MultiProvider(
      providers: [
     ChangeNotifierProvider(
        create: (context)=>ThemeProvider()),
  ChangeNotifierProvider(
  create: (context)=>playlistprovider()),
        ],
        child: const MyApp(),
      ),


  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
      theme: Provider.of<ThemeProvider>(context).getTheme,
    );
  }
}
class Homepage extends StatefulWidget {

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late final dynamic playlistProvider;
  @override
  void initState() {
    // TODO: implement initState
    playlistProvider = Provider.of<playlistprovider>(context,listen: false);
    super.initState();
  }
  void goToSong(int songIndex){
    playlistProvider.presentSongIndex = songIndex;
    Navigator.push(
      context,MaterialPageRoute(builder: (context)=> SongPage(),),
    );
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: Text(" P L A Y L I S T")),


      drawer: MyDrawer(),
      body: Consumer<playlistprovider>(
        builder:(context,value,child) {
          final List<Song> playlist = value.playlist;
          return ListView.builder(
            itemCount: playlist.length,
            itemBuilder: (BuildContext context, int index) {
          final Song song = playlist[index];
          return ListTile(
            title: Text(song.songName),
            subtitle: Text(song.artistName),
            leading: Image.asset(song.albumArtImagepath),
            onTap: (){
              goToSong(index);
            },
          );
        },);
        }
      ),
    );
  }
}


