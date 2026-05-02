package nl.siegmann.epublib.domain;

import java.io.Serializable;

/* loaded from: epublib-core-3.1.jar:nl/siegmann/epublib/domain/SpineReference.class */
public class SpineReference extends ResourceReference implements Serializable {
    private static final long serialVersionUID = -7921609197351510248L;
    private boolean linear;

    public SpineReference(Resource resource) {
        this(resource, true);
    }

    public SpineReference(Resource resource, boolean linear) {
        super(resource);
        this.linear = true;
        this.linear = linear;
    }

    public boolean isLinear() {
        return this.linear;
    }

    public void setLinear(boolean linear) {
        this.linear = linear;
    }
}
