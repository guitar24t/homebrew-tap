# Homebrew formula for rterm. The release workflow fills in 0.3.0, https://github.com/guitar24t/rterm/releases/download/v0.3.0/rterm-0.3.0-macos-universal.tar.gz
# and 6f0fd415f57cb9d8615369b56852164d0830d88abeeb796f3886f93dbf4c75c4 (packaging/render-formula.sh) and publishes the result to
# https://github.com/guitar24t/homebrew-tap; edit this template, not that copy.
class Rterm < Formula
  desc "Persistent terminal sessions that behave like a plain terminal"
  homepage "https://github.com/guitar24t/rterm"
  url "https://github.com/guitar24t/rterm/releases/download/v0.3.0/rterm-0.3.0-macos-universal.tar.gz"
  version "0.3.0"
  sha256 "6f0fd415f57cb9d8615369b56852164d0830d88abeeb796f3886f93dbf4c75c4"
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
