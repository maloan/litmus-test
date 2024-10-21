#!/usr/bin/ruby

# This example script is used for testing values enumeration of a specific Winreg registry.
# It will attempt to connect to a host and enumerate values of a specified registry key.
# Example usage: ruby enum_registry_values.rb 192.168.172.138 msfadmin msfadmin HKLM\\My\\Key
# This will try to connect to \\192.168.172.138 with the msfadmin:msfadmin credentialas and enumerate HKLM\\My\\Key values.

require 'bundler/setup'
require 'ruby_smb'

address  = ARGV[0]
username = ARGV[1]
password = ARGV[2]
registry_key = ARGV[3]

sock = TCPSocket.new address, 445
dispatcher = RubySMB::Dispatcher::Socket.new(sock, read_timeout: 60)

client = RubySMB::Client.new(dispatcher, smb1: true, smb2: true, username: username, password: password)
protocol = client.negotiate
status = client.authenticate

puts "#{protocol} : #{status}"

enum_result = client.enum_registry_values(address, registry_key)
puts enum_result

client.disconnect!


