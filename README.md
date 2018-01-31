# TokenizeAttributes

TokenizeAttributes allows to define a tokenized attribute.

A before validation is generate on the attribute to set a tokenized value on the attribute

## Configuration

```ruby
TokenizeAttributes.configure do |config|
  config.tokenizer = proc { SecureRandom.hex }
end
```

## Usage

#### Tokenized attributes

```ruby
class Object
    tokenized_attributes :attrb1, :attrb2
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
