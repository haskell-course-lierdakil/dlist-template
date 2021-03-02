-- | An example module.
module Data.DList (
    DList
  , cons
  , empty
  , singleton
  , toList
  , snoc
  , append
  ) where

import Data.DList.Internal

infixr `cons`
cons :: a -> DList a -> DList a
cons x xs = DL ((x:) . unDL xs)

-- 1. Конструирует пустой DList
empty :: DList a
empty = undefined

-- 2. Конструирует DList из одного элемента
singleton :: a -> DList a
singleton = undefined

-- 3. Преобразует DList в обычный список
toList :: DList a -> [a]
toList = undefined

-- 4. Добавляет элемент в конец DList
infixl `snoc`
snoc :: DList a -> a -> DList a
snoc = undefined

-- 5. Конкатенация DList
append :: DList a -> DList a -> DList a
append = undefined
