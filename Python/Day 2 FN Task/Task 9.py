word = input('Enter word : ')
if word.lower() == word[::-1].lower():
    print(word,'Is palindrome')
else:
    print(word,' Is not Palindrome')