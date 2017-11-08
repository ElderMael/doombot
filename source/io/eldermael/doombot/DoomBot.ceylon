import ceylon.http.client {
    post
}
import ceylon.uri {
    Uri,
    parse,
    Parameter
}

import java.lang {
    Types {
        classForType
    }
}
import java.net {
    Inet4Address
}

import javax.annotation {
    postConstruct
}

import org.slf4j {
    Logger,
    LoggerFactory
}
import org.springframework.beans.factory.annotation {
    autowired
}
import org.springframework.boot.autoconfigure {
    springBootApplication
}
import org.springframework.core.env {
    Environment
}

springBootApplication
class DoomBoot {

    Logger log = LoggerFactory.getLogger(classForType<DoomBoot>());

    Environment env;

    autowired
    shared new (Environment env) {
        this.env = env;
    }


    postConstruct
    shared void registerWebHook() {

        value botToken = env.getProperty("bot.token");

        value telegramUrl = "https://api.telegram.org/bot``botToken``/setWebhook";

        value ipAddress = Inet4Address.localHost.hostAddress;

        Uri uri = parse(telegramUrl);

        value webhookUrl = "https://``ipAddress``:8443/telegram/webhook";

        value request = post(uri, {
            Parameter("url", webhookUrl)
        });


        value response = request.execute();

        log.info("Setting webhook to: '{}'", webhookUrl);
        value contents = response.contents;
        log.info("Response was: {}", contents);


    }

}
