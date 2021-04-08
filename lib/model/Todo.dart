
class Todo {
  int _id;
  String _title;
  String _description;
  String _date;
  int _priority;

  Todo(this._title, this._priority, this._date, [this._description]);

  Todo.withId(this._id, this._title, this._priority, this._date,
      [this._description]);

  int get id => _id;

  String get desc => _description;

  String get title => _title;

  String get date => _date;

  int get priority => _priority;

  set title(String newTitle) {
    if (newTitle.length <= 255) {
      _title = newTitle;
    }
  }

  set description(String newDescription) {
    if (newDescription.length <= 255) {
      _description = newDescription;
    }
  }

  set priority(int newPriority) {
    if (newPriority > 0 && newPriority <= 3) {
      _priority = newPriority;
    }
  }

  set date(String newDate) {
    _date = newDate;
  }

  Map<String, dynamic> topMap() {
    var map = Map<String, dynamic>();
    map["title"] = _title;
    map["description"] = _description;
    map["date"] = _date;
    map["priority"] = _priority;
    if (_id != null) {
      map["id"] = _id;
    }

    return map;
  }

  Todo.fomObject(dynamic o){
    this._id = o["id"];
    this._description = o["description"];
    this._date = o["date"];
    this._priority = o["priority"];
    this._title = o["title"];
  }
}
