package nl.siegmann.epublib.domain;

/* loaded from: epublib-core-3.1.jar:nl/siegmann/epublib/domain/ManifestItemRefProperties.class */
public enum ManifestItemRefProperties implements ManifestProperties {
    PAGE_SPREAD_LEFT("page-spread-left"),
    PAGE_SPREAD_RIGHT("page-spread-right");

    private String name;

    ManifestItemRefProperties(String name) {
        this.name = name;
    }

    @Override // nl.siegmann.epublib.domain.ManifestProperties
    public String getName() {
        return this.name;
    }
}
