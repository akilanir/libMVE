package zmq;

/* loaded from: jeromq-0.3.5.jar:zmq/IEngine.class */
public interface IEngine {
    void plug(IOThread iOThread, SessionBase sessionBase);

    void terminate();

    void activateIn();

    void activateOut();
}
