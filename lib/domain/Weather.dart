class Weather {
   String location;
   String temperature;
   String description;
   String main;

  Weather({required this.location, required this.temperature, required this.description, required this.main});

  Weather(
  location: '00',
  temperature: '20',
  description: 'no Data',
  main: 'no Data',
  );
}