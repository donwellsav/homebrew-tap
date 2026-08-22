cask "donwells-cue" do
  version "2.5.22"
  arch arm: "arm64", intel: "x64"

  sha256 arm:   "bf4ba6b3c4a61a778843beea3118cf8d2b88398baf645ac374145288a6868c5f",
         intel: "036ae4a94c84d30b723a62e7e8b415f6ae5b795441c92c9b3564fe7ed6858282"

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
    DonWells Cue is currently unsigned and not notarized (see SIGNING.md in the
    source repo). On first launch macOS shows "Apple could not verify DonWells
    Cue is free of malware". To get past it once:

      1. Click "Done" on the warning dialog.
      2. Open System Settings → Privacy & Security.
      3. Scroll down and click "Open Anyway" next to DonWells Cue.
      4. Click "Open Anyway" in the confirmation and approve with Touch ID
         or your password.

    Terminal alternative: xattr -dr com.apple.quarantine "/Applications/DonWells Cue.app"

    Illustrated guide: https://dwcue.com/#download
  EOS
end
