// import 'dart:ffi';
//
// import 'package:bt_print_service/pages/Neupage.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../models/playlist_provider.dart';
//
// class SongPage extends StatefulWidget {
//   const SongPage({super.key});
//
//   @override
//   State<SongPage> createState() => _SongPageState();
// }
//
// class _SongPageState extends State<SongPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<playlistprovider>(
//       builder:(context,value,child) {
//         final playlist = value.playlist;
//         final currentSong = playlist[value.currentSongIndex ?? 0];
//         return  Scaffold(
//           backgroundColor: Theme.of(context).colorScheme.background,
//           body: SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.only(left:25,right: 25,bottom: 25),
//               child: Column(
// //mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       IconButton(onPressed: (){
//                         Navigator.of(context).pop();
//                       }, icon: Icon(Icons.arrow_back)),
//                       Text("P L A Y L I S T"),
//                       IconButton(onPressed: (){
//
//                       }, icon: Icon(Icons.menu)),
//                     ],
//                   ),
//                   NeuBox(
//                     child: Column(
//                       children: [
//                         ClipRRect(
//                             borderRadius: BorderRadius.circular(8),
//                             child: Image.asset("assets/gvprakash.jpeg")),
//                         Padding(
//                           padding: EdgeInsets.all(15.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(currentSong.songName,style: TextStyle(fontWeight: FontWeight.bold),),
//                                   Text(currentSong.artistName)
//                                 ],
//                               ),
//                               Icon(CupertinoIcons.heart_fill,color: Colors.red,),
//                             ],
//                           ),
//                         ),
//
//                       ],
//                     ),
//
//                   ),
//                   const SizedBox(height: 25,),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 25),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text("0.00"),
//                         //start time
//                         Icon(Icons.shuffle),
//                         // shuffle icon
//                         Icon(CupertinoIcons.repeat),
//                         // repeat icon
//                         // end time
//                         Text("0.00"),
//                       ],
//                     ),
//
//                   ),
//                   SliderTheme(
//                     data: SliderTheme.of(context).copyWith(
//                       thumbShape: RoundSliderOverlayShape(
//                           overlayRadius: 0
//                       ),
//                     ),
//                     child: Slider(
//                       min:0,
//                       max: 100,
//                       value:50,
//                       activeColor: Colors.green,
//                       onChanged: (value) {
//                       },),
//                   ),
//                   const SizedBox(height: 25,),
//                   Row(
//                     children: [
//                       Expanded(
//                           child: GestureDetector(
//                               onTap: (){},
//
//                               child: NeuBox(child: Icon(Icons.skip_previous)))),
//                       const SizedBox(width: 20,),
//                       Expanded(
//                           flex: 2,
//                           child: GestureDetector(
//                               onTap: (){},
//
//                               child: NeuBox(child: Icon(Icons.play_arrow)))),
//                       const SizedBox(width: 20,),
//                       Expanded(
//                           child: GestureDetector(
//                               onTap: (){},
//
//                               child: NeuBox(child: Icon(Icons.skip_next)))),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//
//         );
//       }
//
//     );
//
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bt_print_service/models/playlist_provider.dart';

import 'Neupage.dart';

class SongPage extends StatefulWidget {
  const SongPage({super.key});
 

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  String formattedtime(Duration duration){
    String twodigitseconds = duration.inSeconds.remainder(60).toString().padLeft(2,'0');
    String formattedtime = "${duration.inMinutes}:$twodigitseconds";
    return formattedtime;

  }
  @override
  Widget build(BuildContext context) {
    return Consumer<playlistprovider>(
      builder: (context, value, child) {
        final playlist = value.playlist;
        final currentSong = playlist[value.currentSongIndex ?? 0];

        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
              child: Column(
                children: [
                  // Back Button and Title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.arrow_back),
                      ),
                      Text("P L A Y L I S T"),
                      IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
                    ],
                  ),

                  // Album Art and Song Info
                  NeuBox(
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(currentSong.albumArtImagepath),
                        ),
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    currentSong.songName,
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(currentSong.artistName),
                                ],
                              ),
                              Icon(CupertinoIcons.heart_fill, color: Colors.red),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  // Slider and Duration
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Start time
                        Text(formattedtime(value.currentDuration)),
                        // Shuffle & Repeat Icons
                        Icon(Icons.shuffle),
                        Icon(CupertinoIcons.repeat),
                        // End time
                        Text(formattedtime(value.totalDuration)),
                      ],
                    ),
                  ),

                  // Seek Slider
                  Slider(
                    min: 0,
                    max: value.totalDuration.inSeconds > 0 ? value.totalDuration.inSeconds.toDouble() : 1.0,
                    value: value.currentDuration.inSeconds.toDouble(),
                    activeColor: Colors.green,
                    onChanged: (newPosition) {
                      value.seek(Duration(seconds: newPosition.toInt()));
                      print('Slider moved to: ${newPosition.toInt()}'); // Debugging output
                    },
                  ),

                  const SizedBox(height: 25),

                  // Playback Controls
                  Row(
                    children: [
                      // Previous Song
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            value.playPreviousSong();
                          },
                          child: NeuBox(child: Icon(Icons.skip_previous)),
                        ),
                      ),
                      const SizedBox(width: 20),
                      // Play/Pause Button
                      Expanded(
                        flex: 2,
                        child: GestureDetector(
                          onTap: () {
                            value.pauseOrResume();
                          },
                          child: NeuBox(
                            child: Icon(
                              value.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      // Next Song
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            value.playNextSong();
                          },
                          child: NeuBox(child: Icon(Icons.skip_next)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Utility method to format duration
  
}
