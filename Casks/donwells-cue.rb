cask "donwells-cue" do
  version "2.5.21"
  sha256 "2d0805317d63c1545fbc3c82fc46e6353deced5e128a190a35ea5477f9c88954"

  url "https://github.com/donwellsav/dwcue/releases/download/v#{version}/DonWells-Cue-#{version}-arm64.dmg"

  name "DonWells Cue"
  desc "Audio cue playback application for live sound operators"
  homepage "https://github.com/donwellsav/dwcue"

  livecheck do
    url :url
    strategy :github_latest
  end

  # minimumSystemVersion in the app's Info.plist is 13.3.
  depends_on macos: :ventura
  depends_on arch: :arm64

  app "DonWells Cue.app"

  zap trash: [
    "~/Library/Application Support/LivePlay",
    "~/Library/Caches/com.donwells.cue",
    "~/Library/Preferences/com.donwells.cue.plist",
    "~/Library/Saved Application State/com.donwells.cue.savedState",
  ]

  caveats <<~EOS
    DonWells Cue is currently unsigned and not notarized (see SIGNING.md in the
    source repo). If Gatekeeper blocks the first launch with "damaged" or
    "cannot be opened", run:

      xattr -dr com.apple.quarantine "/Applications/DonWells Cue.app"
  EOS
end
