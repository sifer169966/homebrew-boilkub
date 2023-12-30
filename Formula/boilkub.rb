class Boilkub < Formula
    desc "clone provided repository URL to a destination"
    homepage "https://github.com/sifer169966/boilkub"
    url "https://github.com/sifer169966/boilkub.git",
        tag: "v1.0.0",
        revision: "c4d803d61f459a2498a582a3aee389042bdf076f"
    license "mit"
    head "https://github.com/sifer169966/boilkub.git", branch: "master"
  
    livecheck do
        url :stable
        regex(/^v?(\d+(?:\.\d+)+)$/i)
      end
    # require dependencies
    depends_on "yq"
    depends_on "git"

    if MacOS.version <= :monterey
        depends_on "coreutils"
    end
  
    def install
        bin.install "bin/boilkub.sh" => "boilkub"
        prefix.install "config", "helpers", "apply"
        inreplace "#{bin}/boilkub", /_ROOT_PROJECT=.*$/, "_ROOT_PROJECT=#{prefix}"
        tag_version = version.to_s
        inreplace "#{bin}/boilkub", "VERSION_PLACEHOLDER", tag_version
        inreplace "#{bin}/boilkub", "SOURCE_PLACEHOLDER", homepage
    end

    test do
      # Add test code here if applicable
    end
  end