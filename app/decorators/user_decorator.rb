class UserDecorator < Draper::Decorator
  delegate_all

  def as_json *args
    if context[:index]
      {
        id: id,
        name: name
      }
    else
      {
        email: email
      }
    end
  end
end
