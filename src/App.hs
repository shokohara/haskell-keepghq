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
  cwd <- getCurrentDirectory
  directories <- listDirectory cwd
  mapM_ putStrLn $ directories
--  pwd <- strip <$> readCreateProcess (shell "pwd") ""
--  readCreateProcess (shell "ls") "" >>= putStrLn
  mapM (\pwd -> readCreateProcess (shell $ "git -C " ++ pwd ++ " status") "" >>= putStrLn) directories
  return ()
