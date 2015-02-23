class Admin::MessagesController < Admin::BaseController
	before_action { |c| c.authorize_level(4) }

	def index
		@table = MessageTable.new(view_context)
		respond_to do |format|
			format.html
			format.js { render 'sort' }
		end
	end

	def new
		@message = Message.new
	end

	
	def create
		@element = Message.new(message_params)
    if @element.save
    	render 'success'
    else
      render 'error'
    end
	end

	def edit
		@message = Message.find(params[:id])
	end

	def update
		@element = Message.find(params[:id])
		if @element.update_attributes(message_params)
			render 'success'
		else
			render 'error'
		end
	end

	def destroy
		Message.find(params[:id]).destroy
		redirect_to admin_messages_path, success: t('message.admin.destroy.success')
	end

	private

	def message_params
		params.require(:message).permit(:name, :file, :speaker, :date)
	end
end
