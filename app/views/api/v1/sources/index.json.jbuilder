json.sources @sources do |source|
	json.extract! source, :id, :title, :url, :collection
end