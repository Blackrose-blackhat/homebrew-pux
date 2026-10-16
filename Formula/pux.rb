class Pux < Formula
  desc "Ambient CI companion – watches pipelines and generates AI-ready failure context"
  homepage "https://github.com/Blackrose-blackhat/pux"
  url "https://registry.npmjs.org/pux.sh/-/pux.sh-0.1.5.tgz"
  sha256 "33d40436e15a724c5eb176d3178ead943f4ba829c6a36fd38445d1247948b692"
  license "MIT"

  depends_on "node@22"

  def install
    system "npm", "install", *std_npm_args
    # node@22 is keg-only, so wrap the installed scripts with its bin on PATH
    # instead of symlinking them; the npm shebang is `#!/usr/bin/env node`.
    bin.env_script_all_files libexec/"bin", PATH: "#{Formula["node@22"].opt_bin}:${PATH}"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pux --version")
    assert_match "serve", shell_output("#{bin}/pux --help")
  end
end
