import 'dart:io';

class PalindromeChecker {
  String reverseSentence(String sentence) {
    List<String> words = sentence.split(' ');
    List<String> reversedWords =
        words.map((word) => word.split('').reversed.join()).toList();
    return reversedWords.join(' ');
  }

  bool isPalindrome(String sentence) {
    String reversedSentence = reverseSentence(sentence);
    return sentence.replaceAll(' ', '') == reversedSentence.replaceAll(' ', '');
  }
}

void main() {
  var checker = PalindromeChecker();
  stdout.write('Masukkan kalimat: ');
  String inputSentence = stdin.readLineSync()!;

  String reversedSentence = checker.reverseSentence(inputSentence);
  print('Hasil: $reversedSentence');

  if (checker.isPalindrome(inputSentence)) {
    print('Palindrome');
  } else {
    print('Bukan palindrome');
  }
}
