json.array!(@bids) do |bid|
  json.extract! bid, :id, :details, :price, :period, :owner_id, :owner_type, :project_id
  json.url bid_url(bid, format: :json)
end
