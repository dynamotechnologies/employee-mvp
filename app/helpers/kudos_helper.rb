module KudosHelper

  def give_kudos(from, to, kudos)
    Employee.transaction do
      from.kudo_balance -= kudos
      from.save()

      to.kudos_received += kudos
      to.save()
    end
  end

end