

class ContactDeets {
   String id;
   String name;
   String phone;

  ContactDeets({
     this.id="",
     required this.name,
     required this.phone
  });

 // String get getName=>name;
 // String get getNumber=>number;

 Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'phone': phone,
      };

}

