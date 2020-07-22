class Mission < ApplicationRecord
    belongs_to :planet
    belongs_to :scientist
end
