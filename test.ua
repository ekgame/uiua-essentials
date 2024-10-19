~ "lib.ua"
  ~ Capitalize ExtractWords
  ~ Contains EndsWith StartsWith
  ~ Filter!
  ~ Insert JoinWith Replace SplitBy
  ~ PadLeft PadRight
  ~ ToCamelCase ToCamelSnakeCase ToPascalCase ToPascalSnakeCase
  ~ ToCobolCase ToScreamingSnakeCase
  ~ ToFlatCase ToKebabCase ToSnakeCase ToTrainCase ToUpperFlatCase
  ~ ToLowercase ToUppercase
  ~ Trim TrimEnd TrimStart

⍤⤙≍ "Test" Capitalize "test"
⍤⤙≍ "" Capitalize ""

⍤⤙≍ "test" TrimStart " \n\t\rtest"
⍤⤙≍ "test" TrimEnd "test \n\t\r"
⍤⤙≍ "test" Trim " \n\t\rtest \n\t\r"

⍤⤙≍ "TEST" ToUppercase "test"
⍤⤙≍ "test" ToLowercase "TEST"

⍤⤙≍ 1 StartsWith "hello" "hello world"
⍤⤙≍ 0 StartsWith "world" "hello world"
⍤⤙≍ 1 StartsWith "" "hello world"
⍤⤙≍ 0 StartsWith "hello" ""

⍤⤙≍ 1 EndsWith "world" "hello world"
⍤⤙≍ 0 EndsWith "hello" "hello world"
⍤⤙≍ 1 EndsWith "" "hello world"
⍤⤙≍ 0 EndsWith "world" ""

⍤⤙≍ 1 Contains "world" "hello world"
⍤⤙≍ 0 Contains "universe" "hello world"
⍤⤙≍ 1 Contains "" "hello world"
⍤⤙≍ 0 Contains "world" ""
⍤⤙≍ 1 Contains "" ""

⍤⤙≍ {"hello" "world" "yo"} SplitBy "-" "hello-world-yo"
⍤⤙≍ {"hello" "world" "yo"} SplitBy ", " "hello, world, yo"

⍤⤙≍ "hello-world-yo" JoinWith "-" {"hello" "world" "yo"}
⍤⤙≍ "hello, world, yo" JoinWith ", " {"hello" "world" "yo"}

⍤⤙≍ "hello universe" Replace "world" "universe" "hello world"
⍤⤙≍ "hello world" Replace "universe" "galaxy" "hello world"
⍤⤙≍ "hello world" Replace "" "test" "hello world"
⍤⤙≍ "helloworld" Replace " " "" "hello world"
⍤⤙≍ "" Replace "anything" "something" ""

⍤⤙≍ "hello world" Insert " " 5 "helloworld"
⍤⤙≍ "start hello" Insert "start " 0 "hello"
⍤⤙≍ "hello end" Insert " end" 5 "hello"
⍤⤙≍ "hello" Insert "" 2 "hello"
⍤⤙≍ "test" Insert "test" 0 ""
⍤⤙≍ "starthello" Insert "start" 0 "hello"
⍤⤙≍ "hello world" Insert " world" 5 "hello"

⍤⤙≍ {"hello" "world" "123" "456" "yo"} ExtractWords "helloWorld123_456-yo"
⍤⤙≍ {"hello" "world" "yo" "haha"} ExtractWords "helloWorldYoHaha"

⍤⤙≍ "HelloWorld123456Yo" ToPascalCase "helloWorld123_456-yo"
⍤⤙≍ "helloWorld123456Yo" ToCamelCase "helloWorld123_456-yo"
⍤⤙≍ "Hello_World_123_456_Yo" ToPascalSnakeCase "helloWorld123_456-yo"
⍤⤙≍ "hello_World_123_456_Yo" ToCamelSnakeCase "helloWorld123_456-yo"
⍤⤙≍ "Hello-World-123-456-Yo" ToTrainCase "helloWorld123_456-yo"
⍤⤙≍ "hello_world_123_456_yo" ToSnakeCase "helloWorld123_456-yo"
⍤⤙≍ "hello-world-123-456-yo" ToKebabCase "helloWorld123_456-yo"
⍤⤙≍ "helloworld123456yo" ToFlatCase "helloWorld123_456-yo"
⍤⤙≍ "HELLOWORLD123456YO" ToUpperFlatCase "helloWorld123_456-yo"
⍤⤙≍ "HELLO_WORLD_123_456_YO" ToScreamingSnakeCase "helloWorld123_456-yo"
⍤⤙≍ "HELLO-WORLD-123-456-YO" ToCobolCase "helloWorld123_456-yo"

⍤⤙≍ "    hello" PadLeft 9 "hello"
⍤⤙≍ "hello" PadLeft 5 "hello"
⍤⤙≍ "hello world" PadLeft 5 "hello world"
⍤⤙≍ "     " PadLeft 5 ""

⍤⤙≍ "hello    " PadRight 9 "hello"
⍤⤙≍ "hello" PadRight 5 "hello"
⍤⤙≍ "hello world" PadRight 5 "hello world"
⍤⤙≍ "     " PadRight 5 ""

⍤⤙≍ [1 2 3] Filter!(>0) [¯1 ¯2 ¯3 1 2 3]
