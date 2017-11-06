import ceylon.interop.java {
    toJavaStringArray
}

import cucumber.api.cli {
    Main
}

shared void run() {

    String[] arguments = process.arguments;

    value javaArgs = toJavaStringArray(Array(arguments));

    Main.main(javaArgs);
}