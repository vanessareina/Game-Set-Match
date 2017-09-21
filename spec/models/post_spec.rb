# require 'rails_helper'
#
# RSpec.describe Post, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

RSpec.describe Post, type: :model do
  it { should have_valid(:title).when('I am a title', 'I\'m also a title') }
  it { should_not have_valid(:title).when('', nil) }

  it { should have_valid(:level).when('4.0', '3.5')}
  it { should_not have_valid(:level).when('', nil) }

  it { should have_valid(:preference).when('Singles', 'Doubles')}
  it { should_not have_valid(:preference).when('', nil) }

  it { should have_valid(:age_group).when('18-25', '26-35')}
  it { should_not have_valid(:age_group).when('', nil) }

  it { should have_valid(:gender).when('Female', 'Male')}
  it { should_not have_valid(:gender).when('', nil) }

  it { should have_valid(:city).when('Princeton', 'Philadelphia')}
  it { should_not have_valid(:city).when('', nil) }

  it { should have_valid(:state).when('NJ', 'PA')}
  it { should_not have_valid(:state).when('', nil) }

  # <%= it { should have_valid(:date).when('03/30/2017', '12/14/2017')} %>
  # <%= it { should_not have_valid(:date).when('', nil, '03/2017') }  %>

  it { should have_valid(:time).when('Morning', 'Afternoon')}
  it { should_not have_valid(:time).when('', nil) }

end
