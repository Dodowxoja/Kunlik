class UserData {
  static List<Map<String, String>> phoneNumber = [
    {
      "id": "0",
      "userName": "Dodow",
      "number": "+998977503171",
      "password": "123456",
    },
  ];

  a() {
    phoneNumber.setAll(phoneNumber.length, [
      {
        "id": "${phoneNumber.length}",
        "userName": "Muhammadxo'ja",
        "number": "+998987073171",
        "password": "123456",
      }
    ]);
  }
}
