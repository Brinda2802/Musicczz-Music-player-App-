// import 'package:audioplayers/audioplayers.dart';
// import 'package:bt_print_service/models/song_models.dart';
// import 'package:flutter/cupertino.dart';
//
// class playlistprovider extends ChangeNotifier {
//  final List<Song> _playlist = [
//    //song 1
//    Song(
//        songName: 'Hey Minnale', artistName: 'Gv Prakash', albumArtImagepath: 'assets/gvprakash.jpeg', audiopath: 'audio/Heyminnale.mp3',
//
//    ),
//    Song(
//        songName: 'Hey Minnale', artistName: 'Gv Prakash', albumArtImagepath: 'assets/gvprakash.jpeg', audiopath: 'audio/Heyminnale.mp3'
//
//    ),
//    Song(
//        songName: 'Hey Minnale', artistName: 'Gv Prakash', albumArtImagepath: 'assets/gvprakash.jpeg', audiopath: 'audio/Heyminnale.mp3'
//
//    ),
//
//  ];
//
//  int ? presentsongIndex;
//  //getters
//
//
//
//  //Audioplayers
//  final AudioPlayer _audioPlayer = AudioPlayer();
//
//
//  // durations
//  Duration _currentDuration = Duration.zero;
//  Duration _totalDuration = Duration.zero;
//
//
//  //constructor
// PlaylistProvider(){
//   listenToDuration();
// }
//
//
//  // initially not playing
//  bool _isPlaying = false;
//
//  //play the song
//  void play() async{
//    final String path = _playlist[presentsongIndex!].audiopath;
//    await _audioPlayer.stop();
//    //await _audioPlayer.play(AssetSource(path));
//    await _audioPlayer.play(AssetSource(path));
//
//    _isPlaying = true;
//    notifyListeners();
//  }
//
//  //pause current song
//  void pause() async{
//    await _audioPlayer.pause();
//    _isPlaying = false;
//    notifyListeners();
//  }
//
//  //resume playing
//  void resume() async{
//    await _audioPlayer.resume();
//    _isPlaying = false;
//    notifyListeners();
//  }
//
//
//  //pause or resume
//  void pauseOrResume() async{
//    if(_isPlaying){
//      pause();
//    }else{
//      resume();
//    }
//    notifyListeners();
//  }
//
//  //seek to specific position in the current song
// void seek (Duration position) async {
//    await _audioPlayer.seek(position);
// }
//  //play next song
//  void playNextSong(){
//    if(presentsongIndex != null){
//      if (presentsongIndex! < _playlist.length -1){
//        currentSongIndex = presentsongIndex! + 1;
//      }else{
//        presentsongIndex = 0 ;
//      }
//    }
//  }
//
//  //play previous song
//  void playpreviousSong ()async {
//    if(_currentDuration.inSeconds > 2){
//
//    }else{
//      if(presentsongIndex !> 0){
//        currentSongIndex = presentsongIndex! -1;
//
//      }else{
//        presentsongIndex = _playlist.length -1;
//      }
//    }
//  }
//
//  // listen to duration
//  void listenToDuration(){
//
//    // listen for total duration
//    _audioPlayer.onDurationChanged.listen((newDuration){
//      _totalDuration = newDuration;
//      notifyListeners();
//    });
//    // listen for current duration
//    _audioPlayer.onPositionChanged.listen((newPosition){
//      _currentDuration = newPosition;
//      notifyListeners();
//    });
//
//
//    // listen for song completion
//    _audioPlayer.onPlayerComplete.listen((event){
//      playNextSong();
//    });
//  }
//
//  //dispose audio player
//
//
// List <Song> get playlist =>_playlist;
// //setters
// int ? get currentSongIndex => presentsongIndex;
// bool get isPlaying => _isPlaying;
// Duration get currentDuration => _currentDuration;
// Duration get totalDuration => _totalDuration;
//
//
//
//
//
//
// set currentSongIndex(int ? newIndex){
//   presentsongIndex = newIndex;
//   notifyListeners();
//   if(newIndex != null){
//     play();
//   }
//   notifyListeners();
// }
// }

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:bt_print_service/models/song_models.dart';

class playlistprovider extends ChangeNotifier {
  // Playlist with Song models
  final List<Song> _playlist = [
    Song(
      songName: 'Hey Minnale',
      artistName: 'G v Prakash',
      albumArtImagepath: 'assets/gvprakash.jpeg',
      audiopath: 'audio/Heyminnale.mp3', // Ensure the path is correct
    ),
    Song(
      songName: 'Dheema Dheema',
      artistName: 'Anirudh',
      albumArtImagepath: 'assets/anirudh.jpeg',
      audiopath: 'audio/Dheema-MassTamilan.dev.mp3', // Ensure the path is correct
    ),
    Song(
      songName: 'Kannazhaga',
      artistName: 'Anirudh',
      albumArtImagepath: 'assets/anirudh.jpeg',
      audiopath: 'audio/Kannazhaga.mp3', // Ensure the path is correct
    ),
    Song(
      songName: 'Pachai Nirame',
      artistName: 'A R Rahman',
      albumArtImagepath: 'assets/arrahman.jpeg',
      audiopath: 'audio/Pachchai-Nirame.mp3', // Ensure the path is correct
    ),
    Song(
      songName: 'Vennilavu Saaral',
      artistName: 'Gv Prakash',
      albumArtImagepath: 'assets/gvprakash.jpeg',
      audiopath: 'audio/Vennilavu-Saaral-MassTamilan.dev.mp3', // Ensure the path is correct
    ),
    // Add more songs if needed
  ];

  // Current song index
  int? presentSongIndex;

  // Audio player instance
  final AudioPlayer _audioPlayer = AudioPlayer();

  // Track whether a song is playing
  bool _isPlaying = false;

  // Track the current and total duration of the song
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  // Constructor to initialize listeners for duration
  PlaylistProvider() {
    listenToDuration();
  }

  // Play the song at the current index with try-catch block
  void play() async {
    try {
      if (presentSongIndex != null) {
        final String path = _playlist[presentSongIndex!].audiopath;
        await _audioPlayer.stop(); // Stop any current audio
        await _audioPlayer.play(AssetSource(path)); // Play the selected song
        _isPlaying = true;
        notifyListeners(); // Notify UI to update the state
      }
    } catch (e) {
      print('Error playing audio: $e'); // Catch and print any errors
    }
  }

  // Pause the current song
  void pause() async {
    try {
      await _audioPlayer.pause();
      _isPlaying = false;
      notifyListeners();
    } catch (e) {
      print('Error pausing audio: $e');
    }
  }

  // Resume the song
  void resume() async {
    try {
      await _audioPlayer.resume();
      _isPlaying = true;
      notifyListeners();
    } catch (e) {
      print('Error resuming audio: $e');
    }
  }

  // Toggle between pause and resume
  void pauseOrResume() {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
  }

  // Seek to a specific position in the song
  void seek(Duration position) async {
    try {
      await _audioPlayer.seek(position);
    } catch (e) {
      print('Error seeking audio: $e');
    }
  }

  // Play the next song in the playlist
  void playNextSong() {
    if (presentSongIndex != null) {
      if (presentSongIndex! < _playlist.length - 1) {
        currentSongIndex = presentSongIndex! + 1;
      } else {
        currentSongIndex = 0; // Loop back to the first song
      }
    }
  }

  // Play the previous song in the playlist
  void playPreviousSong() {
    if (_currentDuration.inSeconds > 2) {
      seek(Duration.zero); // Restart the current song if more than 2 seconds have passed
    } else {
      if (presentSongIndex != null && presentSongIndex! > 0) {
        currentSongIndex = presentSongIndex! - 1;
      } else {
        currentSongIndex = _playlist.length - 1; // Go to the last song
      }
    }
  }

  // Listen to the song duration and completion
  void listenToDuration() {
    // Listen for total duration
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;
      notifyListeners();
    });

    // Listen for current position
    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });

    // Listen for when the song finishes playing
    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong(); // Automatically play the next song
    });
  }

  // Getters for the UI
  List<Song> get playlist => _playlist;
  int? get currentSongIndex => presentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  // Setter to update the current song index and play the song
  set currentSongIndex(int? newIndex) {
    presentSongIndex = newIndex;
    notifyListeners(); // Notify the UI
    if (newIndex != null) {
      play(); // Play the new song when the index is updated
    }
  }

  // Dispose of the audio player when done
  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
