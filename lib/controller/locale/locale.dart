import 'package:get/get.dart';

class MyLocale implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en": {
          "lang": "EN",
          "nameLogo": "Mostshary",
          "subjectTitle":
              "Achieving What you thik has become easy, all you have to do is start and ask what's on you mind",
          "titleButtonHome": "Let's Chat"
        },
        "ar": {
          "lang": "AR",
          "nameLogo": "متشاري",
          "subjectTitle":
              "اصبح تحقيق ما تفكر به امرا سهلا, كل ما عليك سوا البدء واطلب ما تريد",
          "titleButtonHome": "ابدأ المحادثة"
        },
      };
}
