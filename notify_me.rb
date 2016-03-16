require 'libnotify'

def read_charge
  battery_status = IO.popen("upower -i $(upower -e | grep BAT) | grep --color=never -E percentage|xargs|cut -d' ' -f2|sed s/%//")
  return_status =  battery_status.readlines;
  battery_status.close
  return return_status[0].to_i
end

def notify_status
  # using libnotify
  loop do
    charge = read_charge
    if charge == 78
      note = Libnotify.new do |notify|
        notify.summary = "Battery 100%"
        notify.body = "Please remove the charger"
        notify.timeout = 2
        notify.urgency = :critical
        notify.append = false
        notify.transient  = true
        notify.icon_path = "/usr/share/icons/MacBuntu-OS/devices/48/battery.png" #change icon
      end
      note.show!
    end
    Kernel.sleep 20
  end
end

if __FILE__ == $0
  notify_status
end
