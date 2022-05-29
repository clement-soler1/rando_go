class Profile {
  String firstname;
  String name;
  String photo;
  String phonenumber;
  String birthdate;//"yyyy-mm-dd" format

  Profile(this.firstname, this.name, this.photo, this.phonenumber, this.birthdate);

  bool isBirthdayToday() {
    DateTime today = DateTime.now();
    DateTime birthday = DateTime.parse(this.birthdate);
    return today.day == birthday.day && today.month == birthday.month;
  }

  DateTime getBirthDate() {
    return DateTime.parse(this.birthdate);
  }

  String getFormatBirthDate() {
    DateTime birthday = DateTime.parse(this.birthdate);
    return "" + birthday.day.toString() + "/" + birthday.month.toString() + "/" + birthday.year.toString();
  }

  DateTime birthdateThisYear() {
    DateTime birthday = DateTime.parse(this.birthdate);
    return DateTime(DateTime.now().year,birthday.month,birthday.day);
  }

  int getAge() {
    DateTime today = DateTime.now();
    DateTime birthday = DateTime.parse(this.birthdate);
    return  (today.difference(birthday).inDays / 365).floor();
  }

  int getNextAge() {
    DateTime today = DateTime.now();
    DateTime birthday = DateTime.parse(this.birthdate);
    return  (today.difference(birthday).inDays / 365).ceil();
  }

  String getDaysLast() {
    DateTime today = DateTime.now();
    DateTime birthday = DateTime.parse(this.birthdate);

    DateTime nextBirthday = birthdateThisYear();
    Duration diffToBirthday = nextBirthday.difference(today);

    if (nextBirthday.isBefore(today) && !isBirthdayToday()) {
      return "Fêtera son anniversaire l'année prochaine";
    }

    if (diffToBirthday.compareTo(Duration(days: 31)) > 0) {
      int mo = (diffToBirthday.inDays / 31).ceil();
      return "Fêtera son anniversaire dans $mo mois";
    }

    if (isBirthdayToday()) {
      int mo = (diffToBirthday.inDays / 31).ceil();
      return "Fête son anniversaire aujourd'hui !";
    }

    if (today.day+1 == birthday.day && today.month == birthday.month) {
      return "Fêtera son anniversaire demain !";
    }

    int da = (diffToBirthday.inHours / 24).ceil();
    return "Fêtera son anniversaire dans $da jours";

  }

  String getFullName() {
    return "$firstname $name";
  }

  String getPhoto() {
    return photo;
  }
}

/*main() {
  Profile p = new Profile("Clément", "Soler", "", "0674720143", "2000-10-06");
  print(p.isBirthdayToday());
  print(p.getBirthDate());
  print(p.getFormatBirthDate());
  print(p.birthdateThisYear());
  print(p.getAge());
  print(p.getNextAge());
  print(p.getDaysLast());
}*/