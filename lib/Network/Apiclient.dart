class Apiclient {
  /**
   * DOMAIN NAME
   */

  static String Base_url = "http://vouchers-sa.com/api/";

  /**
   * ALL URL
   */

  static String login = '${Base_url}auth/login';

  static String sign_up = '${Base_url}auth/signup';

  static String forget_pass = '${Base_url}password/create';

  static String get_all_doctors = '${Base_url}Doctor/getAll/';

  static String get_search_doctors = '${Base_url}Search/index/';

  static String doctor_details = '${Base_url}Doctor/view/';

  static String doctor_search = '${Base_url}Doctor/getAll/';

  static String doctor_myfav = '${Base_url}User/getFavoriteDoctors/';

  static String doctor_myappoienments = '${Base_url}User/view_reservations/';

  static String edit_profile = '${Base_url}user/editProfile/';
}
