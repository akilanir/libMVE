package com.github.paolorotolo.appintro;

/* loaded from: com.github.paolorotolo.appintro.3.4.0.jar:com/github/paolorotolo/appintro/PermissionObject.class */
public class PermissionObject {
    String[] permission;
    int position;

    public PermissionObject(String[] permission, int position) {
        this.permission = permission;
        this.position = position;
    }

    public String[] getPermission() {
        return this.permission;
    }

    public int getPosition() {
        return this.position;
    }
}
