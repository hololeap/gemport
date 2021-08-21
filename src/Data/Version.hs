{-# Language DeriveAnyClass #-}
{-# Language DeriveGeneric #-}
{-# Language DeriveLift #-}
{-# Language FlexibleInstances #-}
{-# Language ImportQualifiedPost #-}
{-# Language MultiParamTypeClasses #-}
{-# Language TypeSynonymInstances #-}

module Data.Version where

import Control.DeepSeq (NFData)
import Data.Aeson
import Data.List (intercalate)
import Data.List.NonEmpty (NonEmpty(..))
import Data.List.NonEmpty qualified as NE
import Data.Void (Void)
import GHC.Generics
import GHC.Natural
import Text.Megaparsec
import Text.Megaparsec.Char (char)
import Text.Megaparsec.Char.Lexer (decimal)
import ValidLiterals

type Parser = Parsec Void String

newtype Version = Version { getVersion :: NonEmpty Natural }
    deriving (Show, Generic, ToJSON, FromJSON, Lift, NFData)

instance Validate String Version where
    fromLiteral = parseMaybe parser

parser :: Parser Version
parser = do
    l <- sepBy1 decimal (char '.')
    case NE.nonEmpty l of
        Just ne -> pure $ Version ne
        Nothing -> empty

toString :: Version -> String
toString = intercalate "." . NE.toList . fmap show . getVersion
