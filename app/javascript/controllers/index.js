import { application } from "./application"

import RatinglController from "./rating_controller"
import ImageFieldController from "./image_field_controller"
import AjaxController from "./ajax_controller"
import CounterController from "./counter_controller"


application.register("rating", RatinglController)
application.register("image-field", ImageFieldController)
application.register("ajax", AjaxController)
application.register("counter", CounterController)
