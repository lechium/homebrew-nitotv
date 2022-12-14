class Ncp < Formula
  desc "Safe replacement for 'cp' with progress indication."
  homepage "https://github.com/lechium/ncp"
  url "https://github.com/lechium/ncp.git",
    tag: "1.1",
    revision: "0a495fe2954da4161bd8679a2bb2f725a0c5abb9"
  license "MIT"
  head "https://github.com/lechium/ncp.git",
    branch: "master"

  def install
    cmd = "mkdir build"
    value = `#{cmd}`
    print value
    system ENV.cc,  "-o", "build/ncp", "ncp/main.m", "ncp/NSFileManager+Size.m", "ncp/KBProgress.m", "ncp/RSTLCopyOperation.m",
                    "-Incp", "-I.", "-framework", "Foundation", "-include", "ncp/ncp-Prefix.pch"
    bin.install "build/ncp"
    man1.install "ncp.1.gz" 
  end

  test do
    system bin/"ncp"
  end
end
