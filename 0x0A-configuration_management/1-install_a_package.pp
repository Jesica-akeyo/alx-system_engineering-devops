# this Puppet manifest installs the Flask package
package {'Flask':
ensure   => '2.1.0',
provider => 'pip3',
}
