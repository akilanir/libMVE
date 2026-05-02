package com.mikepenz.aboutlibraries;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.text.TextUtils;
import android.util.Log;
import com.mikepenz.aboutlibraries.detector.Detect;
import com.mikepenz.aboutlibraries.entity.Library;
import com.mikepenz.aboutlibraries.entity.License;
import com.mikepenz.aboutlibraries.util.GenericsUtil;
import com.mikepenz.aboutlibraries.util.Util;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* loaded from: com.mikepenz.aboutlibraries.5.1.1.jar:com/mikepenz/aboutlibraries/Libs.class */
public class Libs {
    public static final String BUNDLE_THEME = "ABOUT_LIBRARIES_THEME";
    public static final String BUNDLE_TITLE = "ABOUT_LIBRARIES_TITLE";
    public static final String BUNDLE_STYLE = "ABOUT_LIBRARIES_STYLE";
    public static final String BUNDLE_COLORS = "ABOUT_COLOR";
    private static final String DEFINE_LICENSE = "define_license_";
    private static final String DEFINE_INT = "define_int_";
    private static final String DEFINE_EXT = "define_";
    private ArrayList<Library> internLibraries = new ArrayList<>();
    private ArrayList<Library> externLibraries = new ArrayList<>();
    private ArrayList<License> licenses = new ArrayList<>();

    /* loaded from: com.mikepenz.aboutlibraries.5.1.1.jar:com/mikepenz/aboutlibraries/Libs$ActivityStyle.class */
    public enum ActivityStyle {
        LIGHT,
        DARK,
        LIGHT_DARK_TOOLBAR
    }

    /* loaded from: com.mikepenz.aboutlibraries.5.1.1.jar:com/mikepenz/aboutlibraries/Libs$LibraryFields.class */
    public enum LibraryFields {
        AUTHOR_NAME,
        AUTHOR_WEBSITE,
        LIBRARY_NAME,
        LIBRARY_DESCRIPTION,
        LIBRARY_VERSION,
        LIBRARY_WEBSITE,
        LIBRARY_OPEN_SOURCE,
        LIBRARY_REPOSITORY_LINK,
        LIBRARY_CLASSPATH,
        LICENSE_NAME,
        LICENSE_SHORT_DESCRIPTION,
        LICENSE_DESCRIPTION,
        LICENSE_WEBSITE
    }

    /* loaded from: com.mikepenz.aboutlibraries.5.1.1.jar:com/mikepenz/aboutlibraries/Libs$SpecialButton.class */
    public enum SpecialButton {
        SPECIAL1,
        SPECIAL2,
        SPECIAL3
    }

    public Libs(Context context) {
        String[] fields = GenericsUtil.getFields(context);
        init(context, fields);
    }

    public Libs(Context context, String[] fields) {
        init(context, fields);
    }

    private void init(Context ctx, String[] fields) {
        ArrayList<String> foundLicenseIdentifiers = new ArrayList<>();
        ArrayList<String> foundInternalLibraryIdentifiers = new ArrayList<>();
        ArrayList<String> foundExternalLibraryIdentifiers = new ArrayList<>();
        if (fields != null) {
            for (int i = 0; i < fields.length; i++) {
                if (fields[i].startsWith(DEFINE_LICENSE)) {
                    foundLicenseIdentifiers.add(fields[i].replace(DEFINE_LICENSE, BuildConfig.FLAVOR));
                } else if (fields[i].startsWith(DEFINE_INT)) {
                    foundInternalLibraryIdentifiers.add(fields[i].replace(DEFINE_INT, BuildConfig.FLAVOR));
                } else if (fields[i].startsWith(DEFINE_EXT)) {
                    foundExternalLibraryIdentifiers.add(fields[i].replace(DEFINE_EXT, BuildConfig.FLAVOR));
                }
            }
        }
        Iterator<String> it = foundLicenseIdentifiers.iterator();
        while (it.hasNext()) {
            String licenseIdentifier = it.next();
            License license = genLicense(ctx, licenseIdentifier);
            if (license != null) {
                this.licenses.add(license);
            }
        }
        Iterator<String> it2 = foundInternalLibraryIdentifiers.iterator();
        while (it2.hasNext()) {
            String internalIdentifier = it2.next();
            Library library = genLibrary(ctx, internalIdentifier);
            if (library != null) {
                library.setInternal(true);
                this.internLibraries.add(library);
            }
        }
        Iterator<String> it3 = foundExternalLibraryIdentifiers.iterator();
        while (it3.hasNext()) {
            String externalIdentifier = it3.next();
            Library library2 = genLibrary(ctx, externalIdentifier);
            if (library2 != null) {
                library2.setInternal(false);
                this.externLibraries.add(library2);
            }
        }
    }

    public static String[] toStringArray(Field[] fields) {
        ArrayList<String> fieldArray = new ArrayList<>();
        for (Field field : fields) {
            if (field.getName().contains(DEFINE_EXT)) {
                fieldArray.add(field.getName());
            }
        }
        return (String[]) fieldArray.toArray(new String[fieldArray.size()]);
    }

    public ArrayList<Library> prepareLibraries(Context ctx, String[] internalLibraries, String[] excludeLibraries, boolean autoDetect, boolean sort) {
        HashMap<String, Library> libraries = new HashMap<>();
        if (autoDetect) {
            Iterator<Library> it = getAutoDetectedLibraries(ctx).iterator();
            while (it.hasNext()) {
                Library lib = it.next();
                libraries.put(lib.getDefinedName(), lib);
            }
        }
        Iterator<Library> it2 = getExternLibraries().iterator();
        while (it2.hasNext()) {
            Library lib2 = it2.next();
            libraries.put(lib2.getDefinedName(), lib2);
        }
        if (internalLibraries != null) {
            for (String internalLibrary : internalLibraries) {
                Library lib3 = getLibrary(internalLibrary);
                if (lib3 != null) {
                    libraries.put(lib3.getDefinedName(), lib3);
                }
            }
        }
        ArrayList<Library> resultLibraries = new ArrayList<>(libraries.values());
        if (excludeLibraries != null) {
            List<Library> libsToRemove = new ArrayList<>();
            for (String excludeLibrary : excludeLibraries) {
                Iterator<Library> it3 = resultLibraries.iterator();
                while (true) {
                    if (it3.hasNext()) {
                        Library library = it3.next();
                        if (library.getDefinedName().equals(excludeLibrary)) {
                            libsToRemove.add(library);
                            break;
                        }
                    }
                }
            }
            for (Library libToRemove : libsToRemove) {
                resultLibraries.remove(libToRemove);
            }
        }
        if (sort) {
            Collections.sort(resultLibraries);
        }
        return resultLibraries;
    }

    public ArrayList<Library> getAutoDetectedLibraries(Context ctx) {
        ArrayList<Library> libraries = new ArrayList<>();
        PackageInfo pi = Util.getPackageInfo(ctx);
        if (pi != null) {
            String[] autoDetectedLibraries = ctx.getSharedPreferences("aboutLibraries_" + pi.versionCode, 0).getString("autoDetectedLibraries", BuildConfig.FLAVOR).split(";");
            if (autoDetectedLibraries.length > 0) {
                for (String autoDetectedLibrary : autoDetectedLibraries) {
                    Library lib = getLibrary(autoDetectedLibrary);
                    if (lib != null) {
                        libraries.add(lib);
                    }
                }
            }
        }
        if (libraries.size() == 0) {
            String delimiter = BuildConfig.FLAVOR;
            String autoDetectedLibrariesPref = BuildConfig.FLAVOR;
            for (Library lib2 : Detect.detect(ctx, getLibraries())) {
                libraries.add(lib2);
                autoDetectedLibrariesPref = autoDetectedLibrariesPref + delimiter + lib2.getDefinedName();
                delimiter = ";";
            }
            if (pi != null) {
                ctx.getSharedPreferences("aboutLibraries_" + pi.versionCode, 0).edit().putString("autoDetectedLibraries", autoDetectedLibrariesPref).commit();
            }
        }
        return libraries;
    }

    public ArrayList<Library> getInternLibraries() {
        return new ArrayList<>(this.internLibraries);
    }

    public ArrayList<Library> getExternLibraries() {
        return new ArrayList<>(this.externLibraries);
    }

    public ArrayList<License> getLicenses() {
        return new ArrayList<>(this.licenses);
    }

    public ArrayList<Library> getLibraries() {
        ArrayList<Library> libs = new ArrayList<>();
        libs.addAll(getInternLibraries());
        libs.addAll(getExternLibraries());
        return libs;
    }

    public Library getLibrary(String libraryName) {
        Iterator<Library> it = getLibraries().iterator();
        while (it.hasNext()) {
            Library library = it.next();
            if (library.getLibraryName().toLowerCase().equals(libraryName.toLowerCase())) {
                return library;
            }
            if (library.getDefinedName().toLowerCase().equals(libraryName.toLowerCase())) {
                return library;
            }
        }
        return null;
    }

    public ArrayList<Library> findLibrary(String searchTerm, int limit) {
        return find(getLibraries(), searchTerm, false, limit);
    }

    public ArrayList<Library> findInInternalLibrary(String searchTerm, boolean idOnly, int limit) {
        return find(getInternLibraries(), searchTerm, idOnly, limit);
    }

    public ArrayList<Library> findInExternalLibrary(String searchTerm, boolean idOnly, int limit) {
        return find(getExternLibraries(), searchTerm, idOnly, limit);
    }

    private ArrayList<Library> find(ArrayList<Library> libraries, String searchTerm, boolean idOnly, int limit) {
        ArrayList<Library> localLibs = new ArrayList<>();
        int count = 0;
        Iterator<Library> it = libraries.iterator();
        while (it.hasNext()) {
            Library library = it.next();
            if (idOnly) {
                if (library.getDefinedName().toLowerCase().contains(searchTerm.toLowerCase())) {
                    localLibs.add(library);
                    count++;
                    if (limit != -1 && limit < count) {
                        break;
                    }
                } else {
                    continue;
                }
            } else if (library.getLibraryName().toLowerCase().contains(searchTerm.toLowerCase()) || library.getDefinedName().toLowerCase().contains(searchTerm.toLowerCase())) {
                localLibs.add(library);
                count++;
                if (limit != -1 && limit < count) {
                    break;
                }
            }
        }
        return localLibs;
    }

    public License getLicense(String licenseName) {
        Iterator<License> it = getLicenses().iterator();
        while (it.hasNext()) {
            License license = it.next();
            if (license.getLicenseName().toLowerCase().equals(licenseName.toLowerCase())) {
                return license;
            }
            if (license.getDefinedName().toLowerCase().equals(licenseName.toLowerCase())) {
                return license;
            }
        }
        return null;
    }

    private License genLicense(Context ctx, String licenseName) {
        String licenseName2 = licenseName.replace("-", "_");
        try {
            License lic = new License();
            lic.setDefinedName(licenseName2);
            lic.setLicenseName(getStringResourceByName(ctx, "license_" + licenseName2 + "_licenseName"));
            lic.setLicenseWebsite(getStringResourceByName(ctx, "license_" + licenseName2 + "_licenseWebsite"));
            lic.setLicenseShortDescription(getStringResourceByName(ctx, "license_" + licenseName2 + "_licenseShortDescription"));
            lic.setLicenseDescription(getStringResourceByName(ctx, "license_" + licenseName2 + "_licenseDescription"));
            return lic;
        } catch (Exception ex) {
            Log.e("aboutlibraries", "Failed to generateLicense from file: " + ex.toString());
            return null;
        }
    }

    private Library genLibrary(Context ctx, String libraryName) {
        String libraryName2 = libraryName.replace("-", "_");
        try {
            Library lib = new Library();
            HashMap<String, String> customVariables = getCustomVariables(ctx, libraryName2);
            lib.setDefinedName(libraryName2);
            lib.setAuthor(getStringResourceByName(ctx, "library_" + libraryName2 + "_author"));
            lib.setAuthorWebsite(getStringResourceByName(ctx, "library_" + libraryName2 + "_authorWebsite"));
            lib.setLibraryName(getStringResourceByName(ctx, "library_" + libraryName2 + "_libraryName"));
            lib.setLibraryDescription(insertVariables(getStringResourceByName(ctx, "library_" + libraryName2 + "_libraryDescription"), customVariables));
            lib.setLibraryVersion(getStringResourceByName(ctx, "library_" + libraryName2 + "_libraryVersion"));
            lib.setLibraryWebsite(getStringResourceByName(ctx, "library_" + libraryName2 + "_libraryWebsite"));
            String licenseId = getStringResourceByName(ctx, "library_" + libraryName2 + "_licenseId");
            if (TextUtils.isEmpty(licenseId)) {
                License license = new License();
                license.setLicenseName(getStringResourceByName(ctx, "library_" + libraryName2 + "_licenseVersion"));
                license.setLicenseWebsite(getStringResourceByName(ctx, "library_" + libraryName2 + "_licenseLink"));
                license.setLicenseShortDescription(insertVariables(getStringResourceByName(ctx, "library_" + libraryName2 + "_licenseContent"), customVariables));
                lib.setLicense(license);
            } else {
                License license2 = getLicense(licenseId);
                if (license2 != null) {
                    License license3 = license2.copy();
                    license3.setLicenseShortDescription(insertVariables(license3.getLicenseShortDescription(), customVariables));
                    license3.setLicenseDescription(insertVariables(license3.getLicenseDescription(), customVariables));
                    lib.setLicense(license3);
                }
            }
            lib.setOpenSource(Boolean.valueOf(getStringResourceByName(ctx, "library_" + libraryName2 + "_isOpenSource")).booleanValue());
            lib.setRepositoryLink(getStringResourceByName(ctx, "library_" + libraryName2 + "_repositoryLink"));
            lib.setClassPath(getStringResourceByName(ctx, "library_" + libraryName2 + "_classPath"));
            if (TextUtils.isEmpty(lib.getLibraryName())) {
                if (TextUtils.isEmpty(lib.getLibraryDescription())) {
                    return null;
                }
            }
            return lib;
        } catch (Exception ex) {
            Log.e("aboutlibraries", "Failed to generateLibrary from file: " + ex.toString());
            return null;
        }
    }

    public HashMap<String, String> getCustomVariables(Context ctx, String libraryName) {
        HashMap<String, String> customVariables = new HashMap<>();
        String customVariablesString = getStringResourceByName(ctx, DEFINE_EXT + libraryName);
        if (TextUtils.isEmpty(customVariablesString)) {
            customVariablesString = getStringResourceByName(ctx, DEFINE_INT + libraryName);
        }
        if (!TextUtils.isEmpty(customVariablesString)) {
            String[] customVariableArray = customVariablesString.split(";");
            if (customVariableArray.length > 0) {
                for (String customVariableKey : customVariableArray) {
                    String customVariableContent = getStringResourceByName(ctx, "library_" + libraryName + "_" + customVariableKey);
                    if (!TextUtils.isEmpty(customVariableContent)) {
                        customVariables.put(customVariableKey, customVariableContent);
                    }
                }
            }
        }
        return customVariables;
    }

    public String insertVariables(String insertInto, HashMap<String, String> variables) {
        for (Map.Entry<String, String> entry : variables.entrySet()) {
            if (!TextUtils.isEmpty(entry.getValue())) {
                insertInto = insertInto.replace("<<<" + entry.getKey().toUpperCase() + ">>>", entry.getValue());
            }
        }
        return insertInto.replace("<<<", BuildConfig.FLAVOR).replace(">>>", BuildConfig.FLAVOR);
    }

    public String getStringResourceByName(Context ctx, String aString) {
        String packageName = ctx.getPackageName();
        int resId = ctx.getResources().getIdentifier(aString, "string", packageName);
        if (resId == 0) {
            return BuildConfig.FLAVOR;
        }
        return ctx.getString(resId);
    }

    public void modifyLibraries(HashMap<String, HashMap<String, String>> modifications) {
        if (modifications != null) {
            for (Map.Entry<String, HashMap<String, String>> entry : modifications.entrySet()) {
                ArrayList<Library> foundLibs = findInExternalLibrary(entry.getKey(), true, 1);
                if (foundLibs == null || foundLibs.size() == 0) {
                    foundLibs = findInInternalLibrary(entry.getKey(), true, 1);
                }
                if (foundLibs != null && foundLibs.size() == 1) {
                    Library lib = foundLibs.get(0);
                    for (Map.Entry<String, String> modification : entry.getValue().entrySet()) {
                        String key = modification.getKey().toUpperCase();
                        String value = modification.getValue();
                        if (key.equals(LibraryFields.AUTHOR_NAME.name())) {
                            lib.setAuthor(value);
                        } else if (key.equals(LibraryFields.AUTHOR_WEBSITE.name())) {
                            lib.setAuthorWebsite(value);
                        } else if (key.equals(LibraryFields.LIBRARY_NAME.name())) {
                            lib.setLibraryName(value);
                        } else if (key.equals(LibraryFields.LIBRARY_DESCRIPTION.name())) {
                            lib.setLibraryDescription(value);
                        } else if (key.equals(LibraryFields.LIBRARY_VERSION.name())) {
                            lib.setLibraryVersion(value);
                        } else if (key.equals(LibraryFields.LIBRARY_WEBSITE.name())) {
                            lib.setLibraryWebsite(value);
                        } else if (key.equals(LibraryFields.LIBRARY_OPEN_SOURCE.name())) {
                            lib.setOpenSource(Boolean.parseBoolean(value));
                        } else if (key.equals(LibraryFields.LIBRARY_REPOSITORY_LINK.name())) {
                            lib.setRepositoryLink(value);
                        } else if (key.equals(LibraryFields.LIBRARY_CLASSPATH.name())) {
                            lib.setClassPath(value);
                        } else if (key.equals(LibraryFields.LICENSE_NAME.name())) {
                            if (lib.getLicense() == null) {
                                lib.setLicense(new License());
                            }
                            lib.getLicense().setLicenseName(value);
                        } else if (key.equals(LibraryFields.LICENSE_SHORT_DESCRIPTION.name())) {
                            if (lib.getLicense() == null) {
                                lib.setLicense(new License());
                            }
                            lib.getLicense().setLicenseShortDescription(value);
                        } else if (key.equals(LibraryFields.LICENSE_DESCRIPTION.name())) {
                            if (lib.getLicense() == null) {
                                lib.setLicense(new License());
                            }
                            lib.getLicense().setLicenseDescription(value);
                        } else if (key.equals(LibraryFields.LICENSE_WEBSITE.name())) {
                            if (lib.getLicense() == null) {
                                lib.setLicense(new License());
                            }
                            lib.getLicense().setLicenseWebsite(value);
                        }
                    }
                }
            }
        }
    }
}
