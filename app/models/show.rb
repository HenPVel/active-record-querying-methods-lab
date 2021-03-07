class Show < ActiveRecord::Base

    def self.highest_rating
        Show.maximum(:rating)
    end
    
    def self.most_popular_show
        where("rating = ?", self.highest_rating).first

    end

    def self.lowest_rating
        Show.minimum(:rating)
    end

    def self.least_popular_show
        # Show.all.find_by(rating: Show.lowest_rating)
        where("rating = ?", self.lowest_rating).first
    end

    def self.ratings_sum
        sum(:rating)
    end

    def self.popular_shows
        where("rating>5").all
    end

    def self.shows_by_alphabetical_order
        order('name ASC').all
        #.reorder('id ASC')
    end

end
