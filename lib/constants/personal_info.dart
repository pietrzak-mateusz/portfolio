import 'dart:convert';

/// Personal information storage with basic bot protection.
/// 
/// Uses Base64 encoding to obscure the email address from simple scrapers.
/// The email is never stored as a complete string in the compiled code.
class PersonalInfo {
  // The name and surname are not encoded
  static const String name = 'Lucynka'; // name
  static const String surname = 'Klusi'; // surname

  // Class for securely storing and providing contact information
  /// HOW IT WORKS:
  /// The email is split into 4 parts and each is encoded in Base64.
  /// Base64 is a method of encoding text using only safe characters (A-Z, a-z, 0-9, +, /)
  /// 
  /// WHY THIS WORKS:
  /// 1. Simple email-harvester bots look for patterns like "something@something.com" in HTML/JS code
  /// 2. In the compiled main.dart.js file there are only encoded strings
  /// 3. Bots don't know these strings are email fragments - they look like random data
  /// 4. Decoding happens ONLY in the user's browser (runtime)
  /// 
  /// PROTECTION LEVEL:
  /// - Stops the vast majority of simple bots (they don't see the email pattern)
  /// - Does NOT stop advanced bots that execute JavaScript
  /// 

  // Each part of the email is encoded separately in Base64
  // Splitting into parts further complicates automatic detection
  
  static const String _part1 = 'bHVjeQ=='; // name
  static const String _part2 = 'a2x1c2k='; // surname
  static const String _part3 = 'Z21haWw='; // gmail
  static const String _part4 = 'Y29t';     // com
  
  /// DECODING PROCESS:
  /// 1. Each part is decoded from Base64 back to text
  /// 2. Parts are combined into a complete email address
  /// 3. This happens at RUNTIME (when the user visits the page)
  /// 4. The full email is never in the static source code
  static String get contactAddress {
    // Helper function for Base64 decoding
    // base64.decode() returns a list of bytes, which we convert to String
    String decode(String encoded) => String.fromCharCodes(base64.decode(encoded));
    
    // Assemble email from 4 decoded parts:
    return '${decode(_part1)}${decode(_part2)}@${decode(_part3)}.${decode(_part4)}';
  }
}

// ============================================
// HOW TO USE IN CODE:
// ============================================

/// Example 1: Displaying email as text
/*
Text(
  PersonalInfo.contactAddress,
  style: TextStyle(color: Colors.white),
)
*/

// ============================================
// HOW TO ENCODE YOUR OWN EMAIL:
// ============================================
/// Free online tool: https://www.base64encode.org/
/// or helper function to encode text to Base64
/// (you don't need it in production code, only for testing)
/*
String encodeToBase64(String text) {
  return base64.encode(utf8.encode(text));
}
*/
/// Usage example:
/*
void main() {
  print(encodeToBase64('jan'));      // amFu
  print(encodeToBase64('kowalski')); // a293YWxza2k=
  print(encodeToBase64('gmail'));    // Z21haWw=
  print(encodeToBase64('com'));      // Y29t
}
*/

// ============================================
// WHAT A BOT SEES IN THE COMPILED CODE:
// ============================================

/// In main.dart.js after flutter build web you'll see something like:
/*
var _part1 = "bHVjeQ==";
var _part2 = "a2x1c2s=";
var _part3 = "Z21haWw=";
var _part4 = "Y29t";
*/

// And somewhere else the Base64 decoding functions
// The bot does NOT see the "something@something.com" pattern so it won't recognize the email
