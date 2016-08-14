class PatientsController < ApplicationController
  include HTTParty


  def index
    patients = Patient.all
    render json: patients
  end

  def api_patient
    first_name = params[:first_name]
    parsed_response = JSON.parse(Patient.get_patient(first_name).body)
    patient_id = parsed_response["patients"][0]["id"]
    parsed_patient = JSON.parse(Patient.get_more_patient_info(patient_id).body)
    parsed_insurance = JSON.parse(Patient.get_insurances(patient_id).body)


    patient = parsed_patient["patient"]
    address = patient["addresses"][0]
    insurance = patient['insurance_profiles'][0]
    phones = patient['phones'][0]["phone_number"] rescue nil
    new_patient = Patient.create(
                  first_name: patient['first_name'],
                  last_name: patient['last_name'],
                  dob: patient['dob'],
                  email_address: patient['email_address'],
                  account_number: patient['account_number'],
                  drivers_license_number: patient['drivers_license_number'],
                  date_of_death: patient['date_of_death'],
                  gender: patient['gender'],
                  ethnicity: patient['ethnicity'],
                  address: "#{address['line1']}, #{address['city']}, #{address['state']}, #{address['zip']}, #{address['country_name']}",
                  primary_provider_id: patient['primary_provider_id'],
                  phones: phones,
                  insurance_profiles: "#{insurance['id']}, #{insurance['self_pay']}, #{insurance['insurance_policies']}")

    render json: new_patient
  end
  # {
  #   id: 24558788,
  #   line1: "1948 NW 26TH STREET",
  #   line2: null,
  #   city: "MIAMI",
  #   state: "Florida",
  #   state_id: 10,
  #   zip: "33131",
  #   country_id: 225,
  #   country_name: "UNITED STATES",
  #   county_name: null,
  #   is_primary: true
  #   }

end
