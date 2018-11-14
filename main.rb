require './methods_status'
require 'httparty'
ONE_MINUTE = 60
STATUS_CODE = 200

class Monitoring
  puts 'What website are we monitoring? (example: https://www.artec3d.com/ru)'
  tracking_website = gets.chomp.to_s
  response = HTTParty.get(tracking_website)
  extend MethodsStatus

  # Переменная status_down_count необходима для сбора колличества ошибок к доступу сайта,
  # которые будут суммироваться и при соответствующем кол-ве, вызывать метод status_error.
  # Если ошибок нет и status code 200, массив не заполняется.
  # Если ошибки есть и status code обновился на 200, ошибки аннулируются.

  status_down_count = 0
  loop do
    if response.code == STATUS_CODE && status_down_count > 0
      puts "Access to the resource #{tracking_website} is resumed"
      status_ok(response)
      status_down_count = 0

    elsif response.code == STATUS_CODE
      status_ok(response)

    elsif response.code != STATUS_CODE
      status_down_count += 1
      status_error(response, status_down_count)
    end

    # One minute simulation
    sleep ONE_MINUTE
  end
end
