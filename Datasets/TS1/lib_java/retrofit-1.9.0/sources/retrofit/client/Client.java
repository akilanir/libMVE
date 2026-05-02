package retrofit.client;

import java.io.IOException;

/* loaded from: retrofit-1.9.0.jar:retrofit/client/Client.class */
public interface Client {

    /* loaded from: retrofit-1.9.0.jar:retrofit/client/Client$Provider.class */
    public interface Provider {
        Client get();
    }

    Response execute(Request request) throws IOException;
}
