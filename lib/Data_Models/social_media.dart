class SocialMedia{
  String? mediaName, mediaUrl, mediaBackground;

  SocialMedia(this.mediaName, this.mediaUrl, this.mediaBackground);

  static List<SocialMedia> socialMediaList = [
    new SocialMedia("Official Facebook", "https://www.facebook.com/UniversityofTheBah/", "assets/images/ub_logo.jpeg"),
    new SocialMedia("Official Instagram", "https://www.instagram.com/universityofthebahamas/", "assets/images/ub_fit.png"),
    new SocialMedia("Athletics Facebook", "https://www.facebook.com/UBMINGOES/", "assets/images/ub_athletics.png"),
    new SocialMedia("Athletics Instagram", "https://www.instagram.com/mingoes242/?hl=en", "assets/images/ub_mingo_suit.jpeg"),
    new SocialMedia("Chapter One Facebook", "https://www.facebook.com/chapterone.ub.bs/", "assets/images/ub_bookstore_logo.png"),
    new SocialMedia("Chapter One Instagram", "https://www.instagram.com/chapterone.ub.bs/?hl=en", "assets/images/ub_bookstore_banner.jpeg"),
  ];

}