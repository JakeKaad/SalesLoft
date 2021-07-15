def mock_people
  # TODO Add mock for valid and invalid requests
  stub_request(:get, 'https://api.salesloft.com/v2/people').to_return(
    headers: {
      content_type: 'application/json; charset=utf-8'
    },
    body: {
      'data' => [
        {
          'id': 1,
          'created_at': '2021-01-01T00:00:00.000000-05:00',
          'updated_at': '2021-01-01T00:00:00.000000-05:00',
          'last_contacted_at': '2021-01-01T00:00:00.000000-05:00',
          'last_replied_at': '2021-01-01T00:00:00.000000-05:00',
          'first_name': 'Pat',
          'last_name': 'Johnson',
          'display_name': 'Pat Johnson',
          'email_address': 'pat.johnson@example.com',
          'full_email_address': 'Pat Johnson <pat.johnson@example.com>',
          'secondary_email_address': 'pat.johnson@example.com',
          'personal_email_address': 'pat.johnson@example.com',
          'phone': '+1 444 555 6666',
          'phone_extension': 'x123',
          'home_phone': '+1 444 555 6666',
          'mobile_phone': '+1 444 555 6666',
          'linkedin_url': 'https://www.linkedin.com/in/username',
          'title': 'Sales Development Representative',
          'city': 'Atlanta',
          'state': 'Georgia',
          'country': 'United States',
          'work_city': 'Atlanta',
          'work_state': 'Georgia',
          'work_country': 'United States',
          'crm_url': 'https://na15.salesforce.com/003i000001mnhpD',
          'crm_id': '003i000001mnhpD',
          'crm_object_type': 'Lead',
          'owner_crm_id': '003i000001mnhpD',
          'person_company_name': 'SalesLoft',
          'person_company_website': 'https://salesloft.com',
          'person_company_industry': 'Information Technology',
          'do_not_contact': true,
          'bouncing': true,
          'locale': 'US/Eastern',
          'personal_website': 'https://salesloft.com',
          'twitter_handle': '@kyleporter',
          'last_contacted_type': 'call',
          'job_seniority': 'vice_president',
          'custom_fields': {
            'MyField': 'A Value',
            'Other': 'Field'
          },
          'tags': %w[7-23-2017 dreamforce],
          'contact_restrictions': %w[call email message],
          'counts': {
            'emails_sent': 3,
            'emails_viewed': 2,
            'emails_clicked': 1,
            'emails_replied_to': 0,
            'emails_bounced': 0,
            'calls': 4
          },
          'account': {
            'id': 1,
            '_href': 'https://api.salesloft.com/v2/accounts/1'
          },
          'owner': {
            'id': 1,
            '_href': 'https://api.salesloft.com/v2/users/1'
          },
          'last_contacted_by': {
            'id': 1,
            '_href': 'https://api.salesloft.com/v2/users/1'
          },
          'import': {
            'id': 1,
            '_href': 'https://api.salesloft.com/v2/imports/1'
          },
          'person_stage': {
            'id': 1,
            '_href': 'https://api.salesloft.com/v2/person_stages/1'
          }
        }
      ]
    }.to_json
  )
end
