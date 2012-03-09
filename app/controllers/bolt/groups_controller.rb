module Bolt
class GroupsController < ApplicationController
  # GET /bolt/groups
  # GET /bolt/groups.json
  layout "bolt_main"
  def index
    @groups = Group.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @groups }
    end
  end

  # GET /bolt/groups/1
  # GET /bolt/groups/1.json
  def show
    @group = Group.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @group }
    end
  end

  # GET /bolt/groups/new
  # GET /bolt/groups/new.json
  def new
    @group = Group.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @group }
    end
  end

  # GET /bolt/groups/1/edit
  def edit
    @group = Group.find(params[:id])
  end

  # POST /bolt/groups
  # POST /bolt/groups.json
  def create
    @group = Group.new(params[:group])

    respond_to do |format|
      if @group.save
        format.html { redirect_to :action => "index", :notice => 'Group was successfully created.' }
        format.json { render :json => @group, :status => :created, :location => @group }
      else
        format.html { render :action => "new" }
        format.json { render :json => @group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bolt/groups/1
  # PUT /bolt/groups/1.json
  def update
    @group = Group.find(params[:id])

    respond_to do |format|
      if @group.update_attributes(params[:group])
        format.html { redirect_to @group, :notice => 'Group was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bolt/groups/1
  # DELETE /bolt/groups/1.json
  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url }
      format.json { head :ok }
    end
  end
end
end
