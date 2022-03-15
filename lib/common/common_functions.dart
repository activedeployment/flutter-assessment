class CommonFunctions{
  // 1. Write a function that finds the largest and smallest numbers in an array.
  Map<String, num?> findLargestSmallest(List<num> arr){
    Map<String, num?> resultMap = {};
    num? smallestNum;
    num? largestNum;

    for(var i = 0; i < arr.length; i++){
      if(smallestNum == null){
        smallestNum = arr[i];
      }else if(arr[i] < smallestNum){
        smallestNum = arr[i];
      }

      if(largestNum == null){
        largestNum = arr[i];
      }else if(arr[i] > largestNum){
        largestNum = arr[i];
      }
    }

    resultMap['smallestNumber'] = smallestNum;
    resultMap['largestNumber'] = largestNum;

    return resultMap;
  }

  // 2.1 Write a function that removes duplicate characters from a string.
  String removeDuplicateCharacters(String inputString){
    Set<String> charactersInString = Set();
    List<String> allCharactersInString = inputString.split('');
    String resultString = '';

    allCharactersInString.forEach((element) {
      if(!charactersInString.contains(element)){
        resultString += element;
        charactersInString.add(element);
      }
    });
    return resultString;
  }

  // 2.2 Write a function that removes duplicate characters from a string.
  String removeDuplicateCharactersStringBuffer(String inputString){
    Set<String> charactersInString = Set();
    List<String> allCharactersInString = inputString.split('');
    String resultString = '';
    StringBuffer sb = StringBuffer(resultString);

    allCharactersInString.forEach((element) {
      if(!charactersInString.contains(element)){
        resultString += element;
        sb.write(element);
        charactersInString.add(element);
      }
    });
    return sb.toString();
  }

  // 3 Write a function that checks if two strings are an anagram
  bool areTwoStringsAnAnagram(String firstString, String secondString){
    bool areTwoStringsAnAnagram = false;

    Map<String, int> countPerCharacterFirstString = {};
    Map<String, int> countPerCharacterSecondString = {};
    List<String> firstStringArr = firstString.split('');
    List<String> secondStringArr = secondString.split('');

    if(firstString.length == secondString.length){
      // populate map for first string
      for(var i = 0; i < firstStringArr.length; i++){
        if(countPerCharacterFirstString[firstStringArr[i]] == null){
          countPerCharacterFirstString[firstStringArr[i]] = 1;
        }else{
          countPerCharacterFirstString[firstStringArr[i]] =
          (countPerCharacterFirstString[firstStringArr[i]] ?? 0) + 1;
        }
      }

      // populate map for second string
      for(var i = 0; i < secondStringArr.length; i++){
        if(countPerCharacterSecondString[secondStringArr[i]] == null){
          countPerCharacterSecondString[secondStringArr[i]] = 1;
        }else{
          countPerCharacterSecondString[secondStringArr[i]] =
              (countPerCharacterSecondString[secondStringArr[i]] ?? 0) + 1;
        }
      }

      areTwoStringsAnAnagram = true;
      for(var i = 0; i < countPerCharacterFirstString.entries.toList().length; i++){
        String testString = countPerCharacterFirstString.entries.toList()[i].key;
        if((countPerCharacterSecondString[testString] != countPerCharacterFirstString[testString])){
          areTwoStringsAnAnagram = false;
        }
      }
    }

    return areTwoStringsAnAnagram;
  }

  // 4 Write a regex to match an australian mobile phone number
  List<String> findAPhoneNumberUsingRegex(textToCheck){
    // phone number format reference :
    // https://en.wikipedia.org/wiki/Telephone_numbers_in_Australia
    // ten digits: 0x xxxx xxxx or
    // eleven digits: 61 4 xxxx xxxx

    RegExp tenDigitExp = RegExp(r"0\d\s\d\d\d\d\s\d\d\d\d");
    RegExp tenDigitExpNoSpaces = RegExp(r"0\d\d\d\d\d\d\d\d\d");
    RegExp elevenDigitExp = RegExp(r"61\s4\s\d\d\d\d\s\d\d\d\d");
    RegExp elevenDigitExpNoSpaces = RegExp(r"614\d\d\d\d\d\d\d\d");

    RegExp exp = tenDigitExp;
    String str = textToCheck;
    List<String> allMatches = [];
    String firstMatch = tenDigitExp.stringMatch(str) ?? '';
    String secondMatch = tenDigitExpNoSpaces.stringMatch(str) ?? '';
    String thirdMatch = elevenDigitExp.stringMatch(str) ?? '';
    String fourthMatch = elevenDigitExpNoSpaces.stringMatch(str) ?? '';

    allMatches.add(firstMatch);
    allMatches.add(secondMatch);
    allMatches.add(thirdMatch);
    allMatches.add(fourthMatch);

    return allMatches;
  }


}