class NewsMailer < ActionMailer::Base
  default from: "\"David de l'EEBulle\" <david.hausmann@eebulle.ch>"
  default 'X-MC-AutoText' => 1
	default 'X-MC-InlineCSS'=> "true"

  def news(content, subject)
  	@content = content
  	mail(
  		to: NewsletterEmail.pluck(:email),
  		subject: subject
  	)
  end

end
