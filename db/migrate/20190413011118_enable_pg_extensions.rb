class EnablePgExtensions < ActiveRecord::Migration[5.2]
  def change
    enable_extension "uuid-ossp"
    enable_extension "pgcrypto"
    enable_extension "pg_trgm"
    enable_extension "btree_gin"
    enable_extension "btree_gist"
    enable_extension "fuzzystrmatch"
    enable_extension "unaccent"
  end
end
