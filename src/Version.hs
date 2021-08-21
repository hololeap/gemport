{-# Language TemplateHaskell #-}

module Version (version) where

import Data.Version
import ValidLiterals

version :: Version
version = $$(valid "0.1.0.0")
