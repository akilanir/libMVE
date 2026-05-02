package nl.siegmann.epublib.domain;

/* loaded from: epublib-core-3.1.jar:nl/siegmann/epublib/domain/ManifestItemProperties.class */
public enum ManifestItemProperties implements ManifestProperties {
    COVER_IMAGE("cover-image"),
    MATHML("mathml"),
    NAV("nav"),
    REMOTE_RESOURCES("remote-resources"),
    SCRIPTED("scripted"),
    SVG("svg"),
    SWITCH("switch");

    private String name;

    ManifestItemProperties(String name) {
        this.name = name;
    }

    @Override // nl.siegmann.epublib.domain.ManifestProperties
    public String getName() {
        return this.name;
    }
}
