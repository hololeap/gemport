{-# Language DuplicateRecordFields #-}

module Gem.Spec where

import Data.Conduit
import Data.Conduit.Process (sourceCmdWithStreams)
import Data.Text
import Data.Time.Clock (UTCTime)
import Data.Yaml
import System.Exit (ExitCode)

data Spec = Spec
    { name :: Text
    , version :: [Int]
    , platform :: Text
    , authors :: [Text]
    , date :: UTCTime
    , dependencies :: [Dependency]
    }

data Dependency = Dependency
