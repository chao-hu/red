# == Schema Information
#
# Table name: projects
#
#  id             :integer          not null, primary key
#  namespace_id   :integer
#  dockerfile     :text
#  user_id        :integer
#  group_id       :integer
#  version_format :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
