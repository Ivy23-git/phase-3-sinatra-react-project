class ProjectMember < ActiveRecord::Base
    belongs_to :project_members
    belongs_to :user 
end
