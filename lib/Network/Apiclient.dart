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

  static String RESET_PASS = '${Base_url}password/find/?code=';

  static String changeNewPass = '${Base_url}password/reset';

  static String allCompanies = '${Base_url}company/all';

  static String doctor_search = '${Base_url}Doctor/getAll/';

  static String doctor_myfav = '${Base_url}User/getFavoriteDoctors/';

  static String doctor_myappoienments = '${Base_url}User/view_reservations/';

  static String edit_profile = '${Base_url}user/editProfile/';
}
