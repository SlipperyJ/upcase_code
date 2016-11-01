require "rails_helper"

RSpec.describe Invitation do

  def build_invitation(team: nil, user: nil)
    build(:invitation, team: team, user: user)
  end

  def create_user
    create(:user, email: "rookie@example.com")
  end

  def create_team
    create(:team, name: "A fine team")
  end

  def valid_invitation
    team = create_team
    new_user = create_user
    build_invitation(team: team, user: new_user)
  end

  describe "callbacks" do
    describe "after_save" do
      context "with valid data" do
        it "invites the user" do
          new_user = create_user
          new_team = create_team
          invitation = build_invitation(team: new_team, user: new_user)

          invitation.save

          expect(new_user).to be_invited
        end
      end

      context "with invalid data" do
        it "does not save the invitation" do
          new_user = create_user
          invitation = build_invitation(user: new_user)

          invitation.save

          expect(invitation).not_to be_valid
          expect(invitation).to be_new_record
        end

        it "does not mark the user as invited" do
          new_user = create_user
          invitation = build_invitation(user: new_user)

          invitation.save

          expect(new_user).not_to be_invited
        end
      end
    end
  end

  describe "#event_log_statement" do
    context "when the record is saved" do

      it "include the name of the team" do
        invitation = valid_invitation

        invitation.save
        log_statement = invitation.event_log_statement

        expect(log_statement).to include("A fine team")
      end

      it "include the email of the invitee" do
        invitation = valid_invitation

        invitation.save
        log_statement = invitation.event_log_statement

        expect(log_statement).to include("rookie@example.com")
      end
    end

    context "when the record is not saved but valid" do
      it "includes the name of the team" do
        invitation = valid_invitation

        log_statement = invitation.event_log_statement

        expect(log_statement).to include("A fine team")
      end

      it "includes the email of the invitee" do
        invitation = valid_invitation

        log_statement = invitation.event_log_statement

        expect(log_statement).to include("rookie@example.com")
      end

      it "includes the word 'PENDING'" do
        invitation = valid_invitation

        log_statement = invitation.event_log_statement

        expect(log_statement).to include("PENDING")
      end
    end

    context "when the record is not saved and not valid" do
      it "includes INVALID" do
        new_user = create_user
        invitation = build_invitation(user: new_user)

        log_statement = invitation.event_log_statement

        expect(log_statement).to include("INVALID")
      end
    end
  end
end
