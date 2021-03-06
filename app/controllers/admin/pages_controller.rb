class Admin::PagesController < Admin::BaseController
	before_action { |c| c.authorize_level(2) }

	def index
		@table = Table.new(self, Page)
		@table.respond
	end

	def edit
		@page = Page.find(params[:id])
	end

	def update
		@page = Page.find(params[:id])
		if @page.update_attributes(page_params)
			redirect_to admin_pages_path, success: t("page.admin.edit.success")
		else
			render 'edit'
		end
	end

	private

	def page_params
		params.require(:page).permit(:content)
	end
end
