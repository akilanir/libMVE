package com.mikepenz.aboutlibraries.detector;

import android.content.Context;
import android.content.pm.PackageManager;
import android.text.TextUtils;
import com.mikepenz.aboutlibraries.entity.Library;
import java.util.ArrayList;
import java.util.List;

/* loaded from: com.mikepenz.aboutlibraries.5.6.5.jar:com/mikepenz/aboutlibraries/detector/Detect.class */
public class Detect {
    public static List<Library> detect(Context mCtx, List<Library> libraries) {
        ArrayList<Library> foundLibraries = new ArrayList<>();
        for (Library library : libraries) {
            if (!TextUtils.isEmpty(library.getClassPath())) {
                try {
                    Context ctx = mCtx.createPackageContext(mCtx.getPackageName(), 3);
                    Class<?> clazz = Class.forName(library.getClassPath(), false, ctx.getClassLoader());
                    if (clazz != null) {
                        foundLibraries.add(library);
                    }
                } catch (PackageManager.NameNotFoundException e) {
                } catch (ClassNotFoundException e2) {
                }
            }
        }
        return foundLibraries;
    }
}
