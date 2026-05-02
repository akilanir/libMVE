package korex.activation;

import java.io.IOException;

/* loaded from: kore-javamail-1.0.2.jar:korex/activation/CommandObject.class */
public interface CommandObject {
    void setCommandContext(String str, DataHandler dataHandler) throws IOException;
}
