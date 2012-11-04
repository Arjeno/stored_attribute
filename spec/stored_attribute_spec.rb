require 'spec_helper'

describe StoredAttribute do

  describe :default_values do

    context :new do

      subject { Post.new }

      its(:show_date) { should be_false }
      its(:show_author) { should be_true }
      its(:background_color) { should == '#FFFFFF' }

    end

    context :create do

      subject { Post.create }

      its(:show_date) { should be_false }
      its(:show_author) { should be_true }
      its(:background_color) { should == '#FFFFFF' }

    end

  end

  describe :changing_values do

    context :new do

      subject { Post.new }

      before(:each) do
        subject.show_date = true
        subject.show_author = false
        subject.background_color = '#000000'
      end

      its(:show_date) { should be_true }
      its(:show_author) { should be_false }
      its(:background_color) { should == '#000000' }

    end

    context :create do

      subject { Post.create }

      before(:each) do
        subject.show_date = true
        subject.show_author = false
        subject.background_color = '#000000'
      end

      its(:show_date) { should be_true }
      its(:show_author) { should be_false }
      its(:background_color) { should == '#000000' }

      describe 'on initialize' do

        subject do
          Post.create({
            :show_date => true,
            :show_author => false,
            :background_color => '#000000'
          })
        end

        its(:show_date) { should be_true }
        its(:show_author) { should be_false }
        its(:background_color) { should == '#000000' }

      end

      describe 'with update' do

        subject do
          post = Post.create
          post.update_attributes({
            :show_date => true,
            :show_author => false,
            :background_color => '#000000'
          })
          post
        end

        its(:show_date) { should be_true }
        its(:show_author) { should be_false }
        its(:background_color) { should == '#000000' }

      end

    end

  end

end