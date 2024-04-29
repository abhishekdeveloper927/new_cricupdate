class AppConstants {
  static const String appName = 'CricUpdate';
  static const String baseUrl = "https://cricupdate.app";
  static const String loginUri = '/api/user/login';
  static const String fcmTokenUri = '/api/store-fcm';
  static const String winningPredictionUri = '/api/getprobablity';
  static const String photosUri = '/api/get-gallery';
  static const String registerUri = '/api/user/signup';
  static const String getProfileUri = '/api/get-userprofile';
  static const String updateProfileUri = '/api/update-profile';
  static const String configUri = '/api/get-setting-data';
  static const String newsUri = '/api/get-newsbycategory';
  static const String bannerUri = '/api/get-all-banners';
  static const String tournamentBannerUri = '/api/get-all-tournamentbanners';
  static const String newsByIdUri = '/api/get-newsdetails';
  static const String categoryUri = '/api/get-categories';
  static const String allVideoUri = '/api/get-videoslist';
  static const String allShortsUri = '/api/get-shortslist';
  static const String allFeaturedVideoUri = '/api/featured-videos';
  static const String allSubscriptionUri = '/api/subscriptionplan';
  static const String buySubscriptionUri = '/api/purchase';
  static const String activeSubscriptionUri = '/api/getsubscriptiondetails';

  ///All Cricket Apis

  static const String apiTokenUri =
      'MvKswNh43wHSRJlHimEhGYOqzJf8GCK44ChTEhN35eTtgza20BEOP6Pllub8';
  static const String liveScoreUri =
      'https://cricket.sportmonks.com/api/v2.0/livescores';
  static const String teamRankingUri =
      'https://cricket.sportmonks.com/api/v2.0/team-rankings';
  static const String fixturesUri =
      'https://cricket.sportmonks.com/api/v2.0/fixtures';
  static const String teamsUri =
      'https://cricket.sportmonks.com/api/v2.0/teams';
  static const String leaguesUri =
      'https://cricket.sportmonks.com/api/v2.0/leagues';
  static const String playersUri =
      'https://cricket.sportmonks.com/api/v2.0/players';

  /*
  static const String venueUri =
      'https://cricket.sportmonks.com/api/v2.0/venues';*/
  static const String pointTableUri =
      'https://cricket.sportmonks.com/api/v2.0/standings/season';

  ///Entity Apis

  static const String accessKey = '452cf0dab5d8aeafe5611b834fb918f0';
  static const String secretKey = 'c71b3e1c66ec04894a28ddebeb10f841';

  static const String cricketBaseUri = 'https://rest.entitysport.com';
  static const String allMatchesUri = '/exchange/matches/';
  static const String rankingUri = '/exchange/iccranks';
  static const String playerUri = '/exchange/players';
  static const String competitionUri = '/exchange/competitions';
  static const String teamUri = '/exchange/teams';
  static const String authUri = '/v2/auth';

  /// Shared Key
  static const String token = 'token';
  static const String appVersion = '1.0.0';
}
