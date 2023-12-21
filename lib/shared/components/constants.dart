String serverApi = 'https://newsapi.org/';
String urlSearchMethod = 'v2/everything';
String urlMethod = 'v2/top-headlines';
// q=bitcoin&apiKey=76ef5e262b9a41a89fe2507ac6d7f8f4
// Map<String, dynamic> searchAPI = {
//   'q': 'science',
//   'apiKey': '76ef5e262b9a41a89fe2507ac6d7f8f4',
// };
Map<String, dynamic> businessAPI = {
  'country': 'eg',
  'category': 'science',
  'apiKey': '3d7b81f1a1e94dfaadb9eb5cde0a3d65',
};
Map<String, dynamic> scienceAPI = {
  'country': 'eg',
  'category': 'science',
  'apiKey': '3d7b81f1a1e94dfaadb9eb5cde0a3d65',
};
Map<String, dynamic> sportsAPI = {
  'country': 'eg',
  'category': 'sports',
  'apiKey': '3d7b81f1a1e94dfaadb9eb5cde0a3d65',
};

Map<String, dynamic> allDataConst = {};

Map<String, dynamic> businessDataConst = {};

Map<String, dynamic> sportsDataConst = {};

Map<String, dynamic> scienceDataConst = {};
