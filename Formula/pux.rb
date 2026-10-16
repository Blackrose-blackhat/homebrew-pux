class Pux < Formula
  desc "Ambient CI companion – watches pipelines and generates AI-ready failure context"
  homepage "https://github.com/Blackrose-blackhat/pux"
  url "https://registry.npmjs.org/pux.sh/-/pux.sh-0.1.6.tgz"
  sha256 "c6d9378b9aad8da90acdacc6e290ed3cf022f08b57d0a6c0978b54174ab4da92"
  license "MIT"

  depends_on "node@22"

  def install
    system "npm", "install", *std_npm_args
    # node@22 is keg-only and the npm shebang is `#!/usr/bin/env node`, so
    # install a wrapper that puts node@22 on PATH instead of a bare symlink.
    (bin/"pux").write_env_script libexec/"bin/pux", PATH: "#{formula_opt_bin("node@22")}:${PATH}"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pux --version")
    assert_match "serve", shell_output("#{bin}/pux --help")
  end
end
