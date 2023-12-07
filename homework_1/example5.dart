void printUserInfo({String? name,String? surname, int? age, String? country}) {
  String userName = name ?? "Anonymous";
  String surName = surname ?? "Anonymous";
  int userAge = age ?? 0;
  String userCountry = country ?? "Unknown";

  print("Name: $userName,Surname: $surName,Age: $userAge, Country: $userCountry");
}

void main() {
  // Example usage of the function with nullable parameters
  printUserInfo(name: "Pash",surname: "Piloyan", age: 25, country: "USA");
  printUserInfo(name: "Mko hopar", country: "Canada");
  printUserInfo(age: 30); // Providing only the age
  printUserInfo(); // Calling the function without any parameters
}
