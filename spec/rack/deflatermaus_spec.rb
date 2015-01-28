require "spec_helper"

describe Rack::Deflatermaus do
  it "plays some music" do
    player = stub_player

    get "/"

    expect(player).to have_received(:play)
  end

  it "compresses the response" do
    stub_player

    get "/", "", "HTTP_ACCEPT_ENCODING" => "gzip"

    expect(last_response.headers["Content-Encoding"]).to eq "gzip"
    expect(last_response.headers["Vary"]).to eq "Accept-Encoding"
    expect(gunzip(last_response.body)).to eq "hello from Rack"
  end

  def stub_player
    player = double("player", play: nil)
    allow(Rack::Deflatermaus::Player).to receive(:new).and_return(player)
    player
  end

  def gunzip(string)
    Zlib::GzipReader.new(StringIO.new(string)).read
  end

  def app
    Rack::Builder.new do
      use Rack::Deflatermaus

      run lambda { |env| [200, env, ["hello from Rack"]] }
    end
  end
end
