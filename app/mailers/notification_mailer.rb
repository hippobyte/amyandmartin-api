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

  def invitation(email:, code:)
    @code = code
    mail(to: email, subject: 'Che / Marzejon Wedding Celebration Invite') do |format|
      format.html
    end
  end
end
