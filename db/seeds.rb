require_relative('../models/transaction')
transaction1 = Transaction.new({
  "merchant_name" => "Asda",
  "value" => 32.35,
  "category" => "Food",
  "t_date_year" => 2016,
  "t_date_month" => 12,
  "t_date_day" => 4,
  "t_date" => ""
  })

transaction1.save()

transaction2 = Transaction.new({
  "merchant_name" => "Sainsbury",
  "value" => 8.55,
  "category" => "Food",
  "t_date_year" => 2016,
  "t_date_month" => 12,
  "t_date_day" => 9,
  "t_date" => ""
  })

transaction2.save()

transaction3 = Transaction.new({
  "merchant_name" => "Steam",
  "value" => 16.90,
  "category" => "Entertainment",
  "t_date_year" => 2016,
  "t_date_month" => 12,
  "t_date_day" => 9,
  "t_date" => ""
  })

transaction3.save()

transaction4 = Transaction.new({
  "merchant_name" => "Gas/Elec",
  "value" => 51.00,
  "category" => "Utilites",
  "t_date_year" => 2016,
  "t_date_month" => 12,
  "t_date_day" => 2,
  "t_date" => ""
  })

transaction4.save()

transaction5 = Transaction.new({
  "merchant_name" => "Rent",
  "value" => 410.00,
  "category" => "Contracts",
  "t_date_year" => 2016,
  "t_date_month" => 12,
  "t_date_day" => 2,
  "t_date" => ""
  })

transaction5.save()

transaction6 = Transaction.new({
  "merchant_name" => "Steam",
  "value" => 26.45,
  "category" => "Food",
  "t_date_year" => 2016,
  "t_date_month" => 12,
  "t_date_day" => 3,
  "t_date" => ""
  })

transaction6.save()

transaction7 = Transaction.new({
  "merchant_name" => "Steam",
  "value" => 16.90,
  "category" => "Entertainment",
  "t_date_year" => 2016,
  "t_date_month" => 12,
  "t_date_day" => 9,
  "t_date" => ""
  })

transaction7.save()

transaction8 = Transaction.new({
  "merchant_name" => "Aldi",
  "value" => 19.75,
  "category" => "Food",
  "t_date_year" => 2016,
  "t_date_month" => 12,
  "t_date_day" => 15,
  "t_date" => ""
  })

transaction8.save()

transaction9 = Transaction.new({
  "merchant_name" => "Cineworld",
  "value" => 18.90,
  "category" => "Entertainment",
  "t_date_year" => 2016,
  "t_date_month" => 12,
  "t_date_day" => 14,
  "t_date" => ""
  })

transaction9.save()

transaction10 = Transaction.new({
  "merchant_name" => "Mobile Phone",
  "value" => 10.00,
  "category" => "Contracts",
  "t_date_year" => 2016,
  "t_date_month" => 12,
  "t_date_day" => 2,
  "t_date" => ""
  })

transaction10.save()