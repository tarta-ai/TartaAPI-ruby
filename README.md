# TartaAPI-Ruby

## Overview
TartaAPI-Ruby is a Ruby wrapper for the Tarta API, designed to seamlessly integrate AI-powered job search functionality into your applications.

## API Documentation
For detailed API documentation, visit:  
[Tarta API Documentation](https://api.tarta.ai/swagger/index.html)

## What is Tarta?
Tarta.ai is a sophisticated AI platform that consolidates job listings from a wide range of sources, including job boards and social media. The platform streamlines the job search experience, matching users with suitable vacancies and even facilitating interview scheduling.

To learn more, visit:  
[Tarta Official Website](https://tarta.ai/)

## ChatGPT Integration
Tarta is also available as a ChatGPT plugin to enhance your job search experience:  
[Tarta ChatGPT Plugin](https://chat.openai.com/g/g-Gkf9YM4sR-job-search-in-the-us)

## Installation
To install TartaAPI-Ruby, add this line to your Gemfile:
```ruby
gem 'tarta-api'
```
Then, execute:
```sh
bundle install
```
Or install it yourself with:
```sh
gem install tarta-api
```

## Usage Example
Here's a simple example demonstrating how to use the library to execute a job search:

```ruby
require 'tarta_api'

def search_jobs(title, size = 5)
  request = TartaAPI::JobSearchRequest.new(title: title, size: size)
  
  begin
    results = TartaAPI::JobSearchService.search_jobs(request)
    jobs = results.fetch("jobs", [])

    if jobs.empty?
      puts "No job results found."
      return
    end

    puts "Job Search Results:"
    jobs.each do |job|
      job_name = job.fetch("name", "N/A")
      company = job.fetch("companyName", "N/A")
      location = job.fetch("location", {})
      city = location.fetch("city", "Unknown")
      state = location.fetch("state", "Unknown")
      country = location.fetch("country", "Unknown")
      source = job.fetch("feed", "N/A")
      posted_date = job.fetch("created", "N/A")

      puts "Job: #{job_name} at #{company}"
      puts "Location: #{city}, #{state}, #{country}"
      puts "Source: #{source}"
      puts "Posted: #{posted_date}\n"
    end

  rescue => e
    puts "Error fetching job results: #{e}"
  end
end

search_jobs("ruby", size: 2)

```

## Key Features
- **Effortless API Integration**: Interact with Tarta's API using straightforward Ruby methods.
- **AI Matching**: Utilize AI algorithms to find jobs that align with user profiles and preferences.
- **Interview Scheduling**: Automate interview scheduling to streamline the application process.

## Contributions
Contributions are welcome! Feel free to open issues or submit pull requests to enhance the library.

## License
This project is under the MIT License.

---
Experience the efficiency of Tarta and integrate AI-powered job search into your Ruby applications today!