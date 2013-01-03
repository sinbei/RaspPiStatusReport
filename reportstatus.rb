require 'rubygems'
require 'net/smtp'
require 'tlsmail'
require 'mail'

mail = Mail.new


mesText = 'This is Status Notification mail from Raspberry Pi.'

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

mesText += "\nCPU Temperature\t: " + temp.to_s + " Degree Celsius\n"
mesText +=   "CPU Frequency\t: " + freq.to_s + " MHz\n"
mesText += "\n\n"
mesText += "Sended by reportstatus.rb in Raspberry Pi\n"
mesText += "YOUR_NAME"


# Set mail Properties
mail[:from] = 'ADDRESS_FROM'
mail[:to]   = 'ADDRESS_TO'
mail.subject = 'Raspberry Pi Status'
mail.body = mesText

# Set smtpserver Properties
smtpserver = Net::SMTP.new('smtp.gmail.com',587)
smtpserver.enable_tls(OpenSSL::SSL::VERIFY_NONE)

# Send mail
smtpserver.start('gmail.com','YOUR_GMAIL_ACCOUNT','YOUR_GMAIL_PASS', :login){|smtp|
        smtp.send_message(mail.encoded, mail.from, mail.to)
}
