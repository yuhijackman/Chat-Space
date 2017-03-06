RSpec::Matchers.define :have_foreign_key_constraint_on do |field|
  match do |model|
    model.send("#{field}=", 0)
    begin
      model.save!(validate: false)
      false
    rescue ActiveRecord::InvalidForeignKey
      true
    end
  end

  description { "have FOREIGN KEY constraint on #{field}" }
  failure_message { "expected to have FOREIGN KEY constraint on #{field}, but not" }
end
