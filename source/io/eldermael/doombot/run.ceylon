import java.lang {
    Types {
        classForType
    }
}

import org.springframework.boot {
    SpringApplication
}
import org.springframework.boot.autoconfigure {
    springBootApplication
}


shared void run() {

    SpringApplication.run(classForType<DoomBoot>());

}


springBootApplication
class DoomBoot() {

}