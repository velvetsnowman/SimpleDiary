class Diary
  attr_reader :password,
              :notes
  def initialize
    @locked = true
    @password = nil
    @notes = []
  end

  def locked?
    @locked
  end

  def set_password(password)
    fail "Password already set" if @password != nil
    @password = password
  end

  def set_new_password(current_password, new_password)
    fail 'Current password wrong' if current_password != @password
    @password = new_password
  end

  def unlock(password)
    fail 'Wrong password' if password != @password
    fail 'Diary already unlocked!' unless @locked
    @locked = false
  end

  def lock(password)
    fail 'Wrong password' if password != @password
    fail 'Diary already locked!' if @locked == true
    @locked = true
  end

  def new_note(message)
    fail "Diary is locked!" if @locked
    @notes << message
  end
end
