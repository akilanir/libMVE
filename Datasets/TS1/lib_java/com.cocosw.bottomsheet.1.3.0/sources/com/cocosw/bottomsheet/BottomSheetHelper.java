package com.cocosw.bottomsheet;

import android.app.Activity;
import android.content.ComponentName;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.support.annotation.NonNull;
import com.cocosw.bottomsheet.BottomSheet;
import java.util.List;

/* loaded from: com.cocosw.bottomsheet.1.3.0.jar:com/cocosw/bottomsheet/BottomSheetHelper.class */
public class BottomSheetHelper {
    public static BottomSheet.Builder shareAction(@NonNull final Activity activity, @NonNull final Intent intent) {
        BottomSheet.Builder builder = new BottomSheet.Builder(activity).grid();
        PackageManager pm = activity.getPackageManager();
        final List<ResolveInfo> list = pm.queryIntentActivities(intent, 0);
        for (int i = 0; i < list.size(); i++) {
            builder.sheet(i, list.get(i).loadIcon(pm), list.get(i).loadLabel(pm));
        }
        builder.listener(new DialogInterface.OnClickListener() { // from class: com.cocosw.bottomsheet.BottomSheetHelper.1
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(@NonNull DialogInterface dialog, int which) {
                ActivityInfo activityInfo = ((ResolveInfo) list.get(which)).activityInfo;
                ComponentName name = new ComponentName(activityInfo.applicationInfo.packageName, activityInfo.name);
                Intent newIntent = (Intent) intent.clone();
                newIntent.setFlags(270532608);
                newIntent.setComponent(name);
                activity.startActivity(newIntent);
            }
        });
        builder.limit(R.integer.bs_initial_grid_row);
        return builder;
    }
}
