class Futurlang < Formula
  desc "Proof-oriented programming language with a categorical kernel"
  homepage "https://github.com/wenitte/futurlang"
  url "https://registry.npmjs.org/futurlang/-/futurlang-1.0.2.tgz"
  sha256 "cce61f3666265a37daf274d2fe99fb309b02ed2f0b14471dfe6b55ca15679e73"
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
