package example;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;


public class FixitApplication {

    private static final Logger logger = LogManager.getLogger(FixitApplication.class);

    public static void main(String[] args) {
        logger.log(logger.getLevel(), System.getProperty("log4j2.formatMsgNoLookups"));
    }

}
