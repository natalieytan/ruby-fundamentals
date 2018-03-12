# An allergy test produces a single numeric score which contains the information about all the allergies the person has (that they were tested for).
# The list of items (and their value) that were tested are:
# - eggs (1)
# - peanuts (2)
# - shellfish (4)
# - strawberries (8)
# - tomatoes (16)
# - chocolate (32)
# - pollen (64)
# - cats (128)
# So if Tom is allergic to peanuts and chocolate, he gets a score of 34.
# Write a program that, given a person's score can tell them
# a) whether or not they're allergic to a given item, and
# b) the full list of allergies.
# allergies = Allergies.new(34)
# allergies.allergic_to?('chocolate')
# => true
# allergies.allergic_to?('cats')
# => false
# allergies.list
# => ['peanuts', 'chocolate']

class Allergies
    def initialize(score)
        @score = score
    end

    def list
        puts find_allergens
    end

    def allergic_to?(allergen)
        allergens = find_allergens
        puts allergens.include?(allergen)
    end

    def find_allergens
        allergy_score = [
            {allergen: "cats", score: 128},
            {allergen: "pollen", score: 64},
            {allergen: "chocolate", score: 32},
            {allergen: "tomatoes", score: 16},
            {allergen: "strawberries", score: 8},
            {allergen: "shellfish", score: 4},
            {allergen: "peanuts", score: 2},
            {allergen: "eggs", score: 1},
        ]
        allergies = []
        score_copy = @score
        allergy_score.each do |allergen|
            if score_copy >= allergen[:score]
                score_copy -= allergen[:score]
                allergies.push(allergen[:allergen])
                return allergies if score_copy == 0
            end
        end
    end


end


allergy = Allergies.new(34)
allergy.list
allergy.allergic_to?("chocolate")




