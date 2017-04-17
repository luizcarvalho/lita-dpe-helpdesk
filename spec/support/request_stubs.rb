def stub_helpdesk(options = {})
  stub_request(:post, 'http://helpdesk.url/')
    .to_return(status: 200, body: "{\"id\": #{options[:expect_id]}}")
end
