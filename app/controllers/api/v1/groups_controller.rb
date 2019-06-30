module Api
    module V1
        class GroupsController < Api::V1::ApiController
            def show; end

            # POST /user_groups
            def create
                @group = Group.new(group_params)
                @group.users << current_user

                if @group.save
                render json: @group, status: :created
                else
                render json: @group.errors, status: :unprocessable_entity
                end
            end

            def profile
              render :show
            end
      
            def update
              current_group.update!(group_params)
              render :show
            end

            private

            def group_params
                params.require(:group).permit(:name, :description)
            end

        end
    end
end