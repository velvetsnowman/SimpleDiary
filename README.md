### Secret Diary

The reason for writing this program was to practice testing and to TDD a project
because TDD is awesome

* How to run

```
git clone xxx
cd SimpleDiary
```

```
require './lib/diary.new'
```
```
my_diary = Diary.new
```
```
my_diary.set_password("Y0urPa$$w0rd")
```
```
my_diary.unlock("Y0urPa$$w0rd")
```
```
my_diary.new_note("Your Note")
```
```
my_diary.view_notes
```
Expected Output:

"Your Note"

* For testing
```
rspec
```
