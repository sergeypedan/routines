# frozen_string_literal: true

require "rails_helper"

RSpec.describe Duration do

	describe "#initialize" do

		subject { described_class.new(amount, unit) }

		context "with valid input" do
			let(:amount) { 600 }
			let(:unit) { :seconds }
			it { is_expected.to be_a Duration }
		end
	end

	describe "#seconds" do

		subject { described_class.new(amount, unit).seconds }

		context "initialized with seconds" do
			let(:amount) { 600 }
			let(:unit) { :seconds }
			it { is_expected.to eq amount }
		end

		context "initialized with minutes" do
			let(:amount) { 10 }
			let(:unit) { :minutes }
			it { is_expected.to eq amount * 60 }
		end

		context "initialized with hours" do
			let(:amount) { 1 }
			let(:unit) { :hours }
			it { is_expected.to eq 3600 }
		end

	end

	describe "#minutes" do

		subject { described_class.new(amount, unit).minutes }

		context "initialized with seconds" do
			let(:amount) { 600 }
			let(:unit) { :seconds }
			it { is_expected.to eq amount / 60 }
		end

		context "initialized with minutes" do
			let(:amount) { 10 }
			let(:unit) { :minutes }
			it { is_expected.to eq amount }
		end

		context "initialized with hours" do
			let(:amount) { 1 }
			let(:unit) { :hours }
			it { is_expected.to eq amount * 60 }
		end

	end

	describe "#hours" do

		subject { described_class.new(amount, unit).hours }

		context "initialized with seconds" do
			let(:amount) { 3600 }
			let(:unit) { :seconds }
			it { is_expected.to eq 1 }
		end

		context "initialized with minutes" do
			let(:amount) { 60 }
			let(:unit) { :minutes }
			it { is_expected.to eq amount / 60.to_f }
		end

		context "initialized with hours" do
			let(:amount) { 1 }
			let(:unit) { :hours }
			it { is_expected.to eq amount }
		end

	end

	describe "#in" do

		subject { described_class.new(amount, input_unit).in(output_unit) }

		let(:amount) { 1800 }
		let(:input_unit) { :seconds }

		context "in seconds" do
			let(:output_unit) { :seconds }
			let(:unit) { :seconds }
			it { is_expected.to eq 1800 }
		end

		context "in minutes" do
			let(:output_unit) { :minutes }
			it { is_expected.to eq 30 }
		end

		context "in hours" do
			let(:output_unit) { :hours }
			it { is_expected.to eq 0.5 }
		end

	end

	describe "#in_s" do

		subject { described_class.new(amount, input_unit).in_s(output_unit, to_i: to_i) }

		let(:amount) { 1800 }
		let(:input_unit) { :seconds }

		context "with to_i: true" do
			let(:output_unit) { :minutes }
			let(:to_i) { true }
			it { is_expected.to eq "30 minutes" }
		end

		context "with to_i: false" do
			let(:output_unit) { :minutes }
			let(:to_i) { false }
			it { is_expected.to eq "30.0 minutes" }
		end

	end

end
