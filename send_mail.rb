module Send
  def sending_errors_mail
    Pony.mail(
        :to => 'you@example.com', :via => :smtp, :smtp => {
        :host     => 'smtp.yourserver.com',
        :port     => '25',
        :user     => 'user',
        :password => 'pass',
        :auth     => :plain,
        :domain   => "example.com"
    },
        :from => 'me@example.com',
        :subject => "The site does not respond to the status of 200, necessary to check"
    )
  end
end
