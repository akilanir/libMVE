package eu.chainfire.libsuperuser;

import android.content.Context;
import android.os.Handler;
import android.widget.Toast;

/* loaded from: eu.chainfire.libsuperuser.1.0.0.201608240809.jar:eu/chainfire/libsuperuser/Application.class */
public class Application extends android.app.Application {
    private static Handler mApplicationHandler = new Handler();

    public static void toast(Context context, final String message) {
        if (context == null) {
            return;
        }
        if (!(context instanceof Application)) {
            context = context.getApplicationContext();
        }
        if (context instanceof Application) {
            final Context c = context;
            ((Application) context).runInApplicationThread(new Runnable() { // from class: eu.chainfire.libsuperuser.Application.1
                @Override // java.lang.Runnable
                public void run() {
                    Toast.makeText(c, message, 1).show();
                }
            });
        }
    }

    public void runInApplicationThread(Runnable r) {
        mApplicationHandler.post(r);
    }

    @Override // android.app.Application
    public void onCreate() {
        super.onCreate();
        try {
            Class.forName("android.os.AsyncTask");
        } catch (ClassNotFoundException e) {
        }
    }
}
