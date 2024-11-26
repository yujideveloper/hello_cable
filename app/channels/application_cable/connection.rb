module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_account

    def connect
      self.current_account = find_verified_account
      logger.add_tags "ActionCable", current_account.email
    end

    private

    def find_verified_account
      if (current_account = Account.find_by(id: cookies.signed[:"account.id"])) && cookies.signed[:"account.expired_at"] > Time.current
        current_account
      else
        reject_unauthorized_connection
      end
    end
  end
end
