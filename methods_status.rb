require './send_mail'

THREE_MINUTES = 3
TEN_MINUTES = 10
FIFTY_MINUTES = 50
HUNDRED_MINUTES = 100
FIVE_HUNDRED_MINUTES = 500

module MethodsStatus
  extend Send

  def status_ok(response)
    puts "The site works great, site response code - #{response.code}, response status #{response.message}"
  end

  def status_error(status_down_count)
    if status_down_count == THREE_MINUTES  || status_down_count == TEN_MINUTES  ||
       status_down_count == FIFTY_MINUTES  || status_down_count == HUNDRED_MINUTES ||
       status_down_count == FIVE_HUNDRED_MINUTES
      check_sending_errors_mail
    end
  end

  def check_sending_errors_mail
    begin
      sending_errors_mail
    rescue
      puts 'Failed to send email, please check settings in method send_mail_error'
    end
  end
end
