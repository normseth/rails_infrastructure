include_recipe 'rails_infrastructure::common'
include_recipe 'postgresql::client'

include_recipe 'rvm::system'

package 'nodejs'

# TODO: Make sure gems handled by app deployment; otherwise need to include here
# TODO: What is installing & configuring unicorn?
