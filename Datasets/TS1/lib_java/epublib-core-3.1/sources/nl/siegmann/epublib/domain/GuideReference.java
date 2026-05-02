package nl.siegmann.epublib.domain;

import java.io.Serializable;
import nl.siegmann.epublib.epub.NCXDocument;
import nl.siegmann.epublib.util.StringUtil;

/* loaded from: epublib-core-3.1.jar:nl/siegmann/epublib/domain/GuideReference.class */
public class GuideReference extends TitledResourceReference implements Serializable {
    private static final long serialVersionUID = -316179702440631834L;
    public static String COVER = "cover";
    public static String TITLE_PAGE = "title-page";
    public static String TOC = "toc";
    public static String INDEX = "index";
    public static String GLOSSARY = "glossary";
    public static String ACKNOWLEDGEMENTS = "acknowledgements";
    public static String BIBLIOGRAPHY = "bibliography";
    public static String COLOPHON = "colophon";
    public static String COPYRIGHT_PAGE = "copyright-page";
    public static String DEDICATION = "dedication";
    public static String EPIGRAPH = "epigraph";
    public static String FOREWORD = "foreword";
    public static String LOI = "loi";
    public static String LOT = "lot";
    public static String NOTES = "notes";
    public static String PREFACE = "preface";
    public static String TEXT = NCXDocument.NCXTags.text;
    private String type;

    public GuideReference(Resource resource) {
        this(resource, null);
    }

    public GuideReference(Resource resource, String title) {
        super(resource, title);
    }

    public GuideReference(Resource resource, String type, String title) {
        this(resource, type, title, null);
    }

    public GuideReference(Resource resource, String type, String title, String fragmentId) {
        super(resource, title, fragmentId);
        this.type = StringUtil.isNotBlank(type) ? type.toLowerCase() : null;
    }

    public String getType() {
        return this.type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
