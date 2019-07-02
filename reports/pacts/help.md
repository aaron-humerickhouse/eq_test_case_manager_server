# For assistance debugging failures

* The pact files have been stored locally in the following temp directory:
    /home/aaron/essential_quality/eq_test_case_manager_server/tmp/pacts

* The requests and responses are logged in the following log file:
    /home/aaron/essential_quality/eq_test_case_manager_server/log/pact.log

* Add BACKTRACE=true to the `rake pact:verify` command to see the full backtrace

* If the diff output is confusing, try using another diff formatter.
  The options are :unix, :embedded and :list

    Pact.configure do | config |
      config.diff_formatter = :embedded
    end

  See https://github.com/pact-foundation/pact-ruby/blob/master/documentation/configuration.md#diff_formatter for examples and more information.

* Check out https://github.com/pact-foundation/pact-ruby/wiki/Troubleshooting

* Ask a question on stackoverflow and tag it `pact-ruby`


Tried to retrieve diff with previous pact from https://eq-pact-broker.herokuapp.com/pacts/provider/EQ%20-%20TCM%20Server/consumer/EQ%20-%20TCM%20UI/version/93e8c70f4d83dfea1676b1d972d353514b07b537/diff/previous-distinct, but received response code 401 Unauthorized.