json.extract! ticket, :id, :gig_id, :row, :number, :user_id, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
