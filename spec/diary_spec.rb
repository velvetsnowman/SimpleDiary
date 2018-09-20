require 'diary'

describe Diary do
  let (:diary) { Diary.new }

  it 'when a diary is instantiated it should be locked' do
    expect(diary.locked?).to be true
  end

  it 'lets a user enter a new secret password' do
    diary.set_password("password")
    expect(diary.password).to eq "password"
  end

  describe '#set_new_password' do
    it 'throws an error if a password has alreay been set' do
      diary.set_password("password")
      expect{ diary.set_password("hello") }.to raise_error('Password already set')
    end

    it 'lets a user change his password' do
      diary.set_password("password")
      diary.set_new_password("password", "pa$$w0rd")
      expect(diary.password).to eq "pa$$w0rd"
    end

    it 'throws an error if a user wants to update his password but enters the wrong current password' do
      diary.set_password("password")
      expect{ diary.set_new_password("pass", "hello") }.to raise_error('Current password wrong')
    end
  end

  describe "#unlock" do
    it 'lets a user unlock his diary' do
      diary.set_password("password")
      diary.unlock("password")
      expect(diary.locked?).to be false
    end

    it 'throws an error if a user wants to unlock his diary but its already unlocked' do
      diary.set_password("password")
      diary.unlock("password")
      expect {diary.unlock("password")}.to raise_error('Diary already unlocked!')
    end

    it 'throws an error if a user wants to unlock his diary but enters the wrong password' do
      diary.set_password("password")
      expect {diary.unlock("hello")}.to raise_error('Wrong password')
    end
  end

  describe "#lock" do
    it 'lets a user unlock the diary' do
      diary.set_password("password")
      diary.unlock("password")
      diary.lock("password")
      expect(diary.locked?).to be true
    end

    it 'throws an error if a user wants to lock his diary but enters the wrong password' do
      diary.set_password("password")
      expect {diary.lock("hello")}.to raise_error('Wrong password')
    end

    it 'throws an error if a user wants to lock his diary but its already locked' do
      diary.set_password("password")
      expect {diary.lock("password")}.to raise_error('Diary already locked!')
    end
  end

  describe "#new_note" do
    it 'allows a user to enter a new note' do
      diary.set_password("password")
      diary.unlock("password")
      diary.new_note("Hello this is a new note")
      expect(diary.notes).to include("Hello this is a new note")
    end

    it 'throws an error if a user to enter a new note but is locked' do
      expect { diary.new_note("Hello this is a new note") }.to raise_error("Diary is locked!")
    end
  end
end


# expect { airport.land(plane) }.to raise_error('Capacity is full')
