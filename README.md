# InnerPlan::Trix
Short description and motivation.

## Usage
How to use my plugin.

## Installation
Add this line to your application's Gemfile:

```ruby
gem "inner_plan-trix"
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install inner_plan-trix
```

Rails 7.1 has a reduced amount of allowed tags and attributes therefore ActionText
output is getting sanitized. In order to fix that, you might want to add something
like that in your env file:

```
config.after_initialize do
  ActionText::ContentHelper.sanitizer.class.allowed_tags += [ActionText::Attachment.tag_name, 'img', 'br'] + Rails::HTML5::Sanitizer.safe_list_sanitizer.allowed_tags
  ActionText::ContentHelper.sanitizer.class.allowed_attributes += ['src', 'abbr', 'alt', 'cite', 'class', 'datetime', 'height', 'lang', 'name', 'title', 'width', 'xml:lang']
end
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
