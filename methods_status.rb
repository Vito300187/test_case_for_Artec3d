module MethodsStatus
  def status_error(response, status_down_count)
    if status_down_count == 3
      puts "Site not active #{status_down_count} minutes."
    elsif status_down_count == 10
      puts "Site not active #{status_down_count} minutes."
    elsif status_down_count == 50
      puts "Site not active #{status_down_count} minutes."
    elsif status_down_count == 100
      puts "Site not active #{status_down_count} minutes."
    elsif status_down_count == 500
      puts "Site not active #{status_down_count} minutes."
    end

    #send email
    puts "Site response code - #{response.code}, Response status #{response.message}"
    puts "Sent a notification about the failure of the site"
  end

  def status_ok(response)
    puts "The site works great, Site response code - #{response.code}, Response status #{response.message}"
  end
end
