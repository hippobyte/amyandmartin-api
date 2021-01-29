#
# NotificationMailer
#
class NotificationMailer < ApplicationMailer
  def invite_code(email:, code:)
    @code = code
    mail(to: email, subject: 'Invitation Code Reminder') do |format|
      format.html
    end
  end
end
