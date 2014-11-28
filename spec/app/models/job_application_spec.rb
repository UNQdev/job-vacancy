require 'spec_helper'

describe JobApplication do

	describe 'model' do

		subject { @job_offer = JobApplication.new }

		it { should respond_to( :job_offer) }
		it { should respond_to( :user) }

	end


	describe 'create_for' do

		it 'should set user' do
	  	offer = JobOffer.new
	  	user = User.new
	  	ja = JobApplication.create_for(offer, user)
	  	ja.user.should eq user
	  end

	  it 'should set job_offer' do
	  	offer = JobOffer.new
	  	user = User.new
	  	ja = JobApplication.create_for(offer, user)
	  	ja.job_offer.should eq offer
	  end

	end



end
