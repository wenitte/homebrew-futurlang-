class Futurlang < Formula
  desc "Proof-oriented programming language with a categorical kernel"
  homepage "https://github.com/WenitteApiou/futurlang"
  url "https://registry.npmjs.org/futurlang/-/futurlang-1.0.0.tgz"
  # Update sha256 after `npm publish` by running:
  #   curl -sL <url> | shasum -a 256
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  def caveats
    <<~EOS
      VS Code Extension (syntax highlighting, hover docs, completions):
        https://marketplace.visualstudio.com/items?itemName=WenitteApiou.futurlang

      Or search "FuturLang" in the VS Code Extensions panel.
    EOS
  end

  test do
    (testpath/"hello.fl").write <<~FL
      theorem Hello() {
        assume(true) →
        declareToProve(true)
      } ↔

      proof Hello() {
        conclude(true)
      }
    FL
    system "#{bin}/fl", "check", "hello.fl"
  end
end
