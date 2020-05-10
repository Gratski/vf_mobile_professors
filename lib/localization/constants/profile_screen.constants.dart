class ProfileScreenConstants {

  String aboutLabel(String code) {
    return "PROFILE_SCREEN_ABOUT_${suffixByLanguageCode(code)}";
  }

  String quoteLabel(String code) {
    return "PROFILE_SCREEN_QUOTE_${suffixByLanguageCode(code)}";
  }

  String teachesLabel(String code) {
    return "PROFILE_SCREEN_TEACHES_${suffixByLanguageCode(code)}";
  }

  String commentsLabel(String code) {
    return "PROFILE_SCREEN_COMMENTS_${suffixByLanguageCode(code)}";
  }

  String noCommentsLabel(String code) {
    return "PROFILE_SCREEN_NO_COMMENTS_${suffixByLanguageCode(code)}";
  }

  String suffixByLanguageCode(String code) {
    switch(code.toUpperCase()) {
      case 'EN': return 'EN';
      case 'PT': return 'PT';
      case 'ES': return 'ES';
      case 'FR': return 'FR';
      default: return 'EN';
    }
  }

}