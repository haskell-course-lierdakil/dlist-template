module Data.DList.Internal where

newtype DList a = DL { unDL :: [a] -> [a] }
