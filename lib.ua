# Uiua Essential - closest thing to a standard library

Alphabet      ← +@a⇡26
Digits        ← +@0⇡10
Alphanumeric  ← ⊂⊂ Alphabet ⌵Alphabet Digits
Whitespace    ← " \n\r\t"
CsvDelimiters ← ",;|\t"

# Make the first character uppercase.
# result ? input
Capitalize ← ⍣(⍜⊢⌵|∘)

TrimStartMask ↚ \↥¬∈Whitespace
TrimEndMask   ↚ ⇌TrimStartMask⇌
TrimMask      ↚ ↧⊃(TrimStartMask|TrimEndMask)

# Trim whitespace from the start of a string.
TrimStart ← ▽TrimStartMask.

# Trim whitespace from the end of a string.
TrimEnd ← ▽TrimEndMask.

# Trim whitespace from both ends of a string.
Trim ← ▽TrimMask.

# Change characters in a string to uppercase.
ToUppercase ← ⌵

# Change characters in a string to lowercase.
ToLowercase ← ¯⌵

# Check if an array starts with another array.
# bool ? needle haystack
StartsWith ← ⍣(≍⟜(↙⧻)|0)

# Check if an array ends with another array.
# bool ? needle haystack
EndsWith ← ⍣(≍⟜(↙¯⧻)|0)

# Check if an array is a sub-array of another array.
# bool ? needle haystack
Contains ← /↥[⊃(/↥⌕|≍[]|≍""|≍{})]

# Split an array by delimiter.
# boxedArray ? delimiter string
SplitBy ← ⊜□⊸(¬↧1⦷)

# Join array elements with a delimiter
# array ? delimiter array
JoinWith ← /$"___"

# Match one array with another array and replece the matches with yet another array.
# result ? searchFor replaceWith subject
Replace ← (
  ⊃(=0⧻⋅⋅∘|⊙⊙∘)
  ⨬(⍜⊜∘≡⋅∘ ⊃(⊸⦷⊙⋅∘|¤⋅∘)|⋅⋅∘)
)

# Insert an array into a position of another array.
# result ? arrayToInsert position arrayToInsertInto
Insert ← (
  ◡(≥0-⊃(⧻⋅⋅∘|⋅∘))
  ⨬(⍜⊜∘(¤⊂:⊢)⊃(≥⊃(⋅∘|⇡⧻⋅⋅∘)|⋅⋅∘|∘)
  | ⊂:⊙⋅∘)
)

# Extract words from an arbitrary string.
# Mostly used to transform strings to different formats.
# boxedArray ? string
ExtractWords ← (
  # Replace non-alphanumeric characters with spaces
  ⍜▽(⋅@\s)⊸(¬∈Alphanumeric)
  # Insert a space in word boundries
  ⍜⊜∘≡(⊂⊂:" "°⊟)⦷[1 0]≠⌵..
  # Split words by spaces
  ⊜(□¯⌵)≠" ".
)

# Transform a string to PascalCase.
ToPascalCase ← /$"__"⍚Capitalize ExtractWords

# Transform a string to camelCase.
ToCamelCase ← /$"__"⍜(↘1|⍚Capitalize) ExtractWords

# Transform a string to Pascal_Snake_Case.
ToPascalSnakeCase ← /$"_\__"⍚Capitalize ExtractWords

# Transform a string to camel_Snake_Case.
ToCamelSnakeCase ← /$"_\__"⍜(↘1|⍚Capitalize) ExtractWords

# Transform a string to Train-Case.
ToTrainCase ← /$"_-_"⍚Capitalize ExtractWords

# Transform a string to snake_case.
ToSnakeCase ← /$"_\__"ExtractWords

# Transform a string to kebab-case.
ToKebabCase ← /$"_-_"ExtractWords

# Transform a string to flatcase.
ToFlatCase ← /$"__"ExtractWords

# Transform a string to UPPERFLATCASE.
ToUpperFlatCase ← ⌵ToFlatCase

# Transform a string to SCREAMING_SNAKE_CASE.
ToScreamingSnakeCase ← ⌵ToSnakeCase

# Transform a string to COBOL-CASE.
ToCobolCase ← ⌵ToKebabCase

PadGeneric! ↚ ⨬(⋅∘|^0▽⊙@\s) ⊸>0 -⊃(⧻⋅∘|∘|⋅∘)

# Add spaces to the left of the string until it matches the desired length.
# result ? targetLength string
PadLeft ← PadGeneric!⊂

# Add spaces to the right of the string until it matches the desired length.
# result ? targetLength string
PadRight ← PadGeneric!(⊂:)

# Parse CSV by a custom delimiter.
# parsedCsv ? delimiter string
ParseCsvByDelimiter ← (
  # Find string delimiters
  ◫[[2]]⊃(⊚|¤⧻)⌕"\"\"\"".:
  # Mask strings by delimiters
  ¬/↥≡(↧⊃(≥⊙⋅∘|<+3⋅⊙∘)°⊟⊙⇡)
  # Replace custom delimiter with commas
  ⍜⊜∘≡⋅@,↧1×⦷⊃(⋅⋅∘|⋅∘|∘|⋅∘)
  # Parse CSV
  °csv
)

# Parse CSV delimited by semicolons.
# parsedCsv ? string
ParseCsvBySemicolon ← ParseCsvByDelimiter ";"

# Parse CSV delimited by pipes.
# parsedCsv ? string
ParseCsvByPipe ← ParseCsvByDelimiter "|"

# Parse CSV delimited by tabs.
# parsedCsv ? string
ParseCsvByTabs ← ParseCsvByDelimiter "\t"

# Given a CSV string, find the most used character for CSV delimiter.
# delimiter ? csvString
MostCommonCsvDelimiter ← ⊡⊢⍖≡(/+∈)⊃(∘|¤⋅∘|∘) CsvDelimiters

# Parse CSV by detected delimiter.
# parsedCsv ? csvString
ParseCsv ← ParseCsvByDelimiter MostCommonCsvDelimiter.

# Filter an array given a predicate.
# filteredValues ? filterFunction arrayToFilter
Filter! ← ▽≡(^0°□).
