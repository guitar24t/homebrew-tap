# Homebrew formula for rterm. The release workflow fills in 0.2.0, https://github.com/guitar24t/rterm/releases/download/v0.2.0/rterm-0.2.0-macos-universal.tar.gz
# and ab2539f77f3485de73ba13ad6fedf8eef0e7878fe23d832c5cd344366fcf829f (packaging/render-formula.sh) and publishes the result to
# https://github.com/guitar24t/homebrew-tap; edit this template, not that copy.
class Rterm < Formula
  desc "Persistent terminal sessions that behave like a plain terminal"
  homepage "https://github.com/guitar24t/rterm"
  url "https://github.com/guitar24t/rterm/releases/download/v0.2.0/rterm-0.2.0-macos-universal.tar.gz"
  version "0.2.0"
  sha256 "ab2539f77f3485de73ba13ad6fedf8eef0e7878fe23d832c5cd344366fcf829f"
  license "MIT"

  def install
    bin.install "rterm", "rterm-connect"
    doc.install "README.md"
  end

  test do
    assert_equal "rterm #{version}", shell_output("#{bin}/rterm --version").strip
    assert_match "Choose an rterm session", shell_output("#{bin}/rterm-connect --help")
    ENV["RTERM_SOCKET_DIR"] = (testpath/"sockets").to_s
    assert_equal "[]", shell_output("#{bin}/rterm ls --json").strip
  end
end
