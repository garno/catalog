# Catalog
*Catalog prevent your download folder from being a mess on Mac Os X.*

## The problem

The *Downloads* folder on a Mac is the most clusttered folder there is. Even with the best intentions, we end up not cleaning it as often as we should.

*Catalog* allow us to create rules to automatically organize your downloads based on its origin (*i.e. http://someurl.com/path/to/file.pdf*).

## Installation

```bash
# Install `catalog` gem
$ gem install catalog

# Create the configuration file
$ touch ~/.catalog
```

## State of project

The current version **doesn't include a CLI**. You'll have to use it through IRB as you can see in the [How to use](#how-to-use) section. The next step will be to provide a CLI using guard and a way to easily deamonize this.

## How to use

As mentionned above, *catalog* does not offer a CLI at the moment. You have to load it with IRB.

```ruby
> require 'catalog'
=> true

# Default location is ~/Downloads
> Catalog::Organizer.new.run!
=> true

# However, you can specify your own
> Catalog::Organizer.new(base_path: '/Volumes/Downloads/').run!
=> true
```

#### `~/.catalog` example

```yaml
drawers:
  # Basecamp related files
  - rule: basecamp.com\/39\/projects\/12837347\/
    path: /Users/garno/Downloads/Basecamp/ProjectName/
  - rule: basecamp.com
    path: /Users/garno/Downloads/Basecamp/

  # DMGs
  - rule: \.(?:dmg)$
    path: /Users/garno/Downloads/DMGs/

  # Alfred workflows
  - rule: \.(?:alfredworkflow)$
    path: /Users/garno/Downloads/Alfred workflows/
```

**Rules order is really important** since a file will be moved according to the first matched rule.

## License

Catalog is © 2014 Samuel Garneau and may be freely distributed under the MIT license. See the LICENSE.md file for more information.
