import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../logic/movie_details/movie_details_cubit.dart';

class YtTrailerPlayer extends StatefulWidget {
  const YtTrailerPlayer({super.key, required this.idYtTrailer});

  final String idYtTrailer;

  @override
  State<YtTrailerPlayer> createState() => _YtTrailerPlayerState();
}

class _YtTrailerPlayerState extends State<YtTrailerPlayer> {
  bool _isPlayerReady = false;

  @override
  void initState() {
    super.initState();
    final cubit = MovieDetailsCubit.of(context);
    cubit.controller = YoutubePlayerController(
      initialVideoId: widget.idYtTrailer,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);

    cubit.playerState = PlayerState.unknown;
  }

  void listener() {
    final cubit = MovieDetailsCubit.of(context);
    if (_isPlayerReady && mounted) {
      setState(() {
        cubit.playerState = cubit.controller.value.playerState;
      });
    }
  }

  @override
  void dispose() {
    final cubit = MovieDetailsCubit.of(context);
    cubit.controller.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = MovieDetailsCubit.of(context);
    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        Future.delayed(const Duration(milliseconds: 300), () {
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
        });
      },
      player: YoutubePlayer(
        controller: cubit.controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.blueAccent,
        topActions: <Widget>[
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              cubit.controller.metadata.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.white,
              size: 25.0,
            ),
            onPressed: () {
              cubit.playTrailer();
                if (mounted) {
                  if (cubit.controller.value.isFullScreen) {
                    cubit.controller.toggleFullScreenMode();
                  }
                }
            },
          ),
        ],

        onReady: () {
          _isPlayerReady = true;
        },
        onEnded: (data) {
          cubit.playTrailer();
        },
      ),
      builder: (context, player) => Scaffold(
        body: Column(
          children: [
            player,
          ],
        ),
      ),
    );
  }
}
