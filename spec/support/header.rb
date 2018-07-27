module Headers
  def authorized_headers value
    { 'Authorization' => "Token token=#{ value }", 'Content-type' => 'application/json', 'Accept' => 'application/json' }
  end

  def not_authorized_headers
    { 'Content-type' => 'application/json', 'Accept' => 'application/json' }
  end
end
