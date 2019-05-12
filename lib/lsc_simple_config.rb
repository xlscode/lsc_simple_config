class LSCSimpleConfig

  def initialize(fname)
    @data = {}
    raw_lines = File.read(fname).split("\n")
    parse_lines(raw_lines)
  end

  def [](fld)
    @data[fld.to_sym]
  end

  def each_key(&blk)
    @data.each_key(&blk)
  end

  def each_pair(&blk)
    @data.each_pair(&blk)
  end

  def has_key?(key)
    @data.has_key?(key)
  end

  private

  def parse_lines(raw_lines)
    raw_lines.each do |line|
      if line.match(/^[^=]+\s*=/) then
        parts = line.split(/\s*=\s*/)
        name = parts[0].strip
        value = parts[1].strip
        if parts[0].strip.match(/.+\[\]$/) then
          name = parts[0].strip[0..-3].to_sym
          @data[name] = []  if !@data.has_key?(name)
          @data[name].push(value)
        else
          name = parts[0].strip.to_sym
          @data[name.to_sym] = value
        end
      end
    end
  end

end
