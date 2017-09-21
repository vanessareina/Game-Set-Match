require 'rails_helper'

# RSpec.describe User, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
RSpec.describe User, type: :model do
  it { should have_valid(:first_name).when('Chris', 'Eddie') }
  it { should_not have_valid(:first_name).when('', nil) }

  it { should have_valid(:last_name).when('Cornell', 'Vedder') }
  it { should_not have_valid(:last_name).when('', nil) }

  it { should have_valid(:level).when('4.0', '3.5')}
  it { should_not have_valid(:level).when('', nil) }

  it { should have_valid(:preference).when('Singles', 'Doubles')}
  it { should_not have_valid(:preference).when('', nil) }

  it { should have_valid(:age_group).when('18-25', '26-35')}
  it { should_not have_valid(:age_group).when('', nil) }

  it { should have_valid(:gender).when('Female', 'Male')}
  it { should_not have_valid(:gender).when('', nil) }

  it { should have_valid(:email).when('someone@email.com', 'anyone@email.net') }
  it { should_not have_valid(:email).when('', nil, 'user', 'email@@com') }

  it { should have_valid(:city).when('Princeton', 'Philadelphia')}
  it { should_not have_valid(:city).when('', nil) }

  it { should have_valid(:state).when('NJ', 'PA')}
  it { should_not have_valid(:state).when('', nil) }


  it 'has a matching password and password confirmation' do
    user = User.new
    user.password = 'password'
    user.password_confirmation = 'passwordconfirmation'

    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to_not be_blank
  end
end
