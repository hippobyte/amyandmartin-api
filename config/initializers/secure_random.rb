# frozen_string_literal: true

require 'securerandom'
require 'nanoid'

#
# SecureRandom
#
module SecureRandom
  def self.nanoid(size: 14, alphabet: nil, numeric: nil)
    return Nanoid.generate(size: size, alphabet: alphabet.to_s) unless alphabet.nil?
    return Nanoid.generate(size: size, alphabet: '0123456789')  if numeric == true
    return Nanoid.generate(size: size, alphabet: 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ') if numeric == false

    return Nanoid.generate(size: size, alphabet: '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ')
  end
end
