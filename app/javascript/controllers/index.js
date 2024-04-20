import { application } from "./application"

import RatinglController from "./rating_controller"
import ImageFieldController from "./image_field_controller"
import SearchController from "./search_controller"

application.register("rating", RatinglController)
application.register("image-field", ImageFieldController)
application.register("search-controller", SearchController)
