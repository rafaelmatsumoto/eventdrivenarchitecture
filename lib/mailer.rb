require 'mail'

Mail.defaults do
  delivery_method :smtp, address: "localhost", port: 1025
end

class Mailer
  def self.mail(lead)
    Mail.deliver do
      from 'mkt@slimcard.com'
      to lead["email"]
      charset = "UTF-8"
      subject  'Slimcard'
      body     "Obrigado #{lead["name"]} por demonstrar interesse no slim card, o sistema está realizando uma análise de crédito"
    end
  end
end
