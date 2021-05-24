require_relative "../storyTell"

describe "storyTell" do
    it "Should exit the game" do
        expect(exitTheGame).to eq(SystemExit)
    end

    it "Should choose the part of the game according to the zone provided" do
        expect(keepGoing(5, 10, 10, 1, "zoneTwo")).to eq("zoneTwo")
    end
end
