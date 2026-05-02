package com.mikepenz.aboutlibraries.entity;

import com.mikepenz.aboutlibraries.BuildConfig;

/* loaded from: com.mikepenz.aboutlibraries.5.6.5.jar:com/mikepenz/aboutlibraries/entity/Library.class */
public class Library implements Comparable<Library> {
    private String definedName;
    private boolean internal;
    private String author;
    private String authorWebsite;
    private String libraryName;
    private String libraryDescription;
    private String libraryVersion;
    private String libraryWebsite;
    private License license;
    private boolean isOpenSource;
    private String repositoryLink;
    private String classPath;

    public Library() {
        this.definedName = BuildConfig.FLAVOR;
        this.internal = false;
        this.author = BuildConfig.FLAVOR;
        this.authorWebsite = BuildConfig.FLAVOR;
        this.libraryName = BuildConfig.FLAVOR;
        this.libraryDescription = BuildConfig.FLAVOR;
        this.libraryVersion = BuildConfig.FLAVOR;
        this.libraryWebsite = BuildConfig.FLAVOR;
        this.isOpenSource = true;
        this.repositoryLink = BuildConfig.FLAVOR;
        this.classPath = BuildConfig.FLAVOR;
    }

    public Library(String author, String libraryName, String libraryDescription) {
        this.definedName = BuildConfig.FLAVOR;
        this.internal = false;
        this.author = BuildConfig.FLAVOR;
        this.authorWebsite = BuildConfig.FLAVOR;
        this.libraryName = BuildConfig.FLAVOR;
        this.libraryDescription = BuildConfig.FLAVOR;
        this.libraryVersion = BuildConfig.FLAVOR;
        this.libraryWebsite = BuildConfig.FLAVOR;
        this.isOpenSource = true;
        this.repositoryLink = BuildConfig.FLAVOR;
        this.classPath = BuildConfig.FLAVOR;
        this.author = author;
        this.libraryName = libraryName;
        this.libraryDescription = libraryDescription;
    }

    public Library(String author, String libraryName, String libraryDescription, String libraryVersion) {
        this.definedName = BuildConfig.FLAVOR;
        this.internal = false;
        this.author = BuildConfig.FLAVOR;
        this.authorWebsite = BuildConfig.FLAVOR;
        this.libraryName = BuildConfig.FLAVOR;
        this.libraryDescription = BuildConfig.FLAVOR;
        this.libraryVersion = BuildConfig.FLAVOR;
        this.libraryWebsite = BuildConfig.FLAVOR;
        this.isOpenSource = true;
        this.repositoryLink = BuildConfig.FLAVOR;
        this.classPath = BuildConfig.FLAVOR;
        this.author = author;
        this.libraryName = libraryName;
        this.libraryDescription = libraryDescription;
        this.libraryVersion = libraryVersion;
    }

    public String getDefinedName() {
        return this.definedName;
    }

    public void setDefinedName(String definedName) {
        this.definedName = definedName;
    }

    public String getAuthor() {
        return this.author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getAuthorWebsite() {
        return this.authorWebsite;
    }

    public void setAuthorWebsite(String authorWebsite) {
        this.authorWebsite = authorWebsite;
    }

    public String getLibraryName() {
        return this.libraryName;
    }

    public void setLibraryName(String libraryName) {
        this.libraryName = libraryName;
    }

    public String getLibraryDescription() {
        return this.libraryDescription;
    }

    public void setLibraryDescription(String libraryDescription) {
        this.libraryDescription = libraryDescription;
    }

    public String getLibraryVersion() {
        return this.libraryVersion;
    }

    public void setLibraryVersion(String libraryVersion) {
        this.libraryVersion = libraryVersion;
    }

    public String getLibraryWebsite() {
        return this.libraryWebsite;
    }

    public void setLibraryWebsite(String libraryWebsite) {
        this.libraryWebsite = libraryWebsite;
    }

    public License getLicense() {
        return this.license;
    }

    public void setLicense(License license) {
        this.license = license;
    }

    public boolean isOpenSource() {
        return this.isOpenSource;
    }

    public void setOpenSource(boolean isOpenSource) {
        this.isOpenSource = isOpenSource;
    }

    public String getRepositoryLink() {
        return this.repositoryLink;
    }

    public void setRepositoryLink(String repositoryLink) {
        this.repositoryLink = repositoryLink;
    }

    public boolean isInternal() {
        return this.internal;
    }

    public void setInternal(boolean internal) {
        this.internal = internal;
    }

    public String getClassPath() {
        return this.classPath;
    }

    public void setClassPath(String classPath) {
        this.classPath = classPath;
    }

    @Override // java.lang.Comparable
    public int compareTo(Library another) {
        return getLibraryName().compareToIgnoreCase(another.getLibraryName());
    }
}
