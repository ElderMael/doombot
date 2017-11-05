import io.eldermael.doombot {
    DoomBoot
}

import java.lang {
    Types {
        classForType
    }
}

import org.springframework.boot {
    SpringApplication
}

shared void run() {

    SpringApplication
        .run(classForType<DoomBoot>());

}


restricted (`module test.io.eldermael.doombot`)
shared Boolean testMe() => true;