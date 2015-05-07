# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "DescriptionForMeasurementGroup", primary_key: "DescriptionForMeasurementGroupID", force: :cascade do |t|
    t.string  "name",    limit: 100, null: false
    t.string  "value",   limit: 300
    t.integer "groupID"
  end

  add_index "DescriptionForMeasurementGroup", ["name"], name: "name_measur_group", using: :btree

  create_table "DescriptionForRD", primary_key: "DescriptionForRdID", force: :cascade do |t|
    t.string  "name",  limit: 50,  null: false
    t.string  "value", limit: 300
    t.integer "rdID"
  end

  add_index "DescriptionForRD", ["name"], name: "name_rp", using: :btree

  create_table "Device", primary_key: "deviceID", force: :cascade do |t|
    t.string "name",         limit: 100, null: false
    t.string "manufacturer", limit: 50
    t.text   "description"
    t.string "model",        limit: 200
  end

  add_index "Device", ["name"], name: "name", using: :btree

  create_table "Linked", id: false, force: :cascade do |t|
    t.integer "measurementID", null: false
    t.integer "groupID",       null: false
  end

  create_table "Measurement", primary_key: "measurementID", force: :cascade do |t|
    t.string  "fileName", limit: 200, null: false
    t.integer "count",                null: false
    t.float   "binTime"
    t.float   "T"
    t.float   "C",                    null: false
    t.float   "n"
    t.integer "rpID"
    t.text    "x"
    t.text    "y"
    t.text    "z"
    t.text    "std"
  end

  add_index "Measurement", ["C"], name: "C", using: :btree
  add_index "Measurement", ["T"], name: "T", using: :btree
  add_index "Measurement", ["binTime"], name: "count", using: :btree
  add_index "Measurement", ["count", "binTime"], name: "double_index", using: :btree
  add_index "Measurement", ["fileName"], name: "fileName", using: :btree
  add_index "Measurement", ["n"], name: "n", using: :btree

  create_table "MeasurementDescriptionForMeasurement", primary_key: "DescriptionForMeasurementID", force: :cascade do |t|
    t.string  "name",          limit: 100, null: false
    t.string  "value",         limit: 300
    t.integer "measurementID"
  end

  add_index "MeasurementDescriptionForMeasurement", ["name"], name: "name_measur", using: :btree

  create_table "MeasurementGroup", primary_key: "groupID", force: :cascade do |t|
    t.integer "sampleID"
    t.integer "researcherID"
    t.integer "deviceID"
    t.string  "name",         limit: 100, null: false
    t.date    "date",                     null: false
  end

  add_index "MeasurementGroup", ["date"], name: "date", using: :btree
  add_index "MeasurementGroup", ["name"], name: "name_measurement", using: :btree

  create_table "RawData", primary_key: "rdID", force: :cascade do |t|
    t.integer "groupID",                      null: false
    t.string  "name",             limit: 100, null: false
    t.string  "FileName",         limit: 200
    t.string  "linkToFile",       limit: 500
    t.integer "startTime"
    t.integer "repetitionNumber"
    t.integer "kineticsNumber"
    t.text    "description"
  end

  add_index "RawData", ["FileName"], name: "FileName", using: :btree
  add_index "RawData", ["name"], name: "name_rd", using: :btree

  create_table "Researcher", primary_key: "researcherID", force: :cascade do |t|
    t.string  "name",          limit: 100, null: false
    t.integer "phone"
    t.string  "organizations", limit: 100
    t.string  "address",       limit: 300
    t.string  "email",         limit: 100
  end

  add_index "Researcher", ["email"], name: "Researcher_email_key", unique: true, using: :btree
  add_index "Researcher", ["name"], name: "index_name", using: :btree
  add_index "Researcher", ["organizations"], name: "organization", using: :btree

  create_table "Sample", primary_key: "sampleID", force: :cascade do |t|
    t.string  "name",        limit: 100, null: false
    t.float   "weight"
    t.integer "size"
    t.float   "M"
    t.float   "lambda_em"
    t.float   "lambda_ex"
    t.text    "description"
  end

  add_index "Sample", ["name"], name: "name_sample", using: :btree
  add_index "Sample", ["size"], name: "size", using: :btree
  add_index "Sample", ["weight"], name: "weight", using: :btree

  add_foreign_key "DescriptionForMeasurementGroup", "\"MeasurementGroup\"", column: "groupID", primary_key: "groupID", name: "Ref_DescriptionForMeasurementGroup_to_MeasurementGroup"
  add_foreign_key "DescriptionForRD", "\"RawData\"", column: "rdID", primary_key: "rdID", name: "Ref_DescriptionForRD_to_RawData"
  add_foreign_key "Linked", "\"MeasurementGroup\"", column: "groupID", primary_key: "groupID", name: "Ref_Linked_to_MeasurementGroup"
  add_foreign_key "Linked", "\"Measurement\"", column: "measurementID", primary_key: "measurementID", name: "Ref_Linked_to_Measurement"
  add_foreign_key "Measurement", "\"RawData\"", column: "rpID", primary_key: "rdID", name: "Measurement_fk"
  add_foreign_key "MeasurementDescriptionForMeasurement", "\"Measurement\"", column: "measurementID", primary_key: "measurementID", name: "Ref_MeasurementDescriptionForMeasurement_to_Measurement"
  add_foreign_key "MeasurementGroup", "\"Device\"", column: "deviceID", primary_key: "deviceID", name: "Ref_MeasurementGroup_to_Device"
  add_foreign_key "MeasurementGroup", "\"Researcher\"", column: "researcherID", primary_key: "researcherID", name: "Ref_MeasurementGroup_to_Researcher"
  add_foreign_key "MeasurementGroup", "\"Sample\"", column: "sampleID", primary_key: "sampleID", name: "Ref_MeasurementGroup_to_Sample"
  add_foreign_key "RawData", "\"MeasurementGroup\"", column: "groupID", primary_key: "groupID", name: "Ref_RP_to_MeasurementGroup"
end
