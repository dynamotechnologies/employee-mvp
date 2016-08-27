module KudosHelper

  def give_kudos(kudo)
    from = Employee.find kudo.from_id
    to = Employee.find kudo.to_id
    amount = kudo.amount
    
    Employee.transaction do
      from.kudo_balance -= amount
      from.save!

      to.kudos_received += amount
      to.save!

      kudo.save
    end
  end

end
