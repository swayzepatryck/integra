require 'datatables/users_datatable.rb'

class UsersController < ApplicationController
  load_and_authorize_resource
  
  # GET /users
  # GET /users.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => UsersDatatable.new(view_context) }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    params[:user][:role_ids] ||= []
    @user.attributes = params[:user] 

    # medida de segurança, ja que cada usuario podera alterar suas informações pessoais.
    if cannot? :manage, User
      params[:user].delete(:role_ids)
      params[:user].delete(:role_ids)
      params[:user].delete(:admin)
    end

    respond_to do |format|
      if @user.save(:validate => false)
        if can? :manage, User
          format.html { redirect_to @user, :notice => t('devise.crud.user_updated_successfully') }
        else
          format.html { redirect_to root_path, :notice => t('devise.crud.user_updated_successfully') }
        end       
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end



