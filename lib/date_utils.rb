module DateUtils


  def self.start_of_previous_month
    today = Time.now
    if today.month == 1
      return Time.local(today.year-1, 12, 1)
    else
      return Time.local(today.year, (today.month-1), 1)
    end
  end

end
