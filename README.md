#lsc_simple_config gem

A simple config (ini) file parser for files similar to the ones
used in PHP with parse_ini_file() or in Turbo/Borland Pascal.
Suitable, when using formats like yaml, xlm or the like would be an exageration.

###Config file format:

* a single variable

  ```
  name = value
  ```

* a table of values

  ```
  table_name[] = first_value
  table_name[] = second_value
  table_name[] = third_value
  ```

All lines not containing the '=' sign are ignored.

###Usage:

  ```ruby
  require lsc_simple_config

  config = SimpleConfig.new("sample.cfg")

  some_var = config['name']

  some_table = config['table_name']
  ```

The returned values are strings.

###TODO/Plans

* add some data validation
* add sections in config files



