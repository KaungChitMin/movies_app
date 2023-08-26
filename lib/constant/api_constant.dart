///Base URL
const String kBaseURL = 'https://api.themoviedb.org/3';

///End points
const String kMovieByGenresIDEndPoint = '/discover/movie';
const String kGenresEndPoint = '/genre/movie/list';
const String kTopRatedMoviesEndPoint = '/movie/top_rated';
const String kGetPopularMoviesEndPoint = '/movie/popular';
const String kActorListEndPoint = '/person/popular';
const String kSearchMovieEndPoint = '/search/movie';
const String kActorDetailsEndPoint = '/person/{$kPathParameterFoActorID}';
const String kMovieDetailsEndPoint = '/movie/{$kPathParameterForMovieID}';
const String kCreditsEndPoint = '/movie/{$kPathParameterForMovieID}/credits';
const String kSimilarEndPoint = '/movie/{$kPathParameterForMovieID}/similar';

///Query Params
const String kQueryParamsWithGenres = 'with_genres';
const String kQueryParamsApiKey = 'api_key';
const String kQueryParamsPage = 'page';
const String kQueryParamsQuery = 'query';

///Path Parameters
const String kPathParameterForMovieID = 'movie_id';
const String kPathParameterFoActorID = 'actor_id';

///API Token
const String kApiToken = '6ba57a8fa213613268b61de49d70fffe';

///Image Prefix Link
const String kImagePrefixLink = 'https://image.tmdb.org/t/p/w500';

///Default Image
const String kDefaultImage =
    'https://www.kindpng.com/picc/m/451-4517876_default-profile-hd-png-download.png';
