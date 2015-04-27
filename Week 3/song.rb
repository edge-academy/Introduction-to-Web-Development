class Song
  @@all_songs = []
  @@total_plays = 0
  @@recently_played = []
  attr_accessor :name, :artist, :duration
  attr_reader :plays

  def initialize(name, artist, duration)
    @name     = name
    @artist   = artist
    @duration = duration
    @plays    = 0
    @@all_songs << self
  end

  def play
    @plays = @plays + 1
    @@total_plays += 1
    @@recently_played.unshift(self)
    puts "#{name} was just played"
  end

  def self.most_played
    @@all_songs.sort {|a,b| b.plays <=> a.plays}.take(10)
  end

  def self.random
    @@all_songs.sample
  end

  def self.all
    @@all_songs
  end

  def popular?
    @plays > MINIMUM_PLAYS
  end

  def self.total_plays
    @@total_plays
  end

  def to_s
    "Song: #{name}--#{artist} (#{duration})"
  end
end

class KaraokeSong < Song
  def initialize(name, artist, duration, lyrics)
    super(name, artist, duration)
    @lyrics   = lyrics
  end

  def to_s
    super + " with #{@lyrics}"
  end
end
