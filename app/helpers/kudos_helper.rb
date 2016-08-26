module KudosHelper

  def give_kudos(from, to, kudos)
    if from.kudo_balance < kudos
      raise 'User does not have enough kudos to give.'
    end

    Employee.transaction do
      from.kudo_balance -= kudos
      from.save()

      to.kudos_received += kudos
      to.save()
    end
  end

end