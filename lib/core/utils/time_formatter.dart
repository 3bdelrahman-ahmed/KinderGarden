String formatTimeString(String dateString) {
  // Parse the date string into a DateTime object
  DateTime dateTime = DateTime.parse(dateString);
  
  // Extract the time components
  String hour = dateTime.hour.toString();
  String minute = dateTime.minute.toString();

  // Format the time as "9:00"
  String formattedTime = hour.padLeft(2, '0') + ":" + minute.padLeft(2, '0');
  
  return formattedTime;
}
