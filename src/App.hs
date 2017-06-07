{-# LANGUAGE OverloadedStrings #-}

module App where

import GHC.Generics (Generic)
import Control.Lens ((&), (.~), (<&>), (?~))
import System.IO (stdout)
import System.Directory
import System.Process
import Data.String.Utils

run :: IO ()
run = do
  putStrLn "start"
  dirs <- lines <$> readCreateProcess (shell $ "find . -maxdepth 1 -type d") ""
  mapM (\pwd -> readCreateProcess (shell $ "git -C " ++ pwd ++ " status") "" >>= putStrLn) dirs
  return ()
