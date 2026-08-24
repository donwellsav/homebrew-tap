cask "donwells-cue" do
  version "2.6.2"
  arch arm: "arm64", intel: "x64"

  sha256 arm:   "c7b91214c18d17fb5448cce5ab388b4b28a21bd6a1d99d55354db29bf4970305",
         intel: "5ff7fa38b3b7efe52b7f3bc78c8b82759564294f1cb1f6e0fb21a4e8cdeb75f1"

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
