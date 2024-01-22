# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.2.0] - 2024-01-22

### Added

- Added simple getters for configuration values. Now you can get the value of a configuration key by calling `[]`. Ex. 

```rb
@config.evironment(:dev)[:option]

# => "value"
```

- Added return values for `#environment` method. Now you can get the current values of the environment by calling `#environment` without any arguments. Ex.

```rb
@config.environment(:dev)

# => { option1: "value1", option2: "value2" }
```

## Removed

- Remove `OptionBuilder` class. It was not needed.
- Remove `OptionFactory` class. It was not needed.

## [0.1.0] - 2023-12-05

### Added

-   Initial release. Versioning will start at 0.1.0.

### Changed

### Removed

### Fixed

### Security
