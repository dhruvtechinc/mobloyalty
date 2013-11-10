class StoreSearch < ActiveRecord::Base

	def self.columns() @columns ||= []; end

	def self.column(name, sql_type = nil, default = nil, null = true)
		columns << ActiveRecord::ConnectionAdapters::Column.new(name.to_s, default, sql_type.to_s, null)
	end

	column :zip, :string
	column :name, :string

	VALID_ZIP_REGEX = /\A\d{5}-\d{4}|\A\d{5}\z/
	validates :zip, presence: true, format: { with: VALID_ZIP_REGEX }
	validates :name, presence: true, length: { maximum: 100 }

	#validates_presence_of :zip
	#validates_presence_of :name

end
