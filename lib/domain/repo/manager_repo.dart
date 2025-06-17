abstract class ManagerRepo {
  Future<void> renew(int month);
  Future<void> confirm();
Future<List<>> get_subscribed_labs();
Future<List<>> get_subscribed_clinics();

}
