class Vernemq < Formula
  desc "Distributed MQTT Broker"
  homepage "https://vernemq.com"
  url "https://s3.amazonaws.com/vernemq/vernemq-1.0.0-OSX-x86_64.tar.gz"
  version "1.0.0"
  sha256 "a6416d051435d81a17f262f359041966ff50defdefc97ce515a8ee3f5e3755f5"

  bottle :unneeded

  depends_on :macos => :mountain_lion
  depends_on :arch => :x86_64

  def install
    logdir = var + "log/vernemq"
    datadir = var + "lib/vernemq"

    # Install the base files
    libexec.install Dir["*"]
    logdir.mkpath
    datadir.mkpath

    bin.write_exec_script libexec/"bin/vernemq"
    bin.write_exec_script libexec/"bin/vmq-admin"
  end

  test do
    system bin/"vernemq", "start"
    system bin/"vernemq", "ping"
    system bin/"vernemq", "stop"
  end
end
