import cucumber.api.java8 {
    En
}

import io.eldermael.doombot.telegram.webhook {
    Update,
    WebHookController
}

import org.springframework.http {
    ResponseEntity,
    HttpStatus
}


shared class WebHookRequestFeature() satisfies En {

    WebHookController controller = WebHookController();

    variable Update? update = null;
    variable ResponseEntity<Nothing>? response = null;

    \igiven("^an Telegram Update WebHook HTTP Request$", () {
        update = Update(1);
    });


    \iwhen("^the WebHookController process the request$", () {
        assert (exists webhookUpdate = update);
        response = controller.processWebHook(webhookUpdate);
    });


    \ithen("^it should return a status 200$", () {
        assert (exists r = response, r.statusCode == HttpStatus.ok);
    });

}