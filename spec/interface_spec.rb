require "./src/interface"

describe Interface do
  let(:interface) { Interface.new }
  let(:router) { spy('router') }
  let(:reporter) { spy('reporter') }
  subject { router }
  context "when calling #place" do

    before do
      interface.place 1, 2, :north, router
    end

    it { is_expected.to have_received(:x=).with(1).once }
    it { is_expected.to have_received(:y=).with(2).once }
    it { is_expected.to have_received(:facing=).with(:north).once }
  end

  context "#left" do
    before do
      interface.left router
    end

    it { is_expected.to have_received(:turn_left).once }
    it { is_expected.to have_received(:facing=).once }
  end

  context "#right" do
    before do
      interface.right router
    end

    it { is_expected.to have_received(:turn_right).once }
    it { is_expected.to have_received(:facing=).once }
  end

  context "#report" do
    subject { reporter }
    before do
      interface.report router, reporter
    end

    it { is_expected.to have_received(:new).with(router) }
    it { is_expected.to have_received(:report).once }
  end

  context "#move" do
    before do
      allow(router).to receive(:next_route).and_return([1,2])
      interface.move router
    end

    it { is_expected.to have_received(:next_route).once }
    it { is_expected.to have_received(:x=).with(1).once }
    it { is_expected.to have_received(:y=).with(2).once }
  end
end
