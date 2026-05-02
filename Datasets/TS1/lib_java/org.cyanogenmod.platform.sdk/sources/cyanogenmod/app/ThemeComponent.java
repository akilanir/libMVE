package cyanogenmod.app;

/* loaded from: org.cyanogenmod.platform.sdk.jar:cyanogenmod/app/ThemeComponent.class */
public enum ThemeComponent {
    UNKNOWN(-1),
    OVERLAY(0),
    BOOT_ANIM(1),
    WALLPAPER(2),
    LOCKSCREEN(3),
    FONT(4),
    ICON(5),
    SOUND(6);

    public int id;

    ThemeComponent(int id) {
        this.id = id;
    }
}
