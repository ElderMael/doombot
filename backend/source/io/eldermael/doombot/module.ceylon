native ("jvm")
module io.eldermael.doombot "0.0.1" {

    import ceylon.interop.spring "1.3.3";

    import ceylon.http.client "1.3.3";

    import maven:org.springframework.boot:"spring-boot-starter" "1.5.8.RELEASE";
    import maven:org.springframework.boot:"spring-boot-starter-web" "1.5.8.RELEASE";
    import maven:com.github.ulisesbocchio:"jasypt-spring-boot-starter" "1.16";

    shared import maven:org.springframework:"spring-web" "4.3.12.RELEASE";

}
