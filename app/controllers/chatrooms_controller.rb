class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @patient = Patient.find(params[:patient_id])
    @message = Message.new
    authorize @chatroom

    respond_to do |format|
      format.html
      format.pdf do
       render :pdf => "ruptcare"
      end
    end
  end
end
