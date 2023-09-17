class AppConstace {
 static const baseUrl="https://api.themoviedb.org/3";

 static const String apiKey="c3435cfe40aeb079689227d82bf921d3";

 static const String nowPlayingMoviePath="$baseUrl/movie/now_playing?api_key=$apiKey";
 
 static const String popularMoviePath="$baseUrl/movie/popular?api_key=$apiKey";
 
 static const String toRatedMoviePath="$baseUrl/movie/top_rated?api_key=$apiKey";
 
 static String movieDetailsPath(int movieId) => "$baseUrl/movie/$movieId?api_key=$apiKey";

 static String recommendationPath(int movieId) => "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";


 static String baseImageUrl = "https://image.tmdb.org/t/p/w500";
 static String imageUrl(String path) => "$baseImageUrl$path"; 
 
}