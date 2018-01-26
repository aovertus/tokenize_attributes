# TokenizeAttributes

TokenizeAttributes allows to define a tokenized attribute.

## Usage

#### Single attribute

```ruby
class Object
  tokenized_attribute :authentication_token
end
```

Override tokenizer proc

```ruby
class Object
    tokenized_attribute :attrb1, proc { SecureRandom.uuid }
end
```


#### Multiple attributes

```ruby
class Object
    tokenized_attribute :authentication_token
end
```

Override tokenizer proc

```ruby
class Object
    tokenized_attributes :attrb1, :attrb2, proc { SecureRandom.uuid }
end
```

#### Reset Attrb

```ruby
object = Object.new
object.reset_tokenization_for_attrb
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
