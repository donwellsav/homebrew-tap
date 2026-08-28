cask "donwells-cue" do
  version "2.6.11"
  arch arm: "arm64", intel: "x64"

  sha256 arm:   "d17915b174182f7a2ff7943c4945354ef49b9e207e096b3c7a3f144c25a82c0e",
         intel: "05142aa95ba303080100d4c939e78c54337ed19df3192882f05be802e45e57a6"

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
