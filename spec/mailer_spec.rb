describe "sending an email" do
  include Mail::Matchers

  before(:each) do
    Mail::TestMailer.deliveries.clear

    Mail.deliver do
      from 'mkt@slimcard.com'
      to       'rafael@mailnator.com'
      subject  'Slimcard'
      body     'Testing'
    end
  end

  it { is_expected.to have_sent_email } # passes if any email at all was sent

  it { is_expected.to have_sent_email.from('mkt@slimcard.com') }
  it { is_expected.to have_sent_email.to('rafael@mailnator.com') }

  it { is_expected.to have_sent_email.matching_subject(/Slimcard?/) }
  it { is_expected.to have_sent_email.matching_body(/Test(ing)?/) }
end
