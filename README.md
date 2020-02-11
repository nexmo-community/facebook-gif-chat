# Facebook Messenger Animated Gif Search and Transform Chatbot

<div style="text-align:center"><img src="https://github.com/nexmo-community/facebook-gif-chat/blob/master/facebook_gif_chat_example.gif" /></div>

This repository contains the code for a working Facebook Messenger Chatbot that allows users to search for animated gifs and then apply instant image transformations to those gifs and receive back the transformed gif. 

* [Prerequisites](#prerequisites)
* [Installation and Usage](#installation-and-usage)
* [Contributing](#contributing)
* [License](#license)

## Prerequisites

In order to use this application you need to have:

* [Ruby on Rails](https://rubyonrails.org/) installed locally
* [Nexmo Account](https://dashboard.nexmo.com/sign-up?utm_source=DEV_REL&utm_medium=github&utm_campaign=facebook-gif-chat) and API Credentials
* [GIPHY Developer Account](https://developers.giphy.com/) and API credentials
* [Cloudinary Account](https://cloudinary.com/users/register/free) and API Credentials
* [Facebook](https://www.facebook.com)

## Installation and Usage

To install and use this application:

* Clone the repository
* Rename the `.env.sample` file to `.env`
* Fill in your API credentials in the `.env` file
* Run `bundle install` and `rake db:migrate` to initialize your Rails application
* Start your Rails server with `bundle exec rails start`
* Make sure your Rails server is externally available. ([Using ngrok](https://developer.nexmo.com/concepts/guides/testing-with-ngrok) is a great way to do that in development)
* Provide your externally available webhook status and inbound URLs (`#{YOUR_URL}/inbound` and `#{YOUR_URL}/status`) to your [Nexmo Application](https://dashboard.nexmo.com) set-up so you can receive incoming Facebook chat messages
* Link your Nexmo Application to your Facebook Page (See [this guide](https://developer.nexmo.com/messages/concepts/facebook) on how to do that)
* Search for an animated gif by sending a message to your linked Facebook page in the following format: `search #{item}`, i.e. `search hummus`
* Send a subsequent transformation request in the following message format: `transform #{transformation}`, i.e. `transform sepia`

## Contributing

We ❤️ contributions from everyone! [Bug reports](https://github.com/Nexmo-community/facebook-gif-chat/issues), [bug fixes](https://github.com/Nexmo/facebook-gif-chat/pulls) and feedback on the library is always appreciated. Look at the [Contributor Guidelines](https://github.com/Nexmo/facebook-gif-chat/blob/master/CONTRIBUTING.md) for more information and please follow the [GitHub Flow](https://guides.github.com/introduction/flow/index.html).

## License

This project is under the [MIT LICENSE](https://github.com/Nexmo/facebook-gif-chat/blob/master/LICENSE.txt).
