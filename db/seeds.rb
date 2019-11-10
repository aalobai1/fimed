
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
patient = Patient.create(given_name: 'Whoopi', family_name: 'Goldberg', race: 'white', gender: 'male')
patient.treatments.create(display_name: 'Encounter for general adult medical examination with abnormal findings', coding: 'code', code: 'Z00.01')
patient.treatments.create(display_name: 'Biopsy of skin, subcutaneous tissue and/or mucous membrane (including simple closure)', coding: 'code', code: '11100')
patient.treatments.create(display_name: 'Excision of malignant skin lesion', coding: 'code', code: '11600')
patient.treatments.create(display_name: 'Surgical pathology, gross and microscopic examination', coding: 'code', code: '88304')
patient.treatments.create(display_name: 'Encounter for screening of malignant neoplasms (dermatology)', coding: 'code', code: 'Z12.83')
patient.treatments.create(display_name: 'Under Clinical Treatment Planning (External and Internal Sources) for Radiation Treatment (med oncology)', coding: 'code', code: '77261')
patient.treatments.create(display_name: 'comprehensive physical, for an established patient, and select the code based on the patients age', coding: 'code', code: '99395')



