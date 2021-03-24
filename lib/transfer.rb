class Transfer
  # your code here
  attr_reader :sender, :name, :receiver
  attr_accessor :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @name =name
    @amount = amount
    @receiver = receiver
    @status = "pending"
  end

  def valid?
    if receiver.valid? && sender.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if self.sender.balance > self.amount && self.status == "pending" && self.valid? == true
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
    else
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.receiver.balance -= self.amount
      self.sender.balance += self.amount
      self.status = "reversed"
    end
  end

end
