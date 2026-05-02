package zmq;

/* loaded from: jeromq-0.3.5.jar:zmq/IPollEvents.class */
public interface IPollEvents {
    void inEvent();

    void outEvent();

    void connectEvent();

    void acceptEvent();

    void timerEvent(int i);
}
