module Main (main) where

import Gem.Spec
import Version (version)

import Options.Applicative
import Options.Applicative.Simple (simpleOptions)

cmd :: String -> String
cmd = ("gem help specification -b " ++)

main :: IO ()
main = undefined {-do
    (opts,()) <- simpleOptions-}
