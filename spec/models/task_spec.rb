require 'spec_helper'

describe Task do
  before(:all) do
    @user = FactoryGirl.create(:confirmed_user)
    for n in 1..4 do
      @user.tasks.create(title: "Task #{n}")
    end
  end

  describe '#move_to_last_position method' do
    it 'should have the highest sort order number for a users incomplete tasks' do
      @task = FactoryGirl.build(:task)
      @user.tasks << @task
      @task.save
      expect(@task.order).to eq(5)
    end

    it 'should sort before completed tasks' do
      @user.tasks.first.update_attribute(:completed, true)
      @task = FactoryGirl.build(:task)
      @user.tasks << @task
      @task.save
      expect(@task.order).to eq(4)
    end

  end

  describe '#mark_complete' do
    it 'should set the completed attribute to true' do
      @task = @user.tasks.order(order: :asc).first
      @task.mark_complete
      expect(@task.completed).should be_true
    end

    it 'should shift the task sort order to the bottom' do
      @task = @user.tasks.order(order: :asc).first
      @task.mark_complete
      expect(@task.order).to eq(5)
    end
  end
end