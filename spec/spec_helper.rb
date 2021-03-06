require 'uptimerobot'

DEFAULT_PARAMS = {
  'apiKey' => 'ZAPZAPZAP',
  'format' => 'json',
  'noJsonCallback' => '1'
}

def uptime_robot(options = {})
  options = {apiKey: 'ZAPZAPZAP'}.merge(options)

  stubs = Faraday::Adapter::Test::Stubs.new

  described_class.new(options) do |faraday|
    faraday.adapter :test, stubs do |stub|
      yield(stub)
    end
  end
end

def stringify_hash(hash)
  Hash[*hash.map {|k, v| [k.to_s, v.to_s] }.flatten(1)]
end
