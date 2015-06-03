require "./src/reporter"

describe Reporter do
  context "#report" do
    let(:router) { Router.new(0, 1, :north) }
    let(:reporter) { Reporter.new(router) }

    it { expect(capture_stdout { reporter.report }).to eq "0,1,NORTH\n" }
  end
end
