require 'vcr'

RSpec.configure do |config|
  VCR.configure do |c|
    c.cassette_library_dir = 'spec/cassettes'
    c.hook_into :webmock
    c.allow_http_connections_when_no_cassette = false
  end

  config.around(:each, :vcr) do |example|
    options = example.metadata[:vcr]
    raise 'VCR configuration required' if !options.kind_of?(Hash) || !options[:cassete]

    opts = options.reverse_merge(record: :once)
    cassette = opts.delete :cassete

    VCR.use_cassette(cassette, opts) do
      example.run
    end
  end
end
