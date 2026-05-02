package nl.siegmann.epublib.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/* loaded from: epublib-core-3.1.jar:nl/siegmann/epublib/domain/Guide.class */
public class Guide implements Serializable {
    private static final long serialVersionUID = -6256645339915751189L;
    public static final String DEFAULT_COVER_TITLE = GuideReference.COVER;
    private static final int COVERPAGE_NOT_FOUND = -1;
    private static final int COVERPAGE_UNITIALIZED = -2;
    private List<GuideReference> references = new ArrayList();
    private int coverPageIndex = COVERPAGE_NOT_FOUND;

    public List<GuideReference> getReferences() {
        return this.references;
    }

    public void setReferences(List<GuideReference> references) {
        this.references = references;
        uncheckCoverPage();
    }

    private void uncheckCoverPage() {
        this.coverPageIndex = COVERPAGE_UNITIALIZED;
    }

    public GuideReference getCoverReference() {
        checkCoverPage();
        if (this.coverPageIndex >= 0) {
            return this.references.get(this.coverPageIndex);
        }
        return null;
    }

    public int setCoverReference(GuideReference guideReference) {
        if (this.coverPageIndex >= 0) {
            this.references.set(this.coverPageIndex, guideReference);
        } else {
            this.references.add(0, guideReference);
            this.coverPageIndex = 0;
        }
        return this.coverPageIndex;
    }

    private void checkCoverPage() {
        if (this.coverPageIndex == COVERPAGE_UNITIALIZED) {
            initCoverPage();
        }
    }

    private void initCoverPage() {
        int result = COVERPAGE_NOT_FOUND;
        int i = 0;
        while (true) {
            if (i >= this.references.size()) {
                break;
            }
            GuideReference guideReference = this.references.get(i);
            if (!guideReference.getType().equals(GuideReference.COVER)) {
                i++;
            } else {
                result = i;
                break;
            }
        }
        this.coverPageIndex = result;
    }

    public Resource getCoverPage() {
        GuideReference guideReference = getCoverReference();
        if (guideReference == null) {
            return null;
        }
        return guideReference.getResource();
    }

    public void setCoverPage(Resource coverPage) {
        GuideReference coverpageGuideReference = new GuideReference(coverPage, GuideReference.COVER, DEFAULT_COVER_TITLE);
        setCoverReference(coverpageGuideReference);
    }

    public ResourceReference addReference(GuideReference reference) {
        this.references.add(reference);
        uncheckCoverPage();
        return reference;
    }

    public List<GuideReference> getGuideReferencesByType(String referenceTypeName) {
        List<GuideReference> result = new ArrayList<>();
        for (GuideReference guideReference : this.references) {
            if (referenceTypeName.equalsIgnoreCase(guideReference.getType())) {
                result.add(guideReference);
            }
        }
        return result;
    }
}
