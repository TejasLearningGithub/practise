class Student{
  int? id;
  String? name;
  String? age;

  Student({
     this.id,
    this.name,
    this.age
});

 MyStudMap() {
    // Map<String,dynamic>studentMap = Map<String,dynamic>();
    var studentMap = Map<String,dynamic>();
    studentMap['id'] = id ?? null;
    studentMap['nameS'] = name;
    studentMap['ageS'] = age;
    return studentMap;
  }
}