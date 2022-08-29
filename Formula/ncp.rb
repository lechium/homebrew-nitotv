class Ncp < Formula
  desc "Safe replacement for 'cp' with progress indication."
  homepage "https://github.com/lechium/ncp"
  url "https://github.com/lechium/ncp.git",
    revision: "0a495fe2954da4161bd8679a2bb2f725a0c5abb9"
  license "MIT"
  head "https://github.com/lechium/ncp.git",
    branch: "master"

  def install
    cmd = "mkdir build"
    value = `#{cmd}`
    print value
    system ENV.cc,  "-o", "build/ncp", "ncp/main.m", "ncp/NSFileManager+Size.m", "ncp/KBProgress.m", "ncp/RSTLCopyOperation.m"
                    "-Incp"
    bin.install "build/ncp"
  end

  test do
    system bin/"ncp"
  end
end
