list = []
failed = []

Rsvp.confirmed.each do |r|
  r.guest.guest_contacts.each do |c|
    list.push({ email: c.email, code: r.invite_code })
  end
end

Rsvp.invited.each do |r|
  r.guest.guest_contacts.each do |c|
    list.push({ email: c.email, code: r.invite_code })
  end
end

list.each do |item|
  NotificationMailer.announcement(item).deliver_now
rescue StandardError
  failed.push(item)
  sleep 10
end