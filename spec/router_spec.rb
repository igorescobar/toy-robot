require "./src/router"

describe Router do
  context "#next_route" do
    context "north" do
      let(:router) { Router.new(1, 1, :north) }
      subject { router.next_route }

      it { is_expected.to eql [1, 2] }
    end

    context "east" do
      let(:router) { Router.new(1, 1, :east) }
      subject { router.next_route }

      it { is_expected.to eql [2, 1] }
    end

    context "south" do
      let(:router) { Router.new(1, 1, :south) }
      subject { router.next_route }

      it { is_expected.to eql [1, 0] }
    end

    context "west" do
      let(:router) { Router.new(1, 1, :west) }
      subject { router.next_route }

      it { is_expected.to eql [0, 1] }
    end
  end

  context "#turn_left" do
    let(:router) { Router.new(1, 1, :north) }
    subject { router.turn_left }

    it { is_expected.to be :west }
  end

  context "#turn_right" do
    let(:router) { Router.new(1, 1, :north) }
    subject { router.turn_right }

    it { is_expected.to be :east }
  end

  context "preventing placing at invalid x and y" do
    context "positive" do
      let(:router) { Router.new(0, 0, :north) }
      before do
        router.x = 10
        router.y = 10
      end

      it { expect(router.x).to be 4 }
      it { expect(router.y).to be 4 }
    end

    context "negative" do
      let(:router) { Router.new(0, 0, :north) }
      before do
        router.x = -1
        router.y = -100
      end

      it { expect(router.x).to be 0 }
      it { expect(router.y).to be 0 }
    end
  end
end
