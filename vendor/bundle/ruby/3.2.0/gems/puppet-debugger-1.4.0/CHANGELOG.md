# Puppet Debugger Changelog

## Unreleased
## 1.4
- Add support for puppet 8
- Add support for ruby 3 (tested with 3.0-3.4)
- Updates rdoc to 6.0 due to json issue

## 1.3
- Fix failures when using Bolt 3.23+
- Relax tty-pager constraints (for Bolt)
- Stop testing puppet 5
- Stop testing ruby 2.4
## 1.2
- Fix puppetdb_query errors when bolt_pdb_client was not loaded
## 1.1
- Catch signals and allow control-d for quitting. 
## 1.0
Released: 8/3/2020

This is a major revision with breaking changes, notably the requirement of ruby 2.4 and puppet 5.5.

- Bump required ruby version to 2.4
- Bump required puppet version to puppet 5.5
- Add stacktrace plugin
- Add a pager for long output
- Remove puppet4 and older work arounds
- Use rubocop for better code quality
- Fix issue when the debugger was not loading the manifest properly

## 0.19.0
- Search datatypes with filter 
- Fix #8 - trusted_server_facts' as a setting is deprecated

## 0.18.0
- Add bundler as a dependency
- Add ability to filter out classes
- Add ability to filter out resources
- Add ability to supply a catalog
- Add vendormoduledir to module paths

## 0.17.0
- Fix bolt issue when the catalog is referenced
- Fix bolt issue when scriptcompiler scope is used
  and the debugger tries to expand the resources
  in the catalog.

## 0.16.0
- Load bolt puppet modules if bolt exists
- Fix bolt datatype rendering issues
  
## 0.15.2
- Fixes issue with bundler and auto complete again


## 0.15.1
- Fixes issue with bundler and auto complete

## 0.15.0
- Fixes issue with listing native functions when inside module directory
- Adds more puppet versions to matrix for testing
- Adds ability to specify number of lines in whereami command, defaults to 7

## 0.14.0
- Adds back ruby 2.1 support to matrix for pdk console
- Requires ruby 2.1 for gemspec

## 0.13.0

- Fixes gh-66 - colon symbol vanishing from variable output
- Adds ability to send content as an option at start
- Fixes issue where stack traces where not being shown
- Ensure output goes to proper buffer

## 0.12.3

- Fixes incorrect puppet namespace when list functions again

## 0.12.2

- Fixes incorrect puppet namespace when list functions

## 0.12.1

- Fixes issue with command completion
- Fixes unqualified runtime error

## 0.12.0

- Adds ability to list resource parameters as they were evaluated
- Fixes #61 - array output is misleading

## 0.11.0

- Fixes native functions not shown in functions command
- Prints functions into a table with proper namespace shown
- Adds table print gem
- Adds rb-readline for universal readline support on all platforms

## 0.10.3

- Remove warning message about incorrect version

## 0.10.2

- Fixes issue when scope is injected from plan files

## 0.10.1

- Fixes puppet6 multiline issue
- adds puppet-debugger command in addition to pdb
- deprecate pdb command

## 0.10.0

- Fix for puppet 6 and trusted server facts
- Adds puppet 6 support and remove ruby 1.9.3 from test matrix
- remove usage of require_relative

## 0.9.1

- Pin facterdb to >= 0.4.0

## 0.9.0

Released October 24, 2017

- Adds FacterDB as 0.4.0 dependency for external facts support
- Fixes #59 - Unhandled puppet type with awesome_print
- Fixes loading of multiple data types
- Add Puppet 5.1, 5.2, 5.3 to test matrix

## 0.8.1

- Fixes bug with command completion and blank inputs

## 0.8.0

- Fixes bug with playback of multiline input
- Updates pluginator Gem to 1.5.0
- Adds ability to provide command completion for plugins
- Fixes error with commands plugin where id didn't detect bad names
- Fixes #3 - Move old input responder test code to individual plugin tests
- Adds puppet 5 to testing matrix

## 0.7.0

- Adds new commands command
- Adds new help command
- Adds plugin framework
- Adds hooks framework
- Moves all commands to plugins
- Adds pluginator gem

## 0.6.1

- Adds benchmark feature

## 0.6.0

- Adds ability to list puppet types
- Adds ability to list puppet datatypes

## 0.5.1

- accidental bump

## 0.5.0

- Fixes #gh-49 - puppet 4 functions don't seem to work
- Disables trying to set trusted_node_data for puppet versions that do not support it

## 0.4.4

- Refactor to upcoming puppet 5.0 (minor fix, requires a few more changes)
- Fixes issue with frozen string literal under ruby 2.3.x

## 0.4.3

- Fixes issue with older facterdb filter not working

## 0.4.2

- Fixes #44 - error when running under puppet apply

## 0.4.1

- Adds a puppet application face
- Fixes #41 - add file reference when showing code during code break

## 0.4.0

- Rename to puppet-debugger

## 0.3.4

- Fixes issue with temporary file not being unique

## 0.3.3

- Adds ability to call breakpoints from within repl
- Adds newline for each multiline input

## 0.3.2

- Fixes #31 - adds ability to show surrounding code

## 0.3.1

- Fixes #28 - puppet 4.6 support
- Fixes #27 - repl should throw puppet error message instead of stacktrace
- adds support for customizing facterdb filter
- adds support for puppet 4.6
- Fixes #26 - allow configuration of facter version and facterdb filter

## 0.3.0

- Fixes #23 - add quiet flag to suppress banner
- Fixes #11 - cannot declare and use a class or define

## 0.2.3

- fixes #21 - type display causes error

## 0.2.2

- adds better support for playing back puppet code
  - this now allows playback of any manifest
  - allows mixed puppet code and repl commands

## 0.2.1

- Fixes #2 - adds support for multiline input

## 0.2.0

- Fixes #19 - lock down dependency versions
- fixes #18 - add ability to filter out functions based on namespace
- fixes #15 - node classes return error
- fixes #16 - use auto complete on functions and variables
- Fixes #14 - add functionality to set node object from remote source
- adds support for server_facts
- fixes other minor bugs found along the way
- adds ability to list classification parameters from ENC

## 0.1.1

- adds ability to load files or urls

## 0.1.0

- ensure the title of classes contains quotes
- adds support to import a file or import from stdin
- added additional ap support for puppet::pops::types
- adds ability to print resources and classes
- adds the ability to pass in a scope

## 0.0.8

- adds ability to list currently loaded classes
- adds formatted output using awesome print
- adds verbose type output when creating resources

## 0.0.7

- Added ability to list scope variables

## 0.0.6

- Bug fix for puppet 3.8

## 0.0.5

- Added ability to set puppet log level
