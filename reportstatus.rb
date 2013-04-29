require 'rubygems'
require 'net/smtp'

# Get Raspbarry Pis' status
temp = 0.00
freq = 0.00
open("/sys/class/thermal/thermal_zone0/temp"){|file|
        temp = file.read.to_f
}
open("/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq"){|file|
        freq = file.read.to_f
}
temp = temp / 1000
freq = freq / 1000

# Set mail Properties
fromAddress = 'ADDRESS_FROM'
toAddress   = 'ADDRESS_TO'
sender      = 'YOUR_NAME'

subject     = 'Raspberry Pi Status'

MESSAGE = <<EndOfMail
From: #{sender}'s Raspberry Pi <#{fromAddress}>
To: <#{toAddress}>
Subject: Raspberry Pi Status

This is Status Notification mail from Raspberry Pi.
CPU Temperature: #{temp.to_s} Degree Celsius
CPU Frequency:   #{freq.to_s} MHz

Sended by reportstatus.rb in Raspberry Pi
#{sender}
EndOfMail

# Set smtpserver Properties
smtpserver = Net::SMTP.new('smtp.gmail.com', 587)
smtpserver.enable_starttls

# Send mail
smtpserver.start('gmail.com','YOUR_GMAIL_ACCOUNT','YOUR_GMAIL_PASS', :login){|smtp|
        smtp.send_message(MESSAGE, fromAddress, toAddress)
}
