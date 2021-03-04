{-# OPTIONS_GHC -fno-warn-orphans #-}
import Test.Tasty
import Test.Tasty.QuickCheck
import Data.DList
import Data.DList.Internal

instance (CoArbitrary a, Arbitrary a) => Arbitrary (DList a) where
  arbitrary = foldr cons empty <$> listOf arbitrary
  shrink (DL f) = DL <$> shrink f

instance Show a => Show (DList a) where
  show = show . toList

-- Свойства для тестирования
prop_cons :: Int -> DList Int -> Bool
prop_cons x xs = toList (x `cons` xs) == (x : toList xs)

prop_singleton :: Int -> Bool
prop_singleton x = toList (singleton x) == [x]

prop_snoc :: DList Int -> Int -> Bool
prop_snoc xs x = toList (xs `snoc` x) == (toList xs <> [x])

prop_append :: DList Int -> DList Int -> Bool
prop_append xs ys =
  toList (xs `append` ys) == (toList xs <> toList ys)

prop_append_empty :: DList Int -> Bool
prop_append_empty xs =
  toList (xs `append` empty) == toList (empty `append` xs)


main :: IO ()
main = Test.Tasty.defaultMain spec

spec :: TestTree
spec = testProperties "dlist" [
      ("cons",         property prop_cons)
    , ("singleton",    property prop_singleton)
    , ("snoc",         property prop_snoc)
    , ("append",       property prop_append)
    , ("append_empty", property prop_append_empty)
    ]
