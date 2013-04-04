class example::bar {
  notify { 'bar': message => hiera('bar_message') }
}
