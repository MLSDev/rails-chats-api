module Permitter
  def permit_params! params, required_key = nil, permitted_keys = nil
    required_key = required_key.to_sym if required_key

    return ActionController::Parameters.new(params).require(required_key).permit(permitted_keys) if required_key and permitted_keys

    return ActionController::Parameters.new(params).require(required_key).permit!                if required_key

    ActionController::Parameters.new(params).permit!
  end
end
