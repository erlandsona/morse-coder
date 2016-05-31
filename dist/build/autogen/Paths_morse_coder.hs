module Paths_morse_coder (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/erlandsona/Library/Haskell/bin"
libdir     = "/Users/erlandsona/Library/Haskell/ghc-7.10.3-x86_64/lib/morse-coder-0.1.0.0"
datadir    = "/Users/erlandsona/Library/Haskell/share/ghc-7.10.3-x86_64/morse-coder-0.1.0.0"
libexecdir = "/Users/erlandsona/Library/Haskell/libexec"
sysconfdir = "/Users/erlandsona/Library/Haskell/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "morse_coder_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "morse_coder_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "morse_coder_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "morse_coder_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "morse_coder_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
