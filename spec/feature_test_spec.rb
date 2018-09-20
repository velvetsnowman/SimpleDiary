require 'diary'
describe 'Feature tests' do
  it 'should let a user set a password' do
    my_diary = Diary.new
    my_diary.set_password("mypassword")
    expect(my_diary.password).to eq 'mypassword'
  end

  it 'should let a user set a new password' do
    my_diary = Diary.new
    my_diary.set_password("mypassword")
    my_diary.set_new_password("mypassword", "newpassword")
    expect(my_diary.password).to eq "newpassword"
  end

  it 'should let a user unlock the diary' do
    my_diary = Diary.new
    my_diary.set_password("mypassword")
    my_diary.unlock("mypassword")
    expect(my_diary.locked?).to be false
  end

  it 'should let a user lock their diary' do
    my_diary = Diary.new
    my_diary.set_password("mypassword")
    my_diary.unlock("mypassword")
    my_diary.lock("mypassword")
    expect(my_diary.locked?).to be true
  end

  it 'should let a user enter a new note into their diary' do
    my_diary = Diary.new
    my_diary.set_password("mypassword")
    my_diary.unlock("mypassword")
    my_diary.new_note("This is a secret note")
    expect(my_diary.notes.length).to eq 1
  end


end
