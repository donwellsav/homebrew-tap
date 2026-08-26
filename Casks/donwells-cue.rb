cask "donwells-cue" do
  version "2.6.8"
  arch arm: "arm64", intel: "x64"

  sha256 arm:   "329c707886917c78714a50160b67ef70552d11e1c7f5946b0d8a69dbb7153db8",
         intel: "01e6c88d09f3bd3e8f727a15f6fde2c434b9b85e61b47eb3d012bc5f4e4b0e5e"

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
