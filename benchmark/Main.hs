{-# OPTIONS_GHC -fno-warn-orphans #-}
{-# LANGUAGE StandaloneDeriving, GeneralizedNewtypeDeriving #-}
import Criterion.Main
import Data.DList
import Control.DeepSeq
import Data.DList.Internal

deriving instance NFData a => NFData (DList a)

main :: IO ()
main = defaultMain $
     map (\l -> bench ("concat list " <> show l) . nf (uncurry (++)) $ lists l) lengths
  <> map (\l -> bench ("concat dlist " <> show l) . nf (uncurry append) $ dlists l) lengths
  where
  lengths = [10, 100, 1000, 10000]
  lists len = (replicate len 'a', replicate len 'b')
  dlists len = (foldr cons empty $ replicate len 'a', foldr cons empty $ replicate len 'b')
