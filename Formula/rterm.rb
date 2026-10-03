# Homebrew formula for rterm. The release workflow fills in 0.1.4, https://github.com/guitar24t/rterm/releases/download/v0.1.4/rterm-0.1.4-macos-universal.tar.gz
# and 5b586349c92958403013540d7eb1fadd7a8a9cab1823191ae6bed89ac917e30e (packaging/render-formula.sh) and publishes the result to
# https://github.com/guitar24t/homebrew-tap; edit this template, not that copy.
class Rterm < Formula
  desc "Persistent terminal sessions that behave like a plain terminal"
  homepage "https://github.com/guitar24t/rterm"
  url "https://github.com/guitar24t/rterm/releases/download/v0.1.4/rterm-0.1.4-macos-universal.tar.gz"
  version "0.1.4"
  sha256 "5b586349c92958403013540d7eb1fadd7a8a9cab1823191ae6bed89ac917e30e"
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
