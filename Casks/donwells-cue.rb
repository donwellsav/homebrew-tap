cask "donwells-cue" do
  version "2.6.1"
  arch arm: "arm64", intel: "x64"

  sha256 arm:   "4c6de96135ff5c0a858fe998c05a6a1c2902e42e91e966ba4389907fba59dd5b",
         intel: "608d6012e61eb55847111f3e79963803fa9dd68570afee5ce2356fdd2e1e6eff"

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
