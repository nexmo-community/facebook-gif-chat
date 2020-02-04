class ChatController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def inbound
    puts params

    # take image search param and user id
    input = params[:message][:content][:text]
    action_verb = input.split.first.downcase
    action_item = input.split(' ')[1..-1].join(' ').downcase
    fb_user = params[:from][:id]

    # Search or Transform Case Statement
    case action_verb
    when 'search'
      @@image = ImageSearch.search(action_item)
      @@image = @@image.split("?")[0]
      message = search_message
      Messenger.send_text_only(message, fb_user)
      Messenger.send_image(@@image, message, fb_user)
    when 'transform'
      @@image = ImageEditor.apply_transformation(@@image, action_item)
      message = transform_message
      Messenger.send_text_only(message, fb_user)
      Messenger.send_image(@@image, message, fb_user)
    else
      Messenger.send_text_only(error_response, fb_user)
    end

    head :no_content
  end

  def status
    puts params
    head :no_content
  end

  def spam
    head :no_content
  end

  private

  def search_message
    <<~HEREDOC
      That is a pretty neat gif! Do you want to modify it? \n
      If yes, please reply with one of the following options: \n\n
      Reply with "transform black and white" if you want to make it black and white \n
      Reply with "transform sepia" if you want to make it sepia \n
      Reply with "transform zorro" to apply the Zorro art effect \n
      Reply with "transform red rock" to apply the Red Rock art effect \n
      Reply with "transform pixelate" to pixelate the image \n
      Reply with "transform blur" to blur the image \n
      Reply with "transform blur faces" to blur only faces in the image \n
      Reply with "transform vignette" to apply the vignette effect on the image \n
      Reply with "transform transparent" to make the image transparent \n
      Reply with "transform hairspray" to apply the hairspray art effect \n
      Reply with "transform sizzle" to apply the sizzle art effect \n
    HEREDOC
  end

  def transform_message
    <<~HEREDOC
      Here is your transformed image! Hope you like it!
    HEREDOC
  end

  def error_response
    <<~HEREDOC
      Sorry! I don't know that action. I was expecting either 'search' or 'transform'
    HEREDOC
  end
end
