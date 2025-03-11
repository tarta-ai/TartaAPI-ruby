require 'net/http'
require 'json'

module TartaAPI
  API_BASE_URL = 'https://api.tarta.ai'

  class JobSearchRequest
    attr_reader :title, :company_name, :city, :state, :country, :is_remote, :size

    def initialize(title:, size:, company_name: nil, city: nil, state: nil, country: nil, is_remote: nil)
      @title = title
      @company_name = company_name
      @city = city
      @state = state
      @country = country
      @is_remote = is_remote
      @size = size
    end

    def to_h
      {
        title: title,
        companyName: company_name,
        city: city,
        state: state,
        country: country,
        isRemote: is_remote,
        size: size
      }.compact
    end
  end

  class JobSearchService
    def self.search_jobs(request)
      uri = URI.join(API_BASE_URL, '/api/v1/search')
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      
      req = Net::HTTP::Post.new(uri, { 'Content-Type' => 'application/json' })
      req.body = request.to_h.to_json

      response = http.request(req)
      
      raise "Error: #{response.message}" unless response.is_a?(Net::HTTPSuccess)
      
      JSON.parse(response.body, symbolize_names: true)
    rescue StandardError => e
      warn "Job search request failed: #{e.message}"
      raise 'Unable to complete the job search request.'
    end
  end
end
