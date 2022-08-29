class Ncp < Formula
  desc "Safe replacement for 'cp' with progress indication."
  homepage "https://github.com/lechium/ncp"
  url "https://github.com/lechium/ncp.git",
    tag:      "1.0",
    revision: "ef5f0ed3829cb3bed527af6d812d5fbd1642a136"
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
