class AdminMailer < ApplicationMailer
  default from: 'tanya.moldovan@gmail.com'

  def new_company_waiting_for_approval(company)
    puts 'EMAIL ADMiN IS'
    puts ENV['EMAIL_ADMIN']
    @company = company
    mail(to: 'tanya.moldovan@gmail.com', subject: "New Company Signup: #{@company.email}")
  end
end
