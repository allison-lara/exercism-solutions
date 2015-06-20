class Crypto
  def initialize(text)
    @text = text
  end

  def normalize_plaintext
    @normalized ||= @text.downcase.gsub(/[\W_ ]/,'')
  end

  def size
    Math.sqrt(normalize_plaintext.length).ceil.to_i
  end

  def plaintext_segments
    unless @segments
      length = normalize_plaintext.length
      @segments = []
      0.step(by: size, to: length - 1) { |start|
        @segments << normalize_plaintext[start, size]
      }
    end
    @segments
  end

  def ciphertext
    by_column.flatten.join
  end

  def normalize_ciphertext
    by_column.map { |set| set.join }.join(' ')
  end

  private

  def by_column
    charsets = plaintext_segments.map(&:chars)
    charsets[0].zip(*charsets[1..-1])
  end
end