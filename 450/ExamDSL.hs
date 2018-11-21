{- CSci 450/503, Fall 2018
   Homework #4:  Exam DSL Project Code Skeleton
   Gregory Phillips 
   10678899

   ExamDSL.hs

-}

module ExamDSL where

    -- instructor used these in his solution
    import Data.List ( delete, intercalate, intersect )
    
    import SimpleHTML (
          HTML, ListType(..), LangType(..),
          to_html, to_body, to_heading, to_list, to_li
        )
    
    type Tag      = String
    type QText    = String
    data Question = Ask [Tag] QText [Choice] deriving Show
    
    type AText    = String
    data Choice   = Answer AText Bool deriving (Eq, Show)
    
    type Title    = String
    data Exam     = Quiz Title [Question] deriving Show
    
    -- Exercise Set A
    
    -- #A1
    correctChoice :: Choice -> Bool
    correctChoice (Answer choice True) = True
    correctChoice (Answer choice False) = False
    
    -- #A2
    lenQuestion :: Question -> Int
    lenQuestion (Ask [tag] text [choice]) = length ([choice])

    -- #A3
    validQuestion :: Question -> Bool
    validQuestion question = True
    validQuestion _ = False
    
    -- #A4
    hasTag :: Question -> Tag -> Bool
    hasTag (Ask [tag] text [choice]) tag2
      | tag2 `elem` [] = False
      | tag2 `elem` [tag] = True
      | otherwise = False
    
    -- #A5q0
    eqBag :: Eq a => [a] -> [a] -> Bool
    eqBag (x:xs) y = elem x y && eqBag xs y
    equals x y = eqBag x y && eqBag y x
    
    -- #A6
    instance Eq Question where
    Ask [tag] _ _ == Ask [tag2] _ _ = True
    Ask _ qText _ == Ask _ qText2 _ = True
    Ask _ _ [choice] == Ask _ _ [choice2] = True
    _ == _ = False
    
    -- #A7
    selectByTags :: [Tag] -> Exam -> Exam
    selectByTags [tag:xs] exam = exam
    selectByTags [] exam = exam
    selectByTags _ exam = exam
    
    
      -- #A8
    validExam :: Exam -> Bool 
    validExam exam = True
    validExam _ = False
    
    -- #A9
    
    -- Exercise Set B
    makeKey :: Exam -> [(Int,Char)]
    makeKey (Quiz title [(Ask [tag] text [choice])]) = [(int, char)] 
      where 
        int = 1
        a =  map correctChoice ([choice])
        char = 'b'
        
       
    
    -- might be useful
    newline :: String
    newline = "\n"
    
    -- might be useful
    block :: HTML -> HTML
    block str = newline ++ str ++ newline
    
    choice2html :: Choice -> HTML
    choice2html (Answer text _) = to_li text
    
    -- #B1
    question2html :: Question -> HTML
    question2html (Ask [tag] text [choice] ) = to_body text
    
    -- #B2
    -- exam2html :: Exam -> HTML
    
    -- Test data given in description
    q0 = Ask ["curriculum"]
             "Which one of the following is a required course?"
             [ Answer "CSci 323" False, 
               Answer "CSci 450" True, 
               Answer "CSci 525" False ]

    q1 = Ask ["language","course"]
              "What one of the following is used in CSci 450?"
              [ Answer "Lua" False,
                Answer "Elm" False,
              Answer "Haskell" True ]
      
    e0 = Quiz "Curriclum Test" [
             Ask ["curriculum"]
                 "Which one of the following courses is required?"
                 [ Answer "CSci 323" False, 
                   Answer "CSci 450" True, 
                   Answer "CSci 525" False ],
             Ask ["language","course"]
                 "What one of the following is used in CSci 450?"
                 [ Answer "Lua" False,
                   Answer "Elm" False,
                   Answer "Haskell" True ]
             ]