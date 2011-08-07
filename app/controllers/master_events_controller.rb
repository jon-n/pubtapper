class MasterEventsController < ApplicationController
  # GET /master_events
  # GET /master_events.xml
  def index
    @master_events = MasterEvent.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @master_events }
    end
  end

  # GET /master_events/1
  # GET /master_events/1.xml
  def show
    @master_event = MasterEvent.find(params[:id])

	@teams = Team.all

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @master_event }
    end
  end

  # GET /master_events/new
  # GET /master_events/new.xml
  def new
    @master_event = MasterEvent.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @master_event }
    end
  end

  # GET /master_events/1/edit
  def edit
    @master_event = MasterEvent.find(params[:id])
  end

  # POST /master_events
  # POST /master_events.xml
  def create
    @master_event = MasterEvent.new(params[:master_event])

    respond_to do |format|
      if @master_event.save
        format.html { redirect_to(@master_event, :notice => 'Master event was successfully created.') }
        format.xml  { render :xml => @master_event, :status => :created, :location => @master_event }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @master_event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /master_events/1
  # PUT /master_events/1.xml
  def update
    @master_event = MasterEvent.find(params[:id])

    respond_to do |format|
      if @master_event.update_attributes(params[:master_event])
        format.html { redirect_to(@master_event, :notice => 'Master event was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @master_event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /master_events/1
  # DELETE /master_events/1.xml
  def destroy
    @master_event = MasterEvent.find(params[:id])
    @master_event.destroy

    respond_to do |format|
      format.html { redirect_to(master_events_url) }
      format.xml  { head :ok }
    end
  end
end
