module Support 
  module Helpers 
    module EmailHelper

      def last_delivered_email 
        ActionMailer::Base.deliveries.last
      end

      def clear_email_deliveries 
        ActionMailer::Base.deliveries = []      
      end

      def emails_to(email, subject=nil) 
        deliveries = ActionMailer::Base.deliveries
        emails = deliveries.select { |i| i.to.include?(email) }
      end

      def last_email_to(email, subject=nil) 
        emails_to(email, subject=nil).first
      end

      def click_link_in_email(link_text, email=last_delivered_email)
        html = Nokogiri::HTML(email.body.to_s)
        target_link = html.at("a:contains('#{link_text}')")
        visit target_link["href"].split('http://localhost:3000/').last
      end
    end
  end 
end