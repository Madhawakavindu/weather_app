class UtilFunctions {
  //condition ek anuw adala lottie animation ek return karanna puluwn method ekk hadanna
  String getWeatherAnimation({required String condition}) {
    switch (condition.toLowerCase()) {
      case "clouds":
      case "mist":
      case "haze":
      case "smoke":
      case "dust":
      case "fog":
        return "assets/cloudy.json";

      case "rain":
      case "drizzle":
      case "shower rain":
        return "assets/rain.json";

      case "thunderstorm":
        return "assets/thunder.json";

      case "clear":
        return "assets/sunny.json";

      default:
        return "assets/sunny.json";
    }
  }
}
