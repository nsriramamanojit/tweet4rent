require 'couch_connect'
class ServiceController < ApplicationController
  helper :all
  helper_method :current_user_session, :current_user
  
  def index  
  end
  
  def new
  end
  
  def create
    
    if UserSession.find == nil
    redirect_to new_user_session_url
    else
    @message = Hash.new
    @message['lookingfor'] = params[:lookingfor]
    @message['service'] = params[:service]
    @message['city'] = params[:city]    
    @message['location'] = params[:location]    
    @message['budgetmin'] = params[:budgetmin]    
    @message['budgetmax'] = params[:budgetmax]    
    @message['options'] = params[:options]    
    @message['firstname'] = params[:firstname]    
    @message['lastname'] = params[:lastname]    
    @message['email'] = params[:email]    
    @message['phone'] = params[:phone]    
    @message['mobile'] = params[:mobile]    
    @message['created_on'] = Time.now.to_s
    @message['user'] = current_user
    @message['openclose'] = 0
    @message['closedate'] = Time.now.to_s
    @message['foundornot'] = 0  
    @message['notification'] = 0
     

    server = Couch::Server.new("localhost", "5984")
    res = server.post('//tweet4rent',@message.to_json)
    
    redirect_to :controller=>'service', :action=>'new'
    end
    
   end
   
   def search
   end
   
   def search_result
	    @search = params[:query]
	    url = '//tweet4rent/_fti/_design/search/city_location?q="'+@search+'"&include_docs=true'
	    server = Couch::Server.new("localhost", "5984")
	    res = server.get(url)
	    h1 = JSON.parse(res.body)
	    @result = h1['rows']
      respond_to do |format|
        format.html
      end
   end
   
 
end
