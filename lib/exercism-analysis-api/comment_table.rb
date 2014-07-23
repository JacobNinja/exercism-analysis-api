class CommentTable

  def initialize(lookup_hash)
    @lookup_hash = lookup_hash
  end

  def lookup(result_key, feedback_key)
    @lookup_hash.fetch(result_key.to_s, {}).fetch(feedback_key.to_s, [])
  end

end