# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Generating Seeds'

# Roles
superuser = Role.create(key: 'SUPERUSER', name: 'superuser', description: 'This role grants access to do everything system wide.')
admin = Role.create(key: 'ADMIN', name: 'admin', description: 'This role grants access to do everything on a company basis.')
test_creator = Role.create(key: 'TEST-CREATOR', name: 'test creator', description: 'This role grants access to add, edit, and remove shared steps, tests, suites, features and apps.')
tester = Role.create(key: 'TESTER', name: 'tester', description: 'This role grants access to start suite or feature executions and run tests and mark them as pass/fail.')
reporter = Role.create(key: 'REPORTER', name: 'reporter', description: 'This role grants access to run reports.')

# CRUD Shared Steps
create_shared_steps = Operation.create(key: 'CREATE-SHARED-STEPS', name: 'create shared steps', description: 'This operation represents the ability to create shared steps.')
read_shared_steps = Operation.create(key: 'READ-SHARED-STEPS', name: 'read shared steps', description: 'This operation represents the ability to read shared steps.')
update_shared_steps = Operation.create(key: 'EDIT-SHARED-STEPS', name: 'edit shared steps', description: 'This operation represents the ability to edit shared steps.')
delete_shared_steps = Operation.create(key: 'DELETE-SHARED-STEPS', name: 'delete shared steps', description: 'This operation represents the ability to delete shared steps.')

# CRUD Steps
create_steps = Operation.create(key: 'CREATE-STEPS', name: 'create steps', description: 'This operation represents the ability to create steps.')
read_steps = Operation.create(key: 'READ-STEPS', name: 'read steps', description: 'This operation represents the ability to read steps.')
update_steps = Operation.create(key: 'EDIT-STEPS', name: 'edit steps', description: 'This operation represents the ability to edit steps.')
delete_steps = Operation.create(key: 'DELETE-STEPS', name: 'delete steps', description: 'This operation represents the ability to delete steps.')

# CRUD Tests
create_tests = Operation.create(key: 'CREATE-TESTS', name: 'create tests', description: 'This operation represents the ability to create tests.')
read_tests = Operation.create(key: 'READ-TESTS', name: 'read tests', description: 'This operation represents the ability to read tests.')
update_tests = Operation.create(key: 'EDIT-TESTS', name: 'edit tests', description: 'This operation represents the ability to edit tests.')
delete_tests = Operation.create(key: 'DELETE-TESTS', name: 'delete tests', description: 'This operation represents the ability to delete tests.')
run_tests = Operation.create(key: 'RUN-TESTS', name: 'run tests', description: 'This operation represents the ability to run tests.')

# CRUD Suites
create_suites = Operation.create(key: 'CREATE-SUITES', name: 'create suites', description: 'This operation represents the ability to create suites.')
read_suites = Operation.create(key: 'READ-SUITES', name: 'read suites', description: 'This operation represents the ability to read suites.')
update_suites = Operation.create(key: 'EDIT-SUITES', name: 'edit suites', description: 'This operation represents the ability to edit suites.')
delete_suites = Operation.create(key: 'DELETE-SUITES', name: 'delete suites', description: 'This operation represents the ability to delete suites.')

# CRUD Features
create_features = Operation.create(key: 'CREATE-FEATURES', name: 'create features', description: 'This operation represents the ability to create features.')
read_features = Operation.create(key: 'READ-FEATURES', name: 'read features', description: 'This operation represents the ability to read features.')
update_features = Operation.create(key: 'EDIT-FEATURES', name: 'edit features', description: 'This operation represents the ability to edit features.')
delete_features = Operation.create(key: 'DELETE-FEATURES', name: 'delete features', description: 'This operation represents the ability to delete features.')

# CRUD Apps
create_apps = Operation.create(key: 'CREATE-APPS', name: 'create apps', description: 'This operation represents the ability to create apps.')
read_apps = Operation.create(key: 'READ-APPS', name: 'read apps', description: 'This operation represents the ability to read apps.')
update_apps = Operation.create(key: 'EDIT-APPS', name: 'edit apps', description: 'This operation represents the ability to edit apps.')
delete_apps = Operation.create(key: 'DELETE-APPS', name: 'delete apps', description: 'This operation represents the ability to delete apps.')

# CRUD Companies
create_companies = Operation.create(key: 'CREATE-COMPANIES', name: 'create companies', description: 'This operation represents the ability to create companies.')
read_companies = Operation.create(key: 'READ-COMPANIES', name: 'read companies', description: 'This operation represents the ability to read companies.')
update_companies = Operation.create(key: 'EDIT-COMPANIES', name: 'edit companies', description: 'This operation represents the ability to edit companies.')
delete_companies = Operation.create(key: 'DELETE-COMPANIES', name: 'delete companies', description: 'This operation represents the ability to delete companies.')

# CRUD Reports
create_reports = Operation.create(key: 'CREATE-REPORTS', name: 'create reports', description: 'This operation represents the ability to create reports.')
read_reports = Operation.create(key: 'READ-REPORTS', name: 'read reports', description: 'This operation represents the ability to read reports.')

# Users
manage_users = Operation.create(key: 'MANAGE-USERS', name: 'manage users', description: 'This operation represents the ability to manage users.')

# Permissions
reporter.operations = [
  create_reports,
  read_reports
]

tester.operations = [
  run_tests,
  create_reports,
  read_reports
]

test_creator.operations = [
  create_shared_steps,
  read_shared_steps,
  update_shared_steps,
  delete_shared_steps,

  create_steps,
  read_steps,
  update_steps,
  delete_steps,

  create_tests,
  read_tests,
  update_tests,
  delete_tests,
  run_tests,

  create_suites,
  read_suites,
  update_suites,
  delete_suites,

  create_features,
  read_features,
  update_features,
  delete_features,

  create_apps,
  read_apps,
  update_apps,
  delete_apps,

  create_reports,
  read_reports
]

admin.operations = [
  read_companies,
  update_companies,
  manage_users,
  create_reports,
  read_reports
]

superuser.operations = Operation.all

aaron = User.create(first_name: 'Aaron', last_name: 'Humerickhouse', email: 'aaron@humerickhouse.me', password: 'Test1234', password_confirmation: 'Test1234', confirmed_at: Time.now)
aaron.roles = [superuser]

unless Rails.env.production?
  Fabrication.configure do |config|
    config.fabricator_path = 'data/fabricators'
    config.path_prefix = Rails.root
    config.sequence_start = 10000
  end
  
  Fabrication.manager.load_definitions
  
  Fabricate(
    :user, 
    email: 'admin@example.com',
    roles: [admin]
  )

  Fabricate(
    :user, 
    email: 'superuser@example.com',
    roles: [superuser]
  )

  Fabricate(
    :user, 
    email: 'tester@example.com',
    roles: [tester]
  )

  Fabricate(
    :user, 
    email: 'test_creator@example.com',
    roles: [test_creator]
  )

  Fabricate(
    :user, 
    email: 'reporter@example.com',
    roles: [reporter]
  )
end
