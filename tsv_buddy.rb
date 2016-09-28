# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    rows = tsv.split("\n").map { |row| row.split("\t") }
    arr = []
    keys = rows.first
    datarows = rows[1..-1]
    datarows.each do |row|
      one_hash = {}
      row.each_with_index { |value, index| one_hash[keys[index]] = value }
      @data = arr.push one_hash
    end
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    headers = @data.first.keys
    ans_s = headers.join("\t") + "\n"
    @data.each { |hash| ans_s = ans_s + hash.values.join("\t") + "\n" }
    return ans_s
  end
end
