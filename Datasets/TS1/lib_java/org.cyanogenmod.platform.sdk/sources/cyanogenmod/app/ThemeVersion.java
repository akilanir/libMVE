package cyanogenmod.app;

import android.content.ThemeVersion;
import android.os.Build;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* loaded from: org.cyanogenmod.platform.sdk.jar:cyanogenmod/app/ThemeVersion.class */
public class ThemeVersion {
    private static final String THEME_VERSION_CLASS_NAME = "android.content.ThemeVersion";
    private static final String THEME_VERSION_FIELD_NAME = "THEME_VERSION";
    private static final String MIN_SUPPORTED_THEME_VERSION_FIELD_NAME = "MIN_SUPPORTED_THEME_VERSION";
    private static final int CM11 = 1;
    private static final int CM12_PRE_VERSIONING = 2;

    public static int getVersion() {
        int version;
        try {
            Class<?> themeVersionClass = Class.forName(THEME_VERSION_CLASS_NAME);
            Field themeVersionField = themeVersionClass.getField(THEME_VERSION_FIELD_NAME);
            version = ((Integer) themeVersionField.get(null)).intValue();
        } catch (Exception e) {
            version = Build.VERSION.SDK_INT < 21 ? 1 : CM12_PRE_VERSIONING;
        }
        return version;
    }

    public static int getMinSupportedVersion() {
        int getMinSupportedVersion;
        try {
            Class<?> themeVersionClass = Class.forName(THEME_VERSION_CLASS_NAME);
            Field themeVersionField = themeVersionClass.getField(MIN_SUPPORTED_THEME_VERSION_FIELD_NAME);
            getMinSupportedVersion = ((Integer) themeVersionField.get(null)).intValue();
        } catch (Exception e) {
            getMinSupportedVersion = Build.VERSION.SDK_INT < 21 ? 1 : CM12_PRE_VERSIONING;
        }
        return getMinSupportedVersion;
    }

    public static ComponentVersion getComponentVersion(ThemeComponent component) {
        int version = getVersion();
        if (version == 1) {
            throw new UnsupportedOperationException();
        }
        if (version == CM12_PRE_VERSIONING) {
            return ThemeVersionImpl2.getDeviceComponentVersion(component);
        }
        return ThemeVersionImpl3.getDeviceComponentVersion(component);
    }

    public static List<ComponentVersion> getComponentVersions() {
        int version = getVersion();
        if (version == 1) {
            throw new UnsupportedOperationException();
        }
        if (version == CM12_PRE_VERSIONING) {
            return ThemeVersionImpl2.getDeviceComponentVersions();
        }
        return ThemeVersionImpl3.getDeviceComponentVersions();
    }

    /* loaded from: org.cyanogenmod.platform.sdk.jar:cyanogenmod/app/ThemeVersion$ComponentVersion.class */
    public static class ComponentVersion {
        protected int id;
        protected String name;
        protected ThemeComponent component;
        protected int minVersion;
        protected int currentVersion;

        protected ComponentVersion(int id, ThemeComponent component, int targetVersion) {
            this(id, component, component.name(), targetVersion, targetVersion);
        }

        protected ComponentVersion(int id, ThemeComponent component, String name, int minVersion, int targetVersion) {
            this.id = id;
            this.component = component;
            this.name = name;
            this.minVersion = minVersion;
            this.currentVersion = targetVersion;
        }

        public ComponentVersion(ComponentVersion copy) {
            this(copy.id, copy.component, copy.name, copy.minVersion, copy.currentVersion);
        }

        public int getId() {
            return this.id;
        }

        public String getName() {
            return this.name;
        }

        public ThemeComponent getComponent() {
            return this.component;
        }

        public int getMinVersion() {
            return this.minVersion;
        }

        public int getCurrentVersion() {
            return this.currentVersion;
        }
    }

    /* loaded from: org.cyanogenmod.platform.sdk.jar:cyanogenmod/app/ThemeVersion$ThemeVersionImpl2.class */
    private static class ThemeVersionImpl2 {
        private static ArrayList<ComponentVersion> cVersions = new ArrayList<ComponentVersion>() { // from class: cyanogenmod.app.ThemeVersion.ThemeVersionImpl2.1
            {
                add(new ComponentVersion(0, ThemeComponent.OVERLAY, ThemeVersion.CM12_PRE_VERSIONING));
                add(new ComponentVersion(1, ThemeComponent.BOOT_ANIM, 1));
                add(new ComponentVersion(ThemeVersion.CM12_PRE_VERSIONING, ThemeComponent.WALLPAPER, 1));
                add(new ComponentVersion(3, ThemeComponent.LOCKSCREEN, 1));
                add(new ComponentVersion(4, ThemeComponent.ICON, 1));
                add(new ComponentVersion(5, ThemeComponent.FONT, 1));
                add(new ComponentVersion(6, ThemeComponent.SOUND, 1));
            }
        };

        private ThemeVersionImpl2() {
        }

        public static ComponentVersion getDeviceComponentVersion(ThemeComponent component) {
            Iterator i$ = cVersions.iterator();
            while (i$.hasNext()) {
                ComponentVersion compVersion = i$.next();
                if (compVersion.component.equals(component)) {
                    return new ComponentVersion(compVersion);
                }
            }
            return null;
        }

        public static List<ComponentVersion> getDeviceComponentVersions() {
            ArrayList<ComponentVersion> versions = new ArrayList<>();
            versions.addAll(cVersions);
            return versions;
        }
    }

    /* loaded from: org.cyanogenmod.platform.sdk.jar:cyanogenmod/app/ThemeVersion$ThemeVersionImpl3.class */
    private static class ThemeVersionImpl3 {
        private ThemeVersionImpl3() {
        }

        public static ComponentVersion getDeviceComponentVersion(ThemeComponent component) {
            ThemeVersion.ComponentVersion[] arr$ = ThemeVersion.ComponentVersion.values();
            for (ThemeVersion.ComponentVersion version : arr$) {
                ComponentVersion sdkVersionInfo = fwCompVersionToSdkVersion(version);
                if (sdkVersionInfo.component.equals(component)) {
                    return sdkVersionInfo;
                }
            }
            return null;
        }

        public static List<ComponentVersion> getDeviceComponentVersions() {
            List<ComponentVersion> versions = new ArrayList<>();
            ThemeVersion.ComponentVersion[] arr$ = ThemeVersion.ComponentVersion.values();
            for (ThemeVersion.ComponentVersion version : arr$) {
                versions.add(fwCompVersionToSdkVersion(version));
            }
            return versions;
        }

        public static ComponentVersion fwCompVersionToSdkVersion(ThemeVersion.ComponentVersion version) {
            ThemeComponent component = ThemeComponent.UNKNOWN;
            ThemeComponent[] arr$ = ThemeComponent.values();
            for (ThemeComponent aComponent : arr$) {
                if (aComponent.id == version.id) {
                    component = aComponent;
                }
            }
            int id = version.id;
            String name = version.name();
            int minVersion = version.minSupportedVersion;
            int targetVersion = version.currentVersion;
            return new ComponentVersion(id, component, name, minVersion, targetVersion);
        }
    }
}
