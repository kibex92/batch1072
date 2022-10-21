require_relative 'router'
require_relative 'controller'
require_relative 'view'
require_relative 'repository'

view = View.new
repository = Repository.new

controller = Controller.new(view, repository)

router = Router.new(controller)
router.run

