class AddAccessTokenToAllSeries < ActiveRecord::Migration[5.0]
  def change
    # No-op: access tokens will be generated lazily elsewhere.
  end
end
