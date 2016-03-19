#!/usr/bin/env ruby

# for notification
require 'libnotify'

# function to read charge
def read_charge
  battery_status = IO.popen("upower -i $(upower -e | grep BAT) | grep --color=never -E percentage|xargs|cut -d' ' -f2|sed s/%//")
  return_status =  battery_status.readlines
  battery_status.close
  return return_status[0].to_i
end

# function to check chareger is connected or not
def power_plugged_status
  status = IO.popen("cat /sys/class/power_supply/ADP1/online")
  return_status = status.readlines
  status.close
  return return_status[0].to_i
end

def notify_status
  # continuous polling and notifying
  loop do
  # checking charge is 100 and power cable is connected
    if read_charge == 100  && power_plugged_status.nonzero?
      # initializing Libnotify for notification
      note = Libnotify.new do |notify|
        notify.summary = "Battery 100%"
        notify.body = "Please remove the charger"
        notify.timeout = 2
        notify.urgency = :critical
        notify.append = false
        notify.transient  = true
        notify.icon_path = "/usr/share/icons/MacBuntu-OS/devices/48/battery.png" #change icon
      end
      # showing the notification
      note.show!
    end
    # sleeping for 20 seconds and again working
    Kernel.sleep 20
  end
end

# running the program 
if __FILE__ == $0
  notify_status
end
