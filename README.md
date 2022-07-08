# Personal Helath Record (PHR)

A Web API project that can serve as medical record of a patient or user in electronic format about personal health information written by the user independently.

## Stack

- Ruby -v 3.1.2
- Ruby on Rails -v 7.0.3
- sqlite3 -v 1.4

## Gem Library

- [rspec-rails](https://github.com/rspec/rspec-rails)
- [factory_bot_rails](https://github.com/thoughtbot/factory_bot_rails)
- [faker](https://github.com/faker-ruby/faker)
- [shoulda-matcher](https://github.com/thoughtbot/shoulda-matchers)
- [bcrypt](https://github.com/bcrypt-ruby/bcrypt-ruby)
- [pundit](https://github.com/RailsApps/rails-devise-pundit)
- [jwt](https://github.com/jwt/ruby-jwt)
- [database_cleaner](https://github.com/DatabaseCleaner/database_cleaner)
- [active_model_serializers](https://github.com/symfony/serializer)
- [carrierwave](https://github.com/carrierwaveuploader/carrierwave)
- [rack-cors](https://github.com/cyu/rack-cors)

## Feature List

- User Authentication (Register and Login)
- Profile User
- Body Weight and Height with BMI Calculation Record
- Blood Pressure and Pulse Record
- Blood Oxygen/Saturation Record
- Blood Glucose Record
- Vaccine Record
- Documentation Record
- Lab Result & Lab Measurement Record

## Installation

#### Clone project

```
https://github.com/BE-HE-6/project-phr.git
```

#### Install gem library

```
bundle install
```

#### Migration Database

```
rails db:migrate
```

#### Run the server

```
rails s
```

#### To Run Rspec Test

```
rspec -fd
```

## API Documentation

#### [User Registration](./docs/FT-1/Registration.md)

#### [User Login](./docs/FT-2/Login.md)

#### [User Profile](./docs/FT-3/Profile.md)

#### [Body Weight Height](./docs/FT-4/BodyWeightHeight.md)

#### [Blood Pressure Condition](./docs/FT-5/BloodPressureCondition.md)

#### [Blood Pressure](./docs/FT-5/BloodPressureCondition.md)

#### [Blood Oxygen Condition](./docs/FT-6/BloodOxygenCondition.md)

#### [Blood Oxygen](./docs/FT-6/BloodOxygen.md)

#### [Blood Glucose Condition](./docs/FT-7/BloodGlucoseCondition.md)

#### [Blood Glucose](./docs/FT-7/BloodGlucose.md)

#### [Vaccine Categories](./docs/FT-8/tb_vaccine_categories.md)

#### [Vaccines](./docs/FT-8/tb_vaccines.md)

#### [Document Categories](./docs/FT-9/tb_document_categories.md)

#### [Documents](./docs/FT-9/tb_documents.md)

#### [Measurements](./docs/FT-10/tb_lab_measurements.md)

#### [Results](./docs/FT-10/tb_lab_results.md)

## Additional Information

#### [Database Design](https://drive.google.com/file/d/1_KAMczs5TRCFWnOVvXOGUE61i-jUg4NM/view?usp=sharing)
