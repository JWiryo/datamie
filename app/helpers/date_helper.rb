module DateHelper

  def month_num(name)
    return "01" if name == "January"
    return "02" if name == "February"
    return "03" if name == "March"
    return "04" if name == "April"
    return "05" if name == "May"
    return "06" if name == "June"
    return "07" if name == "July"
    return "08" if name == "August"
    return "09" if name == "September"
    return "10" if name == "October"
    return "11" if name == "November"
    return "12" if name == "December"
  end

  def month_name(num)
    return "January" if num == "01"
    return "February" if num == "02"
    return "March" if num == "03"
    return "April" if num == "04"
    return "May" if num == "05"
    return "June" if num == "06"
    return "July" if num == "07"
    return "August" if num == "08"
    return "September" if num == "09"
    return "October" if num == "10"
    return "November" if num == "11"
    return "December" if num == "12"
  end

end
