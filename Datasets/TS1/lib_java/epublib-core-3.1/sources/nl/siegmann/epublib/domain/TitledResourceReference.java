package nl.siegmann.epublib.domain;

import java.io.Serializable;
import nl.siegmann.epublib.util.StringUtil;

/* loaded from: epublib-core-3.1.jar:nl/siegmann/epublib/domain/TitledResourceReference.class */
public class TitledResourceReference extends ResourceReference implements Serializable {
    private static final long serialVersionUID = 3918155020095190080L;
    private String fragmentId;
    private String title;

    public TitledResourceReference(Resource resource) {
        this(resource, null);
    }

    public TitledResourceReference(Resource resource, String title) {
        this(resource, title, null);
    }

    public TitledResourceReference(Resource resource, String title, String fragmentId) {
        super(resource);
        this.title = title;
        this.fragmentId = fragmentId;
    }

    public String getFragmentId() {
        return this.fragmentId;
    }

    public void setFragmentId(String fragmentId) {
        this.fragmentId = fragmentId;
    }

    public String getTitle() {
        return this.title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCompleteHref() {
        if (StringUtil.isBlank(this.fragmentId)) {
            return this.resource.getHref();
        }
        return this.resource.getHref() + '#' + this.fragmentId;
    }

    public void setResource(Resource resource, String fragmentId) {
        super.setResource(resource);
        this.fragmentId = fragmentId;
    }

    @Override // nl.siegmann.epublib.domain.ResourceReference
    public void setResource(Resource resource) {
        setResource(resource, null);
    }
}
