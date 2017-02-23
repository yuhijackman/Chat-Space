# Chat-Space

##Features
-メッセージ
-画像送信
-グループ作成
-グループに参加
-グループに招待
-グループ名の変更

##Users_table
```
def change
    create_table :users do |u|
      t.string :name null: false
      t.text :email
      t.text :nickname
      t.references :group_id, foreign_key: true
      t.timestamps null: false
    end
    add_index :users, :name
end

```

##Messages_table
```
def change
    create_table :messages do |m|
      t.string :body null: false
      t.text :image
      t.references :user_id, foreign_key: true
      t.references :group_id, foreign_key: true
      t.timestamps null: false
    end
end

```

##Groups_table
```
def change
    create_table :groups do |g|
      t.string :name null: false
    end
end

```

##Associations
```
  ### app/models/user.rb

  class User < ActuveRecord::Base
    has_many :messages
    has_many :groups, through: :user_groups
  end

  ### app/models/user_group.rb

  class UserGroup < ActiveRecord::base
    belongs_to :user
    belongs_to :group
  end

  ### app/models/group.rb

  class Group < ActiveRecord::base
    has_many  :users
  end

  ### app/models/message.rb

  class Message < ActiveRecord::base
    belongs_to :user
  end

end
```
