#
# Copyright (C) 2011 Instructure, Inc.
#
# This file is part of Canvas.
#
# Canvas is free software: you can redistribute it and/or modify it under
# the terms of the GNU Affero General Public License as published by the Free
# Software Foundation, version 3 of the License.
#
# Canvas is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
# details.
#
# You should have received a copy of the GNU Affero General Public License along
# with this program. If not, see <http://www.gnu.org/licenses/>.
#

class CourseAccountAssociation < ActiveRecord::Base
  belongs_to :course
  belongs_to :course_section
  belongs_to :account
  has_many :account_users, :foreign_key => 'account_id', :primary_key => 'account_id'
  attr_accessible :account, :depth, :course_section

  EXPORTABLE_ATTRIBUTES = [:id, :course_id, :account_id, :depth, :created_at, :updated_at, :course_section_id]
  EXPORTABLE_ASSOCIATIONS = [:course, :course_section, :account, :account_users]

  validates_presence_of :course_id, :account_id, :depth
end
