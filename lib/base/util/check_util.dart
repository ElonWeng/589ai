class CheckUtil {
    //检查邮箱账号是否合法
    static bool isValidEmail(String email) {
      final RegExp emailRegex = RegExp(
        r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
      );
      return emailRegex.hasMatch(email);
    }
}
