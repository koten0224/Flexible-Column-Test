嘗試使用一張多型關聯表 attributes 來分散儲存其他 model 的 columns

將原本 model 的 columns 拆成一個個的 column name 與 value

一筆一筆存入 attributes table

應用的 model 可以不需要增加任何的 column

只需要在 model 層加上


```=ruby
flexible_column :title, default: "lalala", type: :string
```

如範例就可以為此 ORM 物件加上兩個 instance method 'title' and 'title='，而資料會存在 attributes table

可以設定預設值以及資料型態

可以達成隨時隨意增刪 model 欄位的效果

flexible_column 用到了 meta programming

自動為您的 ORM 物件加上指定的method

操作上就像是 has_many 或者 belongs_to 一樣

但當然實際使用上不如 Rails 內建的 ORM 物件的 columns 那樣便利

不支援像是 Class.create(params)這樣的 Rails 語法

就是一種嘗試吧～:P
