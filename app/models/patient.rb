class Patient < ApplicationRecord

validates :first_name, uniqueness: true

  def self.get_patient(first_name)
      HTTParty.post('https://external-api-gateway.development.carecloud.com/v2/patients/search',
                  :headers => {'Authorization' => "Bearer #{ENV['CARECLOUD']}"},
                  :body =>  {
                    "limit": {},
                    "fields": {
                      "first_name": first_name
                    }
                  }.to_json)
  end

  def self.get_more_patient_info(patient_id)
      HTTParty.get('https://external-api-gateway.development.carecloud.com/v2/patients/' + patient_id,
                  :headers => {'Authorization' => "Bearer #{ENV['CARECLOUD']}"})
  end

  def self.get_insurances(patient_id)
    HTTParty.get("https://external-api-gateway.development.carecloud.com/v2/patients/#{patient_id}/insurances",
                :headers => {'Authorization' => 'Bearer JWq9K6XjRa90Lrlb69_frr0cGaosH5uz'},
                :body => {
                  "id": {},
                  "name": {},
                  "self_pay": {},
                  "default": {},
                  "insurance_policies": {
                    "policy_priority": {},
                    "member_number": {},
                    "policy_number": {},
                    "effective_from": {},
                    "effective_to": {},
                    "co_payment": {},
                    "type": {},
                    "insured": {
                      "first_name": {},
                      "last_name": {},
                      "middle_initial": {},
                      "dob": {},
                      "gender": {},
                      "relation_to_patient": {},
                      "addresses": {
                        "line1": {},
                        "line2": {},
                        "line3": {},
                        "city": {},
                        "state": {},
                        "zip": {},
                        "county_name": {},
                        "country_name": {},
                        "is_primary": {},
                        "latitude": {},
                        "longitude": {}
                      },
                      "phones": {
                        "phone_number": {},
                        "phone_type": {},
                        "phone_ext": {},
                        "is_primary": {}
                      }
                    },
                    "payer": {
                      "id": {},
                      "name": {},
                      "phones": {
                        "phone_number": {},
                        "phone_type": {},
                        "phone_ext": {},
                        "is_primary": {}
                      },
                      "address": {
                        "line1": {},
                        "line2": {},
                        "line3": {},
                        "city": {},
                        "state": {},
                        "zip": {},
                        "county_name": {},
                        "country_name": {},
                        "is_primary": {},
                        "latitude": {},
                        "longitude": {}
                      }
                    }
                  }
                  })
  end
end
