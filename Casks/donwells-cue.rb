cask "donwells-cue" do
  version "2.6.7"
  arch arm: "arm64", intel: "x64"

  sha256 arm:   "475c9d6108f38fd39318312ce51cfdf18a1ffb80cb78f9abef7113d433b891f5",
         intel: "4aca7e90ef93e50a25be9ffbacd151837f9ad98b70d6bbbfc16c58b05f9db4f7"

  url "https://github.com/donwellsav/dwcue/releases/download/v#{version}/DonWells-Cue-#{version}-#{arch}.dmg"

  name "DonWells Cue"
  desc "Audio cue playback application for live sound operators"
  homepage "https://github.com/donwellsav/dwcue"

  livecheck do
    url :url
    strategy :github_latest
  end

  # minimumSystemVersion in the app's Info.plist is 13.3.
  depends_on macos: :ventura

  app "DonWells Cue.app"

  zap trash: [
    "~/Library/Application Support/LivePlay",
    "~/Library/Caches/com.donwells.cue",
    "~/Library/Preferences/com.donwells.cue.plist",
    "~/Library/Saved Application State/com.donwells.cue.savedState",
  ]

  caveats <<~EOS
    DonWells Cue is signed with an Apple Developer ID and notarized by Apple,
    so it opens normally on first launch — no Gatekeeper warning, no extra steps.
  EOS
end
