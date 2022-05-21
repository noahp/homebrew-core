class Typedb < Formula
  desc "Distributed hyper-relational database for knowledge engineering"
  homepage "https://vaticle.com/"
  url "https://github.com/vaticle/typedb/releases/download/2.9.0/typedb-all-mac-2.9.0.zip"
  sha256 "3c8a57e63cb83d0a1862cd41e1334774114ce3f67b4d21d0dd388dcbce873754"
  license "AGPL-3.0-or-later"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "1be74c2f0c447522b3bbab166b1503bd34ce5dddfd2c2b39d34a8986bb1282e5"
  end

  depends_on "openjdk@11"

  def install
    libexec.install Dir["*"]
    bin.install libexec/"typedb"
    bin.env_script_all_files(libexec, Language::Java.java_home_env("11"))
  end

  test do
    assert_match "A STRONGLY-TYPED DATABASE", shell_output("#{bin}/typedb server --help")
  end
end
