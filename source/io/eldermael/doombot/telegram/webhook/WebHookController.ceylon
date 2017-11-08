import java.lang {
    Types {
        classForType
    }
}

import org.slf4j {
    Logger,
    LoggerFactory
}
import org.springframework.http {
    ResponseEntity,
    HttpStatus
}
import org.springframework.web.bind.annotation {
    postMapping,
    restController
}

restController {
    \ivalue = "/telegram/webhook";
}

shared class WebHookController() {

    Logger log = LoggerFactory.getLogger(classForType<WebHookController>());


    postMapping
    shared ResponseEntity<Nothing> processWebHook(Update update) {
        log.info("Update: {}", update);
        return ResponseEntity(HttpStatus.ok);
    }


}