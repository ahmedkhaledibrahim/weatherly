class Forecast {
  final String text;
  final String category;
  final String minimum;
  final String maximum;
  final String dayPhrase;
  final String nightPhrase;

  Forecast({required this.text,
    required this.category,
    required this.dayPhrase,
    required this.maximum,
    required this.minimum,
    required this.nightPhrase});

  factory Forecast.fromJson(Map<String, dynamic> json){
    return Forecast(text: json['Headline']['Text'],
        category: json['Headline']['Category'],
        dayPhrase: json['DailyForecasts'][0]['Day']['IconPhrase'],
        maximum: ((double.parse(json['DailyForecasts'][0]['Temperature']['Maximum']['Value'].toString())-32) * 5/9).toStringAsFixed(0) ,
        minimum: ((double.parse(json['DailyForecasts'][0]['Temperature']['Minimum']['Value'].toString())-32) * 5/9).toStringAsFixed(0) ,
        nightPhrase: json['DailyForecasts'][0]['Night']['IconPhrase'],);
  }

}
