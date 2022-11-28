class UserMailer < ApplicationMailer
  default from: 'tjtanay6@gmail.com'
  def welcome_email(resource)
      @resource = params[:resource]
      mail(to: @resource.email, subject: 'Welcome to Holly Bolly Cafe ')
    end
  end
