class example::foo {
  notify { 'foo': message => hiera('foo_message') }
}
