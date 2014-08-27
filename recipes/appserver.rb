# Unicorn and ruby gems are handled by the app_deploy recipe.

include_recipe 'rails_infrastructure::common'
include_recipe 'postgresql::client'

include_recipe 'rvm::system'

package 'nodejs'
